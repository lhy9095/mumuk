<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/findResult.css");</style>
</head>
<body>
	<div class="contain">
		<h1 class="title">비밀번호 찾기 결과</h1>
		<c:if test="${member != null}">
			당신의 비밀번호는 '${member.password}' 입니다.
		</c:if>

		<c:if test="${member == null}">
			존재하지 않는 회원정보 입니다.
		</c:if>
	</div>
	<div align="center" class="btn">
		<input type="button" onclick="location.href='../member/loginForm.ki'" value="로그인">
	</div>
</body>
</html>