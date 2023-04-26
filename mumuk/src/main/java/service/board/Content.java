package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Board;
import model.Member;
import dao.BoardDao;
import dao.MemberDao;

public class Content implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDao bd = BoardDao.getInstance();
		bd.readCountUpdate(num);  // 조회수 1증가
		Board board = bd.select(num);
		
		request.setAttribute("board", board);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		String id = request.getParameter("id");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		
		request.setAttribute("member", member);
		
		return "content.jsp";
	}

}
