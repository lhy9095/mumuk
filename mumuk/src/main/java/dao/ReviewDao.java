package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Review;

public class ReviewDao {
	// singleton
	private static ReviewDao instance = new ReviewDao();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
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
	
	// 리뷰 등록
	public int insert(Review review) {
		return session.insert("reviewns.insert", review);
	}
	
	// 해당 식당의 리뷰 리스트
	public List<Review> select(int rno, int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rno", rno);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("reviewns.select", map);
	}
	
	// 해당 식당의 총 리뷰 수
	public int getTotal(int rno) {
		return (int) session.selectOne("reviewns.selectTotal", rno);
	}


}
