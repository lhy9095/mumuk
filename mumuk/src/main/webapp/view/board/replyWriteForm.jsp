<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board/common.css">
<script type="text/javascript">
	function chk() {
		if (frm2.password3.value != frm2.password4.value) {
			alert("암호와 암호확인이 다릅니다"); frm2.password3.focus();
			frm2.password3.value = ""; frm2.password4.value = "";
			return false;
		}
	}
</script></head><body>

<main style="display: block; width:900px; margin:0 auto; position:relative; ">
<form action="replyWrite.do" method="post" name="frm2" onsubmit="return chk()">
	<input type="hidden" name="bf_num" value="${num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table><caption>댓글 작성</caption>
	<tr><th style="border-bottom: solid 0.2px; border-bottom-color: gainsboro;">작성자</th><td colspan="3" style="border-top: solid 3px; border-top-color: black;"><input type="text" name="writer2"
		required="required" style="float: left;"></td></tr>
	<tr><th style="border-bottom: solid 0.2px; border-bottom-color: gainsboro; border-top: solid 0.2px; border-top-color: gainsboro;">암호</th><td><input type="password" name="password3"
		required="required" style="float: left;"></td>
	<th style="border-bottom: solid 0.2px; border-bottom-color: gainsboro; border-top: solid 0.2px; border-top-color: gainsboro;">암호확인</th><td><input type="password" name="password4"
		required="required" style="float: left;"></td></tr>
	<tr><th style="border-bottom: solid 0.2px; border-bottom-color: gainsboro; border-top: solid 0.2px; border-top-color: gainsboro;">내용</th><td colspan="3"><textarea rows="5" cols="75" 
		name="content2" required="required" style="float: left;"></textarea></td></tr>
	<tr><th colspan="4" style="border-top: solid 0.2px; border-top-color: gainsboro;"><input type="submit" value="확인"></th></tr>
</table>
</form>
</main>

</body>
</html>



