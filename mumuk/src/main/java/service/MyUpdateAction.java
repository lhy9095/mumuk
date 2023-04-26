package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
public class MyUpdateAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");
		String tel = request.getParameter("tel");
		
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setNickName(nickName);
		member.setTel(tel);
		

		MemberDao md =  MemberDao.getInstance();
		int result = md.update(member);
		
		request.setAttribute("result", result);
		return "myUpdate";
	}
}