<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>머먹</title>
<style type="text/css">	@import url("../../css/board/common.css");</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<!-- <script type="text/javascript">
	$(function() {  // 화면이 띄면 바로 적용 
		$('#disp').load("list.do?pageNum=${pageNum}");  // id가 disp인 곳에 list.jsp보여줘
	});
</script> -->

</head><body>
<%@ include file="sessionChk.jsp" %>

<main style="display: block; width:900px; margin:0 auto; position:relative; ">
<table><caption>게시글 상세 보기</caption>
	<tr><th>제목</th><td style="border-top: solid 3px; border-top-color: black;">${board.subject }</td></tr>
	<tr><th class="content1">작성자</th><td>${board.writer }</td></tr>
	<tr><th class="content1">조회수</th><td>${board.readcount }</td></tr>
	<tr><th class="content1">작성일</th><td>${board.reg_date }</td></tr>
	<tr><th class="content1">내용</th><td><pre>${board.content }</pre></td></tr>
</table><p>

<div class="btn_box">
	<button onclick="location.href='list.do?pageNum=${pageNum}&id=${id}'" style="float: right;" class="btn4"">게시글 목록</button>
	<button onclick="location.href='deleteForm.do?num=${num}&pageNum=${pageNum}'" style="float: right;" class="btn4">삭제</button>
	<button onclick="location.href='updateForm.do?num=${num}&pageNum=${pageNum}'" style="float: right;" class="btn4">수정</button>	
	<button onclick="location.href='writeForm.do?num=${num}&pageNum=${pageNum}&id=${id}'" style="float: right;" class="btn4">답변</button>
</div><p>

</main>

<!-- <div id="disp"></div> -->

</body>
</html>