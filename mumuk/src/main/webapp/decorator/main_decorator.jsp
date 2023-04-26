<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="deco"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mumuk</title>
<deco:head></deco:head>
</head>
<body>
	<c:set var="id" value="${sessionScope.id}"></c:set>
	<c:if test="${empty id }">
		<jsp:include page="header_main.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty id }">
		<jsp:include page="header_mainLogin.jsp"></jsp:include>
	</c:if>
	<deco:body></deco:body>

</body>
</html>