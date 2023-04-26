package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
public class ConfirmId implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		String msg  = "";
		
		if (member != null) {
			msg="중복 아이디입니다";
		}
		else {
			msg="사용 가능합니다";
		}
		
		request.setAttribute("msg", msg);
		return "confirmId";
	}
}