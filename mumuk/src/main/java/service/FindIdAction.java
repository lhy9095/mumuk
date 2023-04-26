package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class FindIdAction implements CommandProcess {
public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select3(name, tel);
		
		request.setAttribute("member", member);
		
		return "findId";
	}
}
