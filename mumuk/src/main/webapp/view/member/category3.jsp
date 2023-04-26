<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap 으로 하면 드롭다운 오른쪽 으로 하기 쉬운데 헤더가 깨지네  -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
<style type="text/css">@import url("../../css/member/category.css?ver=2");</style>
</head>
<body>
	<div class="img_logo" align="center">
		<img alt="" src="../../images/mumuk(logo).png">		
	</div>
	<div class="contain">
		<div class="dropdown">
			<button class="dropbtn" onclick="location.href='categoryselected1.ki?selectedFood=밥'">밥</button>
			<div class="dropdown-content">
				<div class="dropdown2">
					<button class="dropbtn2" onclick="location.href='categoryselected2.ki?selectedFood=국밥'">국밥</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=감자탕'">감자탕</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=된장찌개'">된장찌개</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=순대국'">순대국</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=해장국'">해장국</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=순두부'">순두부</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=부대찌개'">부대찌개</a>
					</div>
				</div>
				<div class="dropdown2">
					<button class="dropbtn2" onclick="location.href='categoryselected2.ki?selectedFood=김밥'">김밥</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=키토김밥'">키토김밥</a>
					</div>
				</div>				 				  
				<div class="dropdown2">
					<button class="dropbtn2" onclick="location.href='categoryselected2.ki?selectedFood=덮밥'">덮밥</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=스테이크덮밥'">스테이크 덮밥</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=텐동'">텐동</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=제육덮밥'">제육덮밥</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=장어덮밥'">장어덮밥</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=연어덮밥'">연어덮밥</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=대창덮밥'">대창덮밥</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=카이센동'">카이센동</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=야키니쿠동'">야키니쿠동</a>
					</div>
				</div>
				<a onclick="location.href='categoryselected2.ki?selectedFood=리조또'">리조또</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=백반'">백반</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=오므라이스'">오므라이스</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=초밥'">초밥</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=카레'">카레</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=한정식'">한정식</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn" onclick="location.href='categoryselected1.ki?selectedFood=면'">면</button>
			<div class="dropdown-content">
				<div class="dropdown2">
					<button class="dropbtn2" onclick="location.href='categoryselected2.ki?selectedFood=국물O'">국물 O</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=우육면'">우육면</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=쌀국수'">쌀국수</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=라멘'">라멘</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=우동'">우동</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=짬뽕'">짬뽕</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=마라'">마라</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=평양냉면'">평양냉면</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=칼국수'">칼국수</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=국수'">국수</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=탄탄면'">탄탄면</a>
					</div>
				</div> 
				<div class="dropdown2">
					<button class="dropbtn2" onclick="location.href='categoryselected2.ki?selectedFood=국물X'">국물 X</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=짜장면'">짜장면</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=파스타'">파스타</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=막국수'">막국수</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=소바'">소바</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=분짜'">분짜</a>
					</div>
				</div>  
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn" onclick="location.href='categoryselected1.ki?selectedFood=빵'">빵</button>
			<div class="dropdown-content">
				<a onclick="location.href='categoryselected2.ki?selectedFood=빵'">빵</a> 
				<a onclick="location.href='categoryselected2.ki?selectedFood=샌드위치'">샌드위치</a> 
				<a onclick="location.href='categoryselected2.ki?selectedFood=팬캐이크'">팬 케이크</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=프렌치토스트'">프렌치 토스트</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=피자'">피자</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=햄버거'">햄버거</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn" onclick="location.href='categoryselected1.ki?selectedFood=해산물'">해산물</button>
			<div class="dropdown-content">
				<a onclick="location.href='categoryselected2.ki?selectedFood=게'">게</a> 
				<a onclick="location.href='categoryselected2.ki?selectedFood=새우'">새우</a> 
				<a onclick="location.href='categoryselected2.ki?selectedFood=생선요리'">생선 요리</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=조개'">조개</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=쭈꾸미'">쭈꾸미</a>
				<div class="dropdown2">
					<button class="dropbtn2">회</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=대방어'">대방어</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=참치'">참치</a>
					</div>
				</div>  
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn" onclick="location.href='categoryselected1.ki?selectedFood=고기'">고기</button>
			<div class="dropdown-content">
				<div class="dropdown2">
					<button class="dropbtn2" onclick="location.href='categoryselected2.ki?selectedFood=닭고기'">닭고기</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=치킨스테이크'">치킨 스테이크</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=닭갈비'">닭갈비</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=닭도리탕'">닭도리탕</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=치킨'">치킨</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=닭발'">닭발</a>
					</div>
				</div>   
				<div class="dropdown2">
					<button class="dropbtn2" onclick="location.href='categoryselected2.ki?selectedFood=돼지고기'">돼지고기</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=돼지고기뷔페'">돼지고기 뷔페</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=돈가스'">돈가스</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=보쌈'">보쌈</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=돼지고기구이'">돼지고기 구이</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=바베큐'">바베큐</a>
					</div>
				</div>   
				<a href="#">샤브샤브</a>
				<div class="dropdown2">
					<button class="dropbtn2" onclick="location.href='categoryselected2.ki?selectedFood=소고기'">소고기</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=스테이크'">스테이크</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=갈비찜'">갈비찜</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=소고기구이'">소고기 구이</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=규카츠'">규카츠</a>
					</div>
				</div>  
				<div class="dropdown2">
					<button class="dropbtn2" onclick="location.href='categoryselected2.ki?selectedFood=양고기'">양고기</button>
					<div class="dropdown-content2">
						<a onclick="location.href='categoryselected3.ki?selectedFood=양고기뷔페'">양고기 뷔페</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=양꼬치'">양꼬치</a>
						<a onclick="location.href='categoryselected3.ki?selectedFood=양갈비'">양갈비</a>
					</div>
				</div>  
				<a onclick="location.href='categoryselected1.ki?selectedFood=함박스테이크'">함박스테이크</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn" onclick="location.href='categoryselected1.ki?selectedFood=기타'">기타</button>
			<div class="dropdown-content">
				<a onclick="location.href='categoryselected2.ki?selectedFood=만두'">만두</a> 
				<a onclick="location.href='categoryselected2.ki?selectedFood=뷔페'">뷔페</a> 
				<a onclick="location.href='categoryselected2.ki?selectedFood=떡볶이'">떡볶이</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=전'">전</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=샐러드'">샐러드</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=멕시코음식'">멕시코 음식</a>
				<a onclick="location.href='categoryselected2.ki?selectedFood=스페인음식'">스페인 음식</a>
			</div>
		</div>
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
				<button onclick="location.href='categoryselected3.ki?pageNum=${i}&selectedFood=${selectedFood}&sort=${sort}'">${i}</button>
			</c:forEach>
			<!-- 아직 보여줄 것이 남아있다면 -->
			<c:if test="${endPage < totalPage }">
				<button onclick="location.href='category.ki?pageNum=${endPage+1}&sort=${sort}'">다음</button>
			</c:if>
		</div>
	</div>
</body>
</html>
    