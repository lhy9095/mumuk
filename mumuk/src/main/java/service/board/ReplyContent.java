package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;

public class ReplyContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		ReplyDao rd = ReplyDao.getInstance();
//		List<Reply> replylist = rd.selectlist(num);
		
//		request.setAttribute("replylist", replylist);
		request.setAttribute("num", num);
		request.setAttribute("re_no", re_no);
		request.setAttribute("pageNum", pageNum);
		
		return "replyContent.jsp";
	}

}
