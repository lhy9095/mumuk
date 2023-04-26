<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MumumMypage</title>
<style type="text/css">@import url("../../css/member/myPage.css?ver=4");</style>
<style type="text/css">
.delBtn {
	
	float: left;
}
</style>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("새 비밀번호와 비밀번호 확인이 다릅니다. 다시 한번 설정해 주세요");  
			frm.password.focus();
			frm.password.value = "";	
			frm.password2.value = "";
			return false;
		}
	}
	
	// 회원 탈퇴
	function del() {
		// 확인을 check하면 true이고 취소를 체크하면 false;
		var ch = confirm("정말로 탈퇴하시겠습니까 ?");
		if (ch) {
			location.href="delete.ki?id=${id}";
		}
		else {
			alert("탈퇴가 취소 되었습니다");
		}
	}
</script>
</head>
<body>
	<div class="main_contain" >
		<div class="sidebar_contain">
		<ul class="sidebar">
			<li class="sidebar_ele"><img alt="" src="../../images/mumuk(icon).png"></li>
			<li class="sidebar_ele"><a class="active" href="#">내 정보 수정</a></li>
			<li class="sidebar_ele"><a href="/mumuk/view/member/myPageFormBook.ki">즐겨찾기 내역</a></li>
			<li class="sidebar_ele"><a href="#">내가 쓴 글</a></li>
			<li class="sidebar_ele"><a onclick="del()">회원탈퇴</a></li>
		</ul>
		</div>	
		<div class="main">
			<h1 style="padding-left: 50px">내정보 수정</h1>
			<form action="update.ki" method="post" name="frm" onsubmit="return chk()">
			<input type="hidden" name="id" value="${member.id }">
				<table class="table">
					<tr>
						<th>아이디</th>
						<td id="userId">${member.id}</td>
					</tr>
					<tr>
						<th>새 비밀번호</th>
						<td id="password"><input type="password" name="password" id="psw" required="required"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td id="password"><input type="password" name="password2" id="psw2" required="required"></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td id="nickName"><input type="text" name="nickName" id="nN" value="${member.nickName}"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td id="userName">${member.name}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td id="tel"><input type="text" name="tel" id="nN" value="${member.tel}"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td id="email">${member.email_id}@${member.email_domain}</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="회원정보수정"></td>
					</tr>
						
				</table>					
			</form>
			<!-- <div >
				<input type="button" onclick="del()" value="회원탈퇴" class="delBtn" >
				버튼을 액션을 실행한다
			</div>	 -->		
		</div>
	</div>
</body>
</html>