package service.restaurant;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RestaurantDao;
import dao.ReviewDao;
import dao.StarRateDao;
import model.Restaurant;
import model.Review;

public class RestaurantInfo implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));

		RestaurantDao rd = RestaurantDao.getInstance();
		rd.readcountUpdate(rno);  // 조회수 1 증가
		Restaurant rs = rd.selectInfo(rno);

		// 리뷰 페이징
		final int ROW_PER_PAGE = 3; // 한 페이지에 5개씩
		final int PAGE_PER_BLOCK = 10; // 한 블럭에 10페이지
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		//    시작번호    (페이지번호 - 1) * 페이지당 개수 + 1       
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		//   끝번호     시작번호  + 페이지당 개수   -1 
		int endRow = startRow + ROW_PER_PAGE - 1;
		
		ReviewDao rvd = ReviewDao.getInstance();
		// 해당 식당의 리뷰 리스트
		List<Review> list = rvd.select(rno, startRow, endRow);
		
		// 해당 식당의 총 리뷰 수
		int total = rvd.getTotal(rno);
		
		// Math.ceil : 현재 숫자 이상인 정수 중에서 가장 작은 정수
		int totalPage = (int)Math.ceil((double)total / ROW_PER_PAGE);
		//				시작페이지 구하는 식 = 현재페이지 - (현재페이지 - 1)%10(=블럭 당 페이지 숫자)
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;	
		//				endPage 구하는 식 = 시작페이지 + 블록 당 페이지 수 - 1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		//				만약 endPage가 총페이지보다 크면 endPage는 총페이지로 변경
		if (endPage > totalPage) endPage = totalPage;	

		// 평균 별점
		float star_rate;
		StarRateDao sd = StarRateDao.getInstance();

		// 별점(리뷰)이 없을때 제어
		if (list.size() == 0) {
			star_rate = 0;
		} else {
			star_rate = (float) sd.selectStar(rno);
		}		
		
		request.setAttribute("restaurant", rs);
		request.setAttribute("list", list);
		request.setAttribute("rno", rno);
		request.setAttribute("total", total);
		request.setAttribute("star_rate", star_rate);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
			
		return "restaurantInfo";
	}

}
