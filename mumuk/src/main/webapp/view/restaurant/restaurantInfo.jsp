<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/mumuk/css/restaurant/restaurantInfo.css");
</style>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=scgoiv7jf5"></script>
<script type="text/javascript" src="/mumuk/js/jquery.js"></script>
<script type="text/javascript">
	<c:set var="id" value="${sessionScope.id}" ></c:set>
	/* 회원이 북마크한 식당은 페이지 로드 시 북마크 색깔 바뀌도록 */
	$(function bmChk() {
		<c:if test="${!empty id }">
		
		$.ajax({
			url:'bookmarkChk.ha?rno=${restaurant.rno }&id=${id }',  
			method:'get',
			success: function(data) {
				$("#wannaEat").html(data);
			}
		});
		</c:if>	
	});
	
	/* 북마크 기능 */
	$(document).on("click", "#wannaEat", function() {
		<c:if test="${empty id }">
		alert("로그인 후 이용 바랍니다");
		location.href="/mumuk/view/member/loginForm.ki";
		</c:if>
		
		$.ajax({
			url:'bookmarkUpdate.ha?rno=${restaurant.rno }&id=${id }',  
			method:'get',
			success: function(data) {
				$("#wannaEat").html(data);
			}
		});
	});	
	
	/* 리뷰 쓰기 */
	$(document).on("click", ".review", function() {
		<c:if test="${empty id }">
		alert("로그인 후 이용 바랍니다");
		location.href="/mumuk/view/member/loginForm.ki";
		</c:if>
		<c:if test="${!empty id }">
		location.href="reviewForm.ha?rno=${restaurant.rno }&id=${id }";
		</c:if>
	});
	
</script>
</head>
<body onload="bmChk()" onscroll="SetDivPosition()">

	<div class="restaurant_page">

		<!-- 식당 상세정보 -->
		<section class="restaurant_info">
			<div class=header>
				<div class="bookmark">
					<span id="wannaEat"><img class="wannaEat_img"
						src="/mumuk/images/bookmark.png">
						<p class="bookmark_txt">먹고싶다</p></span>
				</div>
				<div class="review_icon">
					<span class="review"> <img src="/mumuk/images/review.png">
						<p class="review_txt">리뷰쓰기</p></span>
				</div>
				<div class="title_wrap">
					<span class="title">${restaurant.rname }</span> <span
						class="rate_point">
						${star_rate }
					</span>
				</div>
				<div class="status">
					<img src="/mumuk/images/eye.png"><span>${restaurant.readcount }</span>
					<img src="/mumuk/images/pen_gray.png"><span>${total }</span> <img
						src="/mumuk/images/star_icon.png"><span>${star_rate }</span>
				</div>

			</div>
			<div class="restaurant_detail_wrap">
				<div class="menu_img">
					<%-- <img src="/mumuk/food_img/${restaurant.img1 }"> --%>
					<div id="slideShow">
						<ul class="slides">
							<li><img src="/mumuk/food_img/${restaurant.img1 }"></li>
							<li><img src="/mumuk/food_img/${restaurant.img2 }"></li> 
							<li><img src="/mumuk/food_img/${restaurant.img3 }"></li> 
						</ul>
						<p class="controller">

						<!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 --> 
						<span class="prev">&lang;</span> 
						<span class="next">&rang;</span> 
						</p>
					</div>
					<!-- javascript를 상단에서 적용시키면 슬라이드쇼 적용 안됨 -->
					<script src="/mumuk/js/slideShow.js"></script>		
				</div>
				<div class="detail_table">
					<table class="restaurant_datail">
						<tr>
							<th>주소</th>
							<td>${restaurant.addr }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${restaurant.rtel }</td>
						</tr>
						<tr>
							<th>음식 종류</th>
							<td>${restaurant.sep_1 }/ ${restaurant.sep_2 } <c:if
									test="${not empty restaurant.sep_3 }">/ ${restaurant.sep_3 }</c:if>
							</td>
						</tr>
						<tr>
							<th>대표 메뉴</th>
							<td>${restaurant.menu1 }<br> ${restaurant.menu2 }<br>
								${restaurant.menu3 }
							</td>
						</tr>
					</table>
				</div>

				<!-- 식당 지도 -->
				<div class="map_wrap">
					<div id="map">
						<script>
						var mapOptions = {
							center : new naver.maps.LatLng(${restaurant.map_x },
									 ${restaurant.map_y }),
							zoom : 15
						};
						var map = new naver.maps.Map('map', mapOptions); 
						
						var marker = new naver.maps.Marker({
						    position: new naver.maps.LatLng(${restaurant.map_x },
									 ${restaurant.map_y }),
						    map: map
						});
					</script>
					</div>
				</div>
			</div>

			<div class="review_wrap">
				<h2>리뷰(${total })</h2>
				<div class="review_box">
					<c:forEach var="review" items="${list }">
					<div class="review_list">
						<div class="profile"><img src="/mumuk/images/profile.png"></div>
						<div class="writer">${review.nickName }</div>
						<div class="content">${review.content }</div>
					</div>
					</c:forEach>
				</div>

				<!-- 리뷰 페이징 -->
				<div class="paging">
					<!-- 앞에 보여줄 것이 있다면 -->
					<c:if test="${startPage > PAGE_PER_BLOCK }">
						<button
							onclick="location.href='restaurantInfo.ha?rno=${rno }&pageNum=${startPage-1}'" class="btn5">이전</button>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<button
							onclick="location.href='restaurantInfo.ha?rno=${rno }&pageNum=${i}'" class="btn4">${i }</button>
					</c:forEach>
					<!-- 아직 보여줄 것이 남아있다면 -->
					<c:if test="${endPage < totalPage }">
						<button
							onclick="location.href='restaurantInfo.ha?rno=${rno }&pageNum=${endPage+1}'" class="btn5">다음</button>
					</c:if>
				</div>
			</div>
		</section>
	</div>
</body>
</html>