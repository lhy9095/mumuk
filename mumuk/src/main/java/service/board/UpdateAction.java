package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;

public class UpdateAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		int num = Integer.parseInt(request.getParameter("num"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pageNum = request.getParameter("pageNum");
		String password = request.getParameter("password");
		
		board.setContent(content);
		board.setNum(num);
		board.setSubject(subject);
		board.setPassword(password);
		
		BoardDao bd = BoardDao.getInstance();
		int result  = bd.update(board); 

		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "update.jsp";
	}

}
