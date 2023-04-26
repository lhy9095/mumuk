<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("아이디와 비밀 번호가 일치 합니다.");
			location.href = "/mumuk/view/member/myPageForm.ki?id=${id}";
		</script>
	</c:if>
	<c:if test="${result < 0}">
		<script type="text/javascript">
			alert("비밀번호가 다릅니다");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>