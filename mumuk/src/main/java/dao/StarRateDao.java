package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class StarRateDao {
	// singleton
	private static StarRateDao instance = new StarRateDao();
	private StarRateDao() {}
	public static StarRateDao getInstance() {
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
	
	// 별점 등록
	public void insert(int star_rate, int rno, int mno) {
		Map<String, Object> map = new HashMap<>();
		map.put("star_rate", star_rate);
		map.put("rno", rno);
		map.put("mno", mno);
		session.insert("starRatens.insert", map);
	}
	
	// 평균 별점
	public float selectStar(int rno) {
		return (float) session.selectOne("starRatens.selectStar", rno);
	}
}
