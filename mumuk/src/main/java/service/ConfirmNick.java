package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
public class ConfirmNick implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String nickName = request.getParameter("nickName");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(nickName);
		String msg  = "";
		
		if (member != null) {
			msg="중복된 별명입니다";
		}
		else {
			msg="사용 가능합니다";
		}
		
		request.setAttribute("msg", msg);
		return "confirmNick";
	}
}