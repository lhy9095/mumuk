<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/myPage.css?ver=4");</style>
</head>
<body>
<div class="main_contain" >
		<div class="sidebar_contain">
		<ul class="sidebar">
			<li class="sidebar_ele"><img alt="" src="../../images/mumuk(icon).png"></li>
			<li class="sidebar_ele"><a href="view/member/myPageForm.ki?id=${id}">내 정보 수정</a></li>
			<li class="sidebar_ele"><a class="active" href="#">즐겨찾기 내역</a></li>
			<li class="sidebar_ele"><a href="#">내가 쓴 글</a></li>
			<li class="sidebar_ele"><a onclick="del()">회원탈퇴</a></li>
		</ul>
		</div>	
		<div class="restaurantView">
		<div class="restaurant_list">
			<!-- 전체 식당 리스트 -->
			<c:forEach var="restaurant" items="${list }">
				<div class="restaurant">
					<div class="thumbnail">
						<a href="/mumuk/view/restaurant/restaurantInfo.ha?rno=${restaurant.rno }"><img src="/mumuk/food_img/${restaurant.img1 }"></a>
					</div>
					<div class="info">
						<span class="title"> <a
							href="restaurantInfo.ha?rno=${restaurant.rno }">
								<h3>${restaurant.rname }</h3>
						</a>
						</span>
						<p class="addr">${restaurant.addr }</p>
						<p class="menu">${restaurant.menu1 }</p>
						<p class="menu">${restaurant.menu2 }</p>
						<p class="menu">${restaurant.menu3 }</p>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<!-- paging -->
		<div class="paging">
			<!-- 앞에 보여줄 것이 있다면 -->
			<c:if test="${startPage > PAGE_PER_BLOCK }">
				<button onclick="location.href='category.ki?pageNum=${startPage-1}&sort=${sort}'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<button onclick="location.href='categoryselected1.ki?pageNum=${i}&selectedFood=${selectedFood}&sort=${sort}'">${i}</button>
			</c:forEach>
			<!-- 아직 보여줄 것이 남아있다면 -->
			<c:if test="${endPage < totalPage }">
				<button onclick="location.href='category.ki?pageNum=${endPage+1}&sort=${sort}'">다음</button>
			</c:if>
		</div>
	</div>	
</div>
	
</body>
</html>