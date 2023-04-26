package dao;

import java.io.Reader;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Restaurant;

public class RestaurantDao {
	// singleton
	private static RestaurantDao instance = new RestaurantDao();
	private RestaurantDao() {}
	public static RestaurantDao getInstance() {
		return instance;
	}

	// 멤버변수 앞에 static 붙어 있으면 객체를 생성하지 않고 바로 사용 가능, loading할 때 바로 사용 가능
	private static SqlSession session; // mybatis를 사용할 객체
	// {  } : 초기화 블럭
	// static {  } : 클래스 초기화 블럭
	// private static SqlSession session;으로 session 객체를 선언하고 초기화 블럭으로 초기화
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
	
	// 전체 식당 리스트 조회(최신순)
	public List<Restaurant> totalList(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("restaurantns.selectList", map);
	}
	
	// 전체 식당 리스트 조회(조회순)
	public List<Restaurant> listReadCount(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("restaurantns.listReadCount", map);
	}
	
	// 식당 리스트 paging total
	public int getTotal() {
		return (int)session.selectOne("restaurantns.getTotal");
	}
	
	// 식당 상세정보 select
	public Restaurant selectInfo(int rno) {
		return (Restaurant) session.selectOne("restaurantns.selectInfo", rno);
	}

	// 식당 상세정보 조회수 update
	public void readcountUpdate(int rno) {
		session.update("restaurantns.readcountUpdate", rno);
	}
	
	// 카테고리별 paging total
	public int cateTotal(String food_cate) {
		return (int)session.selectOne("restaurantns.cateTotal", food_cate);
	}
	
	// 카테고리별 식당 조회(최신순)
	public List<Restaurant> cateList(String food_cate, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("food_cate", food_cate);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("restaurantns.cateList", map);
	}
	
	// 카테고리별 식당 조회(조회순)
	public List<Restaurant> cateReadCount(String food_cate, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("food_cate", food_cate);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("restaurantns.cateReadCount", map);
	}
	
	// 여기부터 메뉴추천 1
	
	// 카테고리별 식당 조회(메뉴추천 1<step_1>)
	public List<Restaurant> cateListRe1(String selectedFood, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("selectedFood", selectedFood);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("restaurantns.cateListRe1", map);
	}
		
	// step_1 paging total
	public int cateTotal1(String selectedFood) {
		return (int)session.selectOne("restaurantns.cateTotal1", selectedFood);
	}
	
	// 카테고리별 식당 조회(메뉴추천 1<step_2>)
	public List<Restaurant> cateListRe2(String selectedFood, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("selectedFood", selectedFood);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("restaurantns.cateListRe2", map);
	}
			
	// step_2 paging total
	public int cateTotal2(String selectedFood) {
		return (int)session.selectOne("restaurantns.cateTotal2", selectedFood);
	}
	
	// 카테고리별 식당 조회(메뉴추천 1<step_3>)
	public List<Restaurant> cateListRe3(String selectedFood, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("selectedFood", selectedFood);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("restaurantns.cateListRe3", map);
	}
	
	// step_3 paging total
	public int cateTotal3(String selectedFood) {
		return (int)session.selectOne("restaurantns.cateTotal3", selectedFood);
	}
	
	public List<Restaurant> sepList() {
		return session.selectList("restaurantns.sepList");
		
	}
	public List<Restaurant> rnoList(String arrFinish) {
		return session.selectList("restaurantns.rnoList", arrFinish);
	}
	
	public List<Restaurant> rnoList2(String arrFinish) {
		return session.selectList("restaurantns.rnoList2", arrFinish);
	}

}
