<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/board/common.css");</style>

</head><body>

<img alt="" src="bg.png" style="margin-left: 500px"><p>
<c:forEach var="i" begin="0" end="${resLength-1}">
	<div class="mumu">
		<a href="/mumuk/view/restaurant/restaurantInfo.ha?rno=${resList[i] }" class="mumu2">${resName[i] }<p>
		<img class="img" alt="" src="/mumuk/food_img/${img1[i] }" onclick="clickBtn();"></a>
	</div>
	
</c:forEach>

</body>
</html>