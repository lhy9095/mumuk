package service.restaurant;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RestaurantDao;
import model.Restaurant;

public class RestaurantList implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		RestaurantDao rd = RestaurantDao.getInstance();	
		String sort = request.getParameter("sort");	
		
		// 페이징
		final int ROW_PER_PAGE = 3; // 한 페이지에 3개씩
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
		int total = rd.getTotal();
		// Math.ceil : 현재 숫자 이상인 정수 중에서 가장 작은 정수
		int totalPage = (int)Math.ceil((double)total / ROW_PER_PAGE);
//		시작페이지 구하는 식 = 현재페이지 - (현재페이지 - 1)%10(=블럭 당 페이지 숫자)
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;	
//		endPage 구하는 식 = 시작페이지 + 블록 당 페이지 수 - 1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
//		만약 endPage가 총페이지보다 크면 endPage는 총페이지로 변경
		if (endPage > totalPage) endPage = totalPage;	
				
		List<Restaurant> list = null;
		
		if (sort == null || sort.equals("") || sort.equals("latestSort")) {
			// 최신순 식당 전체 리스트
			list = rd.totalList(startRow, endRow);
		} else {
			// 조회순 식당 전체 리스트 
		    list = rd.listReadCount(startRow, endRow);
		};

		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);	
		request.setAttribute("sort", sort);
		return "restaurantList";
	}

}
