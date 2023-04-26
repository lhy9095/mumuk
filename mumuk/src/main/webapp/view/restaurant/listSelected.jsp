<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/mumuk/css/restaurant/restaurantList.css");
</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	<c:set var="id" value="${sessionScope.id}" ></c:set>
	/* 회원이 북마크한 식당은 페이지 로드 시 북마크 색깔 바뀌도록 */
	$(function bmChk() {
	<c:if test="${!empty id }">
	<c:forEach var="restaurant" items="${list }" varStatus="status">
		$.ajax({
			url:'bookmarkChk.ha?rno=${restaurant.rno }&id=${id }',  
			method:'get',
			success: function(data) {
				$("#wannaEat${status.count}").html(data);
			}
		});
		</c:forEach>
		</c:if>	
	});

	/* 북마크 기능 */
	<c:forEach var="restaurant" items="${list }" varStatus="status">
	$(document).on("click", "#wannaEat${status.count}", function() {
		<c:if test="${empty id }">
		alert("로그인 후 이용 바랍니다");
		location.href="/mumuk/view/member/loginForm.ki";
		</c:if>
		$.ajax({
			url:'bookmarkUpdate.ha?rno=${restaurant.rno }&id=${id }',  
			method:'get',
			success: function(data) {
				$("#wannaEat${status.count}").html(data);
				}
		});
	});	
	</c:forEach>
	
	$(document).on("click", ".select", function() {
		var food = $(this).attr('id');
		$("#selectedFood").val(food);
		$("#sort").val("latestSort");
		document.getElementById("frm").submit();
	});
</script>
</head>
<body onload="bmChk()">
	<div class="category">
		<section class="food_category">
			<div class="food_cate">
				<button class="categoryBtn"
					onclick="location.href='restaurantList.ha'">
					<img src="/mumuk/images/foodTotal.png">
					<p class="cate_txt">전체</p>
				</button>
			</div>
			<div class="food_cate">
				<button id="rice" class="select categoryBtn">
					<img src="/mumuk/images/rice.png">
					<p class="cate_txt">밥</p>
				</button>
			</div>
			<div class="food_cate">
				<button id="noodle" class="select categoryBtn">
					<img src="/mumuk/images/noodles.png">
					<p class="cate_txt">면</p>
				</button>
			</div>
			<div class="food_cate">
				<button id="meat" class="select categoryBtn">
					<img src="/mumuk/images/meat.png">
					<p class="cate_txt">고기</p>
				</button>
			</div>
			<div class="food_cate">
				<button id="bread" class="select categoryBtn">
					<img src="/mumuk/images/bread.png">
					<p class="cate_txt">빵</p>
				</button>
			</div>
			<div class="food_cate">
				<button id="seafood" class="select categoryBtn">
					<img src="/mumuk/images/seafood.png">
					<p class="cate_txt">해산물</p>
				</button>
			</div>
			<div class="food_cate">
				<button id="etc" class="select categoryBtn">
					<img src="/mumuk/images/etc.png">
					<p class="cate_txt">기타</p>
				</button>
			</div>
		</section>
	</div>

	<div>
		<div class="content">
			<form action="listSelected.ha" id="frm">
				<div class=search_wrap>
					<select name="sort" id="sort" onchange="this.form.submit()">
						<option value="latestSort"
							<c:if test="${sort eq 'latestSort' }"> selected</c:if>>최신순</option>
						<option value="readcountSort"
							<c:if test="${sort eq 'readcountSort' }"> selected</c:if>>조회순</option>
					</select> <input type="hidden" id="selectedFood" name="selectedFood"
						value=${selectedFood }> <img class="search_icon"
						src="/mumuk/images/search_icon.png"> <input
						class="search_bar" type="search">
				</div>
			</form>

			<section class="restaurant_list">
				<c:forEach var="restaurant" items="${list }" varStatus="status">
					<article class="restaurant">
						<div class="thumbnail">
							<a class="restaurnatInfo"
								href="restaurantInfo.ha?rno=${restaurant.rno }"> <img
								src="/mumuk/food_img/${restaurant.img1 }">
							</a>
						</div>
						<div class="info">
							<div class="bookmark">
								<span id="wannaEat${status.count}"><img
									class="wannaEat_img" src="/mumuk/images/bookmark.png">
									<p class="bookmark_txt">먹고싶다</p></span>
							</div>
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
					</article>
				</c:forEach>

				<!-- paging -->
				<div class="paging">
					<!-- 앞에 보여줄 것이 있다면 -->
					<c:if test="${startPage > PAGE_PER_BLOCK }">
						<button
							onclick="location.href='listSelected.ha?pageNum=${startPage-1}&selectedFood=${selectedFood }&sort=${sort }'"
							class="btn5">이전</button>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<button
							onclick="location.href='listSelected.ha?pageNum=${i}&selectedFood=${selectedFood }&sort=${sort }'"
							class="btn4">${i }</button>
					</c:forEach>
					<!-- 아직 보여줄 것이 남아있다면 -->
					<c:if test="${endPage < totalPage }">
						<button
							onclick="location.href='listSelected.ha?pageNum=${endPage+1}&selectedFood=${selectedFood }&sort=${sort }'"
							class="btn5">다음</button>
					</c:if>
				</div>
			</section>
		</div>

	</div>
</body>
</html>