package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Reply;

public class ReplyDao {
	// 	singleton, 메모리 절약 spring에서 default dao에서는 singleton
		private static ReplyDao instance = new ReplyDao();
		private ReplyDao() {} 
		public static ReplyDao getInstance() {
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
		public int insert(Reply reply) {
			int result = 0;
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "insert into rf values(rf_seq.nextval,?,?,sysdate,?,?,'n')";
			try {                                  
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, reply.getContent2());
				pstmt.setString(2, reply.getWriter2());
				pstmt.setString(3, reply.getPassword3());
				pstmt.setInt(4, reply.getBf_num());
				
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
		public Reply select(int re_no) {
			Reply reply = new Reply();
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from rf where re_no=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, re_no);
				rs =  pstmt.executeQuery();
				if (rs.next()) {
					reply.setRe_no(rs.getInt("re_no"));
					reply.setContent2(rs.getString("content2"));
					reply.setWriter2(rs.getString("writer2"));
					reply.setReg_date2(rs.getDate("reg_date2"));
					reply.setPassword3(rs.getString("password3"));
					reply.setBf_num(rs.getInt("bf_num"));
					reply.setDel(rs.getInt("del"));
				}
			}catch (Exception e) { System.out.println(e.getMessage());
			}finally {
				try{if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn  != null) conn.close();
				}catch (Exception e) {	}
			}
			return reply;
		}
//		public List<Reply> selectlist(int num) {
//			List<Reply> replylist = new ArrayList<Reply>();
//			Connection conn = getConnection();
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			String sql = "select * from rf where re_no=?";
//			try {
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, re_no);
//				rs =  pstmt.executeQuery();
//				if (rs.next()) {
//					reply.setRe_no(rs.getInt("re_no"));
//					reply.setContent2(rs.getString("content2"));
//					reply.setWriter2(rs.getString("writer2"));
//					reply.setReg_date2(rs.getDate("reg_date2"));
//					reply.setPassword3(rs.getString("password3"));
//					reply.setBf_num(rs.getInt("bf_num"));
//					reply.setDel(rs.getInt("del"));
//				}
//			}catch (Exception e) { System.out.println(e.getMessage());
//			}finally {
//				try{if (rs != null) rs.close();
//					if (pstmt != null) pstmt.close();
//					if (conn  != null) conn.close();
//				}catch (Exception e) {	}
//			}
//			return reply;
//		}
}
