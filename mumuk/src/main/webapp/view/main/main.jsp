<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/mumuk/css/main/main.css?ver=0");
</style>
</head>
<body>
	<div class="all">
		<div class="container">
			<div class="logo">
				<div class="logo_image">
					<a href="/mumuk/view/main/main.ha"><img src="/mumuk/images/logo_image.png"></a>
				</div>
				<div class="logo_text">
					<a href="/mumuk/view/main/main.ha"><img src="/mumuk/images/logo_text.png"></a>
				</div>
			</div>

			<div class="dropdown_menu">
				<button class="dropdown_btn">오늘 머먹지?</button>
				<div class="dropdown_list">
					<a href="../../view/member/catrgoryForm.jsp">메뉴추천1</a> 
					<a href="../../view/menu/index_ladder.jsp">사다리타기</a> 
					<a href="../../view/menu/index_game.jsp">게임</a>
				</div>
				<img class="search_icon" src="/mumuk/images/meal.png">
			</div>
		</div>

		<div class="container_board">
			<div class="board1">
				<div class="tooltip">
					<a href="../board/list.do"><img class="board1_image"
						src="/mumuk/images/friends.png">
						<div class="tooltip_text tooltip_text1">
							<p>밥친구 게시판
						</div></a>
				</div>

			</div>
			<div class="board2">
				<div class="tooltip">
					<a href="../restaurant/restaurantList.ha"><img
						class="board2_image" src="/mumuk/images/restaurant.png">
						<div class="tooltip_text tooltip_text2">
							<p>식당 둘러보기
						</div></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>