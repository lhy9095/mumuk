package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int result = 0;
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		
		if (member == null || member.getDel().equals("Y")) 
			result = -1; // 없는 아이디
		else {
			if (member.getPassword().equals(password)) {			
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				// session.setMaxInactiveInterval(3600); // 로그인 하면 세션 유지 시간 1시간
				result = 1;  // 로그인 성공
			}
		}
		request.setAttribute("result", result);
		return "login";
	}
}