<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/mumuk/css/restaurant/reviewForm.css");
</style>
<script type="text/javascript" src="/mumuk/js/jquery.js"></script>
<script type="text/javascript">
	/* 별점 기능 */
	$(document).on("click", ".starRate span", function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		var score = $(this).attr('data-value');
		$("#star_rate").val(score);
		return false;
	});
</script>

</head>
<body>
	<div class="reviewForm">
		<form action="review.ha" method="post" name="frm">
			<div class="header">
				<span class="rname">${rname }</span>에 대한 <span class="nickName">${nickName }</span>님의
				솔직한 리뷰를 작성해주세요.
			</div>

			<div class="starRate">
				<span class="star on" data-value="1">★</span> 
				<span class="star" data-value="2">★</span> 
				<span class="star" data-value="3">★</span> 
				<span class="star" data-value="4">★</span> 
				<span class="star" data-value="5">★</span> 
			</div>

			<div>
				<textarea class="textarea" rows="10" cols="70" name="content"
					placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"
					required="required"></textarea>
			</div>
			<input type="hidden" id="rno" name="rno" value=${rno }> 
			<input type="hidden" id="id" name="id" value=${id }>
			<input type="hidden" id="star_rate" name="star_rate" value="">
			<div>
				<input type="submit" value="리뷰 등록" class="btn5">
			</div>
		</form>
	</div>
</body>
</html>