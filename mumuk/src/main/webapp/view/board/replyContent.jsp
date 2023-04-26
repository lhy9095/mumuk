<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>머먹</title>
<style type="text/css">	@import url("../../css/board/common.css");</style>
<script type="text/javascript" src="../../js/jquery.js"></script>

</head><body>

<main style="display: block; width:900px; margin:0 auto; position:relative; ">
<table><caption>댓글 목록</caption>
	<tr><th style="border-bottom: solid 0.2px; border-bottom-color: gainsboro; border-top: solid 0.2px; border-top-color: gainsboro;">댓글번호</th><td>${reply.re_no }</td></tr>
	<tr><th style="border-bottom: solid 0.2px; border-bottom-color: gainsboro; border-top: solid 0.2px; border-top-color: gainsboro;">작성자</th><td>${reply.writer2 }</td></tr>
	<tr><th style="border-bottom: solid 0.2px; border-bottom-color: gainsboro; border-top: solid 0.2px; border-top-color: gainsboro;">작성일</th><td>${reply.reg_date2 }</td></tr>
	<tr><th style="border-bottom: solid 0.2px; border-bottom-color: gainsboro; border-top: solid 0.2px; border-top-color: gainsboro;">내용</th><td><pre>${reply.content2 }</pre></td></tr>
</table><p>

<%-- <div>
	<button onclick="location.href='list.do?pageNum=${pageNum}'" style="float: right;" class="btn btn-outline-secondary">게시글 목록</button>
	<button onclick="location.href='deleteForm.do?num=${num}&pageNum=${pageNum}'" style="float: right;" class="btn btn-outline-secondary">삭제</button>
	<button onclick="location.href='updateForm.do?num=${num}&pageNum=${pageNum}'" style="float: right;" class="btn btn-outline-secondary">수정</button>	
	<button onclick="location.href='writeForm.do?num=${num}&pageNum=${pageNum}'">답변</button>
</div><p> --%>

</main>


</body>
</html>