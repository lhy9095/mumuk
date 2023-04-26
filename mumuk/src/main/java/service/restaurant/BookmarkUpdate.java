package service.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookmarkDao;
import dao.MemberDao;
import model.Bookmark;
import model.Member;

public class BookmarkUpdate implements CommandProcess {

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
		int bm;
		
		if (bmChk == null) {
			bmd.insert(rno, mno);  // 북마크 추가
			bm = 1;
			return "bookmarkInsert";
		} else {
			bmd.delete(rno, mno);  // 북마크 취소
			bm = 0;
			return "bookmarkDelete";
		}
		
		
	}

}
