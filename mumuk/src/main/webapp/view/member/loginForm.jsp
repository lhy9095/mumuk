<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MumukLogin</title>
<!-- ver 붙여주니 바로 적용된다 -->
<style type="text/css">@import url("../../css/member/login.css?ver=0");</style>
</head>
<body>
	<div class="container" >
		<form action="login.ki" method="post">
			<div align="center">
				<img alt="" src="../../images/mumuk(logo).png" height="100"><br>
			</div>
			<div align="center">
				<input type="text" name="id" id="log" required="required" autofocus="autofocus" placeholder="아이디"><br>
			</div>
			<div align="center">
				<input type="password" name="password" id="log" required="required" placeholder="비밀번호"><br>
			</div>
			<div align="center">
				<input type="submit" class="btn" id="btn" value="로그인">
			</div>
		</form>
		<div>
			<table>
			<tr>
				<td width="130px"><a href="findIdForm.ki" target="_self">아이디 찾기</a></td>
				<td width="130px" id="td2"><a href="findPwForm.ki" >비밀번호 찾기</a></td>
				<td width="130px" id="td3"><a href="joinForm.ki">회원 가입</a></td>
			</tr>
			</table>
		</div>
	</div>
</body>
</html>