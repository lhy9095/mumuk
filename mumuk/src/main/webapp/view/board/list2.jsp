<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">@import url("../../css/board/common.css?ver=0");</style>
</head><body>

<main>
<table><caption>밥친구 게시판</caption>
	<tr><th colspan="2">제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
<c:if test="${empty list }">
	<tr><th colspan="5">게시글이 없습니다</th></tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="board" items="${list }">
							<!-- EL에서는 num--가 없음 -->
		<tr><td>${num}<c:set var="num" value="${num - 1}"></c:set> </td>
			<c:if test="${board.del == 'y' }">
				<td colspan="4">삭제된 글입니다</td>
			</c:if>
			<c:if test="${board.del != 'y' }">
			<!-- title은 풍선 도움말 또는 미리 보기 -->
				<td title="${board.content }">
					<!-- 답변글 -->
					<c:if test="${board.re_level > 0}">
						<img alt="" src="images/level.gif" height="5" 
							width="${board.re_level*10 }">
						<img alt="" src="images/re.gif">
					</c:if>
					<a href="content.do?num=${board.num }&pageNum=${currentPage}" class="list1">
						${board.subject }</a>
					<c:if test="${board.readcount > 50 }">
						<img alt="" src="images/hot.gif">
					</c:if></td>
		 		<td>${board.writer }</td>
				<td>${board.reg_date }</td>
				<td>${board.readcount }</td>
			</c:if>
		</tr>
	</c:forEach>
</c:if>
</table>
<div align="center">
	<!-- 앞에 보여줄이 있어 -->
	<c:if test="${startPage - PAGE_PER_BLOCK > 0 }">
		<button onclick="location.href='list.do?pageNum=${startPage-1}'" class="btn btn-outline-secondary">이전</button>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<button onclick="location.href='list.do?pageNum=${i}'" class="btn">${i}</button>
	</c:forEach>
	<!-- 아직 보여줄 것이 남아 있다 -->
	<c:if test="${endPage - totalPage < 0 }">
		<button onclick="location.href='list.do?pageNum=${endPage+1}'" class="btn btn-outline-secondary">다음</button>
	</c:if>
	<p><button onclick="location.href='writeForm.do?num=0&pageNum=1'" style="float: right; margin-right: 50px;" class="btn btn-outline-secondary">글쓰기</button>
	<br><br><p>
	<form class="table-form" action="list.do">
			<select name="f" style="height: 40px">
				<option value="subject" <c:if test="${f eq 'subject'}">selected</c:if>>제목</option>		
				<option value="writer"<c:if test="${f eq 'writer'}">selected</c:if>>작성자</option>
				<option value="content" <c:if test="${f eq 'content'}">selected</c:if>>내용</option>
			</select>
			<input type="text" name="q" value="${param.q}" style="height: 40px" placeholder="검색어를 입력해주세요">
			<input class="btn btn-outline-secondary" type="submit" value="검색">	<!-- style="color: white; background: darkorange;" --> 
	</form>
</div>
</main>
	
</body>
</html>