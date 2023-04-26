package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import model.Reply;

public class ReplyWriteAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Reply Reply = new Reply();
//		int re_no = Integer.parseInt(request.getParameter("re_no"));
		int bf_num = Integer.parseInt(request.getParameter("bf_num"));
		
		String pageNum = request.getParameter("pageNum");
		String writer2 = request.getParameter("writer2");
		String content2 = request.getParameter("content2");
		String password3 = request.getParameter("password3");
		
//		Reply.setRe_no(re_no);
		Reply.setBf_num(bf_num);
		Reply.setContent2(content2);
		Reply.setPassword3(password3);
		Reply.setWriter2(writer2);

		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.insert(Reply);

		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bf_num", bf_num);
		
		return "replyWrite.jsp";
	}

}
