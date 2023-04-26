package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;

public class WriteAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		int num = Integer.parseInt(request.getParameter("num"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		
		String pageNum = request.getParameter("pageNum");
		String subject = request.getParameter("subject");
		String writer = request.getParameter("writer"); 
		String content = request.getParameter("content");
		String password = request.getParameter("password");
		
		String ip = request.getRemoteAddr();  // 글쓰는 사람의 컴퓨터 ip번호
		board.setNum(num);
		board.setIp(ip);
		board.setContent(content);
		board.setPassword(password);
		board.setRe_level(re_level);
		board.setRe_step(re_step);
		board.setRef(ref);
		board.setSubject(subject);
		board.setWriter(writer); 

		BoardDao bd = BoardDao.getInstance();
		int result = bd.insert(board);

		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "write.jsp";
	}

}
