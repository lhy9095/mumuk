<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- <%@ include file="sessionChk.jsp" %> --%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board/common.css">
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호확인이 다릅니다"); frm.password.focus();
			frm.password.value = ""; frm.password2.value = "";
			return false;
		}
	}
</script></head><body>
<%@ include file="sessionChk.jsp" %>

<form action="write.do?writer=${member.nickName }" method="post" name="frm" onsubmit="return chk()">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<!-- 답변 게시글 용 처음글은 ref/re_level/re_step 모두 0인데 답변글은 ref/re_level/re_step이 읽은 글 정보-->
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_level" value="${re_level}">
	<input type="hidden" name="re_step" value="${re_step}">
<table><caption>게시글 작성</caption>
	<tr><th class="update1">제목</th><td class="update1"><input type="text" name="subject"
		required="required"	autofocus="autofocus"></td></tr>
	<tr><th class="content1">작성자</th><td>${member.nickName }</td></tr>
	<tr><th class="content1">암호</th><td><input type="password" name="password"
		required="required"></td></tr>
	<tr><th class="content1">암호확인</th><td><input type="password" name="password2"
		required="required"></td></tr>
	<tr><th class="content1">내용</th><td><textarea rows="5" cols="40" 
		name="content" required="required"></textarea></td></tr>
	<tr><th colspan="2" class="content1"><input type="submit" value="확인" class="btn5"></th></tr>
</table>
</form>
</body>
</html>