<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#a{width: 150px; height: 150px; background: orange; position: relative; left: 500px; top: 200px; font-size: 2em; color: white; }
	h2{text-align: center;}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('button').hover(function() {
			// 마우스를 올려 놓으면 2초동안 왼쪽으로 500px 이동해
			$(this).animate({ left: 1400}, 800, "linear");
		}, function() {	// 마우스가 떠나면 왼쪽으로 0이동 원위치
			$(this).animate({ left:500}, 800, "linear");
		});
		$('button').click(function() {
			Swal.fire({
				  title: '${arrFinish}',
				  width: 600,
				  padding: '3em',
				  color: '#716add',
				  background: '#fff url(../../images/trees.png)',
				  backdrop: `
				    rgba(40,23,100,0.1)
				    url("../../images/nyan-cat.gif")
				    bottom
				    no-repeat
				  `, closeOnClickOutside : false
			}).then(function() {
				location.href="res.ha?arrFinish=${arrFinish }";
			}) 
		});
	});
</script>

</head>
<body>
<h2> 박스를 클릭하면 메뉴가 나와요!</h2>
<button id="a">머먹?</button>

</body>
</html>