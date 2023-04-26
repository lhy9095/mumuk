<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/login.css?ver=3");</style>
</head>
<body>
	<div class="container">
		<form action="/mumuk/view/member/preMyPage.ki" method="post">
		<div align="center" class="announcement"><h3>가입하신 아이디와 비밀번호를 입력 해 주세요</h3></div>
		<div align="center">
			<input type="text" name="id" id="log" autofocus="autofocus" placeholder="아이디">
		</div>
		<div align="center">
			<input type="password" name="password" id="log" placeholder="비밀번호">
		</div>
		<div align="center">
			<input type="submit" class="btn" id="btn" value="마이페이지 이동">
		</div>
		</form>
	</div>
</body>
</html>