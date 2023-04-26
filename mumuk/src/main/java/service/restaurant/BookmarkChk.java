package service.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookmarkDao;
import dao.MemberDao;
import model.Bookmark;
import model.Member;

public class BookmarkChk implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		String id = request.getParameter("id");
		
		// 회원이 해당 식당을 북마크 했는지 확인
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		int mno = member.getMno();
		
		BookmarkDao bmd = BookmarkDao.getInstance();
		Bookmark bmChk = bmd.select(rno, mno);
		
		if (bmChk != null) {
			return "bookmarkInsert";
		} else {
			return "bookmarkDelete";
		}
	}

}
