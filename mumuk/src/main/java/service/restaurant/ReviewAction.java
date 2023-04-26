package service.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.ReviewDao;
import dao.StarRateDao;
import model.Member;
import model.Review;

public class ReviewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int star_rate = Integer.parseInt(request.getParameter("star_rate"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		int mno = member.getMno();
		
		// 별점 등록
		StarRateDao sd = StarRateDao.getInstance();
		sd.insert(star_rate, rno, mno);
		
		// 리뷰 등록
		Review review = new Review();
		review.setContent(content);
		review.setRno(rno);
		review.setMno(mno);
		
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.insert(review);
				
		request.setAttribute("result", result);
		request.setAttribute("rno", rno);		
	
		return "review";
	}


}
