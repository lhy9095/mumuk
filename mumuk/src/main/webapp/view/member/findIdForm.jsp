<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/login.css?ver=0");</style>
</head>
<body>
	<div class="container" >
		<form action="findId.ki" method="post">
			<div align="center">
				<img alt="" src="../../images/mumuk(logo).png" height="100"><br>
			</div>
			<div align="center">
				<input type="text" name="name" id="log" required="required" autofocus="autofocus" placeholder="이름"><br>
			</div>
			<div align="center">
				<input type="tel" name="tel" id="log" required="required" placeholder="전화번호"><br>
			</div>
			<div align="center">
				<input type="submit" class="btn" id="btn" value="아이디 찾기">
			</div>
		</form>
		<div>
			<table>
			<tr>
				<td width="130px" id="td3"><a href="joinForm.ki">회원 가입</a></td>
			</tr>
			</table>
		</div>
	</div>
</body>
</html>