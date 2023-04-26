package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Board;
import dao.BoardDao;

public class DeleteAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("ppassword");

		board.setNum(num);
		board.setPassword(password);
		
		BoardDao bd = BoardDao.getInstance();
		int result = bd.delete(num, password);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "delete.jsp";
	}

}
