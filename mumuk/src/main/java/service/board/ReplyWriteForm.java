package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyWriteForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	//	int re_no = 0; 
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
	//	if(request.getParameter("re_no")!=null && !request.getParameter("re_no").equals(""))
	//		re_no = Integer.parseInt(request.getParameter("re_no"));
	//	if(re_no!=0){		// 0이 아니면 답변글 (0은 처음 쓴 글)
	//		ReplyDao rd = ReplyDao.getInstance();
	//		Reply reply = rd.select(re_no);
	//	}
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		return "replyWriteForm.jsp";
	}

}
