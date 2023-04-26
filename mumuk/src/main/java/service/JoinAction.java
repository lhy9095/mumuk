package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
public class JoinAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;		
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email_id = request.getParameter("email_id");
		String email_domain = request.getParameter("email_domain");
		String tel = request.getParameter("tel");
		String nickName = request.getParameter("nickName");
		
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setEmail_id(email_id);
		member.setEmail_domain(email_domain);
		member.setTel(tel);
		member.setNickName(nickName);
		
		MemberDao md = MemberDao.getInstance();
		Member member2 = md.select(id);
		if (member2 == null) {
			result = md.insert(member);
		}
		else {
			result = -1;
		}
		
		request.setAttribute("result", result);
		return "join";
	}
}