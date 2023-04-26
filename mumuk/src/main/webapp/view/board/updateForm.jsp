<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- <%@ include file="sessionChk.jsp" %> --%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/board/common.css");</style>
</head><body>
<%@ include file="sessionChk.jsp" %>

<form action="update.do" method="post" name="frm">
	<!-- 여기다가 hidden 암호를 감추고 password와 비교하면 소스보기를 통하여 암호가 노출 -->
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table><caption>게시글 수정</caption>
	<tr><th class="update1">제목</th><td class="update1"><input type="text" name="subject" value="${board.subject}"
		required="required" autofocus="autofocus"></td></tr>
	<!-- textarea, file은 value 속성이 없음 -->
	<tr><th class="content1">내용</th><td><pre><textarea rows="5" cols="40" required="required"
		name="content">${board.content }</textarea></pre></td></tr>
	<tr><th class="content1">암호</th><td><input type="password" name="password" 
		required="required"></td></tr>
	<tr><th colspan="2" class="content1"><input type="submit" value="확인" class="btn5"></th></tr>
</table>
</form>
</body>
</html>