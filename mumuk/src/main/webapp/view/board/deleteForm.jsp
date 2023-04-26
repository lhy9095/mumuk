<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="sessionChk.jsp" %> --%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/board/common.css");</style>
</head><body>
<%@ include file="sessionChk.jsp" %>

<form action="delete.do">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table><caption>게시글 삭제</caption>
	<tr><th class="update1">암호</th><td class="update1"><input type="password" name="ppassword" required="required" autofocus="autofocus"></td></tr>
	<tr><th colspan="2" class="content1"><input type="submit" value="확인" class="btn5"></th></tr>
</table>
</form>

</body>
</html>