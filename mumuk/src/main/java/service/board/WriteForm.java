package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.MemberDao;
import model.Board;
import model.Member;

public class WriteForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = 0, ref = 0, re_level = 0, re_step = 0; 
		String pageNum = request.getParameter("pageNum");
		num = Integer.parseInt(request.getParameter("num"));
		if(num!=0){		// 0이 아니면 답변글 (0은 처음 쓴 글)
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(num);
			ref = board.getRef();				
			re_step = board.getRe_step();
			re_level = board.getRe_level();
		}
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("ref", ref);
		request.setAttribute("re_level", re_level);
		request.setAttribute("re_step", re_step);
		
		String id = request.getParameter("id");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		
		request.setAttribute("member", member);
		
		return "writeForm.jsp";
	}

}
