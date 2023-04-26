package dao;
import java.io.Reader;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Bookmark;
import model.Member;

public class MemberDao {
	// singleton 하나의 객체를 공유
	private static MemberDao instance = new MemberDao(); // static instance

	private MemberDao() {
	} // 생성자는 private

	public static MemberDao getInstance() { // 메서드를 통하여 instance
		return instance;
	}

	/* 멤버변수 앞에 static붙어 있으면 객체를 생성하지 않고 바로 사용 가능, loading바로 사용가능 */
	private static SqlSession session; // mybatis를 사용할 객체
	// 초기화 블럭 { }, static { } 클래스 초기화 블럭
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 아이디 중복
	public Member select(String id) {
		return (Member) session.selectOne("memberns.select", id);
	}
	
	// 별명 중복
	public Member select2(String nickName) {
		return (Member) session.selectOne("memberns.select2", nickName);
	}
	
	// 아이디 찾기
	public Member select3(String name, String tel) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("name", name);
		hm.put("tel", tel);
		return (Member) session.selectOne("memberns.select3", hm);
	}
	
	// 비밀번호 찾기
	public Member select4(String id, String name) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("id", id);
		hm.put("name", name);
		return (Member) session.selectOne("memberns.select4", hm);
	}
	
	// 마이페이지 아이디와 비밀번호 확인
	public Member select5(String id, String password) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("id", id);
		hm.put("password", password);
		return (Member) session.selectOne("memberns.select5", hm);
	}
	
	// mno로 회원 정보 조회
	public Member select(int mno) {
		return (Member) session.selectOne("memberns.selectReserve", mno);
	}

	// 회원 가입
	public int insert(Member member) {
		return session.insert("memberns.insert", member);
	}

	// 회원 정보 수정
	public int update(Member member) {
		return session.update("memberns.update", member);
	}

	// 회원 탈퇴
	public int delete(String id) {
		return session.update("memberns.delete", id);
	}

//	public List<Member> list(int startRow, int endRow) {
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		return session.selectList("memberns.list", map);
//	}

	public int getTotal() {
		return (int) session.selectOne("memberns.getTotal");
	}

}