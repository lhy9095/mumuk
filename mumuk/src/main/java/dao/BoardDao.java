package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Board;
public class BoardDao {  
	// singleton, 메모리 절약 spring에서 default dao에서는 singleton
	private static BoardDao instance = new BoardDao();
	private BoardDao() {} // 이게 없으면 default로 public BoardDao() {}
	public static BoardDao getInstance() {
		return instance;
	}
	// database connection pool
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {
			System.out.println("연결에러 : "+e.getMessage());
		}
		return conn;
	}
//	public List<Board> list() {
//	public List<Board> list(int startRow, int endRow) {
	public List<Board> list(int startRow, int endRow, String q, String f) {
		List<Board> list = new ArrayList<Board>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		String sql = "select * from board1 order by num desc";
// mysql select * from board1 order by num desc limt startRow - 1, 10;
// oracle
//		String sql = "select * from (select rowNum rn, a.* from ("
//				+ " select * from board1 order by num desc) a) "
//				+ " where rn between ? and ?";
		String sql = "select * from (select rowNum rn, a.* from ("
				+ " select * from bf order by ref desc, re_step) a) "
				+ " where rn between ? and ? and del = 'n'";			// and del = 'n' 추가 했음
//		String sql2 = "select * from (select rowNum rn, a.* from ("
//				+ " select * from bf where subject like ? order by ref desc, re_step) a) "
//				+ " where rn between ? and ?";
		String sql2 = "select * from (select rowNum rn, a.* from ("
				+ " select * from bf where "+f+" like ? order by ref desc, re_step) a) "
				+ " where rn between ? and ?";
		try {
			if(q==null || q.equals("")) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, "%" + q +"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			rs =  pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer")); 
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setReadcount(rs.getInt("readcount"));
				board.setPassword(rs.getString("password"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
				board.setIp(rs.getString("ip"));
				board.setReg_date(rs.getDate("reg_date"));
				board.setDel(rs.getString("del"));
				
				list.add(board);
			}
		}catch (Exception e) { System.out.println(e.getMessage());
		}finally {
			try{if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn  != null) conn.close();
			}catch (Exception e) {	}
		}
		return list;
	}
	public int insert(Board board) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into bf values(?,?,?,?,0,?,?,?,?,?,sysdate,'n')";
		// 게시판에서 글번호를 읽은후 가장 큰번호에 1을 다하면 새로 게시글 번호 단 null일 때 0일 때 0으로
		String sql2= "select nvl(max(num),0) + 1 num from bf";
		// 읽은 글의 ref가 같고 re_step이 읽은 글보다 큰 글은 re_step + 1
		String sqlUp = "update bf set re_step = re_step+1 where ref=? and re_step > ?";
		try {                                  // num은 별칭
			// sql을 실행하기 전에 sql2를 실행하여 num을 자져올 수 있다
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			rs.next(); // 무조건 참(번호를 하나 구하는 것이므로 1건)
			// ()에 쓸수 있는 컬럼명 또는 컬럼순서
			int number = rs.getInt(1);  // 별칭을 num을 했을 경우 1대신에 "num" 가능
			pstmt.close();
			if(board.getNum() != 0 ) {	// 답변글
				pstmt = conn.prepareStatement(sqlUp);
				pstmt.setInt(1, board.getRef());
				pstmt.setInt(2, board.getRe_step());
				pstmt.executeUpdate();
				pstmt.close();
				board.setRe_step(board.getRe_step()+1);
				board.setRe_level(board.getRe_level()+1);
			} else board.setRef(number); 		// 처음에 글을 입력하면 ref와 num은 같다
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getPassword());
			// 답변글 시작
			pstmt.setInt(6, board.getRef());	// 답변글은 읽은 글의 ref, 답변글이 아니면 위에서 바뀐 ref
			pstmt.setInt(7, board.getRe_step());
			pstmt.setInt(8, board.getRe_level());
			// 답변글 끝
			pstmt.setString(9, board.getIp());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) { System.out.println(e.getMessage());
		}finally {
			try{if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn  != null) conn.close();
			}catch (Exception e) {	}
		}
		return result;
	}
	public void readCountUpdate(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		// 조회수 1증
		String sql = "update bf set readcount = readcount+1 where num=?";
		try {                                  // num은 별칭
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
		
			pstmt.executeUpdate();
		}catch (Exception e) { System.out.println(e.getMessage());
		}finally {
			try{
				if (pstmt != null) pstmt.close();
				if (conn  != null) conn.close();
			}catch (Exception e) {	}
		}
	}
	public Board select(int num) {
		Board board = new Board();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bf where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs =  pstmt.executeQuery();
			if (rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setReadcount(rs.getInt("readcount"));
				board.setPassword(rs.getString("password"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
				board.setIp(rs.getString("ip"));
				board.setReg_date(rs.getDate("reg_date"));
				board.setDel(rs.getString("del"));
			}
		}catch (Exception e) { System.out.println(e.getMessage());
		}finally {
			try{if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn  != null) conn.close();
			}catch (Exception e) {	}
		}
		return board;
	}
	public int update(Board board) { // board는 화면에서 입력한 데이터
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update bf set subject=?, content=? where num=?";
		// num에 해당하는 DB에 있는 데이터를 board2
		Board board2 = select(board.getNum());  
		if (board.getPassword().equals(board2.getPassword())) {
			try {                                 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getSubject());
				pstmt.setString(2, board.getContent());
				pstmt.setInt(3, board.getNum()); 
				
				result = pstmt.executeUpdate();
			}catch (Exception e) { System.out.println(e.getMessage());
			}finally {
				try{if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn  != null) conn.close();
				}catch (Exception e) {	}
			}
		} else result = -1; // 암호가 불일치		
		return result;
	}
	public int delete(int num, String password) { 
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update bf set del='y' where num=?";
		// num에 해당하는 DB에 있는 데이터를 board2
		Board board2 = select(num);  
		if (password.equals(board2.getPassword())) {
			try {                                 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num); 				
				result = pstmt.executeUpdate();
			}catch (Exception e) { System.out.println(e.getMessage());
			}finally {
				try{if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn  != null) conn.close();
				}catch (Exception e) {	}
			}
		} else result = -1; // 암호가 불일치		
		return result;
	}
	public int getTotal(String q, String f ) {
		int total = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from bf";
		String sql2 = "select count(*) from bf where "+f+" like ?";
		try {
			if(q==null || q.equals("")) {
				pstmt = conn.prepareStatement(sql);
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, "%" + q +"%");
//				pstmt.setString(1, "%||" + q +"||%");
			}
			
			
			rs =  pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);				
			}
		}catch (Exception e) { System.out.println(e.getMessage());
		}finally {
			try{if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn  != null) conn.close();
			}catch (Exception e) {	}
		}
		return total;
	}
}