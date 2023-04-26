package service.restaurant;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.RestaurantDao;
import model.Member;
import model.Restaurant;

public class ReviewForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		String id = request.getParameter("id");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		RestaurantDao rd = RestaurantDao.getInstance();
		Restaurant rs = rd.selectInfo(rno);
		
		String rname = rs.getRname();
		String nickName = member.getNickName();
		
		request.setAttribute("rname", rname);
		request.setAttribute("nickName", nickName);
		request.setAttribute("rno",	rno);
		request.setAttribute("id", id);
		
		return "reviewForm";
	}

}
