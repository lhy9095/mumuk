package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class PreMyPageAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int result = 0;
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select5(id, password);
		
//		System.out.println("member = " +member);
		if (member == null) {
			result = -1; // 없는 회원임
		}			
		else {
			if (member.getPassword().equals(password)) {			
				result = 1;  // 마이페이지로 가자
			}
		}
		request.setAttribute("result", result);
		return "preMyPage";
	}

}
