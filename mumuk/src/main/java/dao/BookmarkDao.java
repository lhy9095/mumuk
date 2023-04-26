package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Bookmark;

public class BookmarkDao {
	// singleton
		private static BookmarkDao instance = new BookmarkDao();
		private BookmarkDao() {}
		public static BookmarkDao getInstance() {
			return instance;
		}

		private static SqlSession session; // mybatis를 사용할 객체
		static {
			try {
				// configuration.xml 읽어와
				Reader reader = Resources.getResourceAsReader("configuration.xml");
				SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
				session = ssf.openSession(true);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}
		
		// 회원이 해당 식당을 북마크 했는지 조회
		public Bookmark select(int rno, int mno) {
			Map<String, Integer> map = new HashMap<>();
			map.put("rno", rno);
			map.put("mno", mno);
			return (Bookmark) session.selectOne("bookmarkns.select", map);
		}
		
		// 북마크 추가
		public void insert(int rno, int mno) {
			Map<String, Integer> map = new HashMap<>();
			map.put("rno", rno);
			map.put("mno", mno);
			session.insert("bookmarkns.insert", map);
			
		}
		
		public void delete(int rno, int mno) {
			Map<String, Integer> map = new HashMap<>();
			map.put("rno", rno);
			map.put("mno", mno);
			session.delete("bookmarkns.delete", map);
		}
		
		
		// 마이페이지 북마크 선택
		public Bookmark select2(int dno, int mno) {
			HashMap<String, Integer> hm = new HashMap<String, Integer>();
			hm.put("dno", dno);
			hm.put("mno", mno);
			return (Bookmark) session.selectOne("bookmarkns.select", hm);
		}
		
		
		// 마이페이지 북마크 조회
		public List<Bookmark> myList(int mno, int startRow, int endRow) {
			HashMap<String, Integer> hm = new HashMap<String, Integer>();
			hm.put("mno", mno);
			hm.put("startRow", startRow);
			hm.put("endRow", endRow);
			return session.selectList("bookmarkns.myList", hm);
		}
		
		// 마이페이지 - 북마크 한 수
		public int getTotalMy(int mno) {
			return (int) session.selectOne("bookmarkns.getTotalMy", mno);
		}	
}
