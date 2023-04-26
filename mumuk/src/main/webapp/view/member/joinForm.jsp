<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/join.css?ver=9");</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('.select').change(function() {
			if ($('.select').val() == 'direct') {
				$('#email_domain').attr("disabled", false);
				$('#email_domain').val("");
				$('#email_domain').focus();
			} else {
				$('#email_domain').val($('.select').val());
			}
		});
	});
	function dupChkId() {
		if (!frm.id.value) {
			alert("아이디를 입력하고 체크 하세요");
			frm.id.focus();
			return false;
		}

		$.post('confirmId.ki', 'id=' + frm.id.value, function(data) {
			$('#err').html(data);
		});
	}
	function dupChkNick() {
		if (!frm.nickName.value) {
			alert("별명을 입력하고 체크 하세요");
			frm.nickName.focus();
			return false;
		}

		$.post('confirmNick.ki', 'nickName=' + frm.nickName.value, function(
				data) {
			$('#err2').html(data);
		});
	}
	function chkPass() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호확인이 다릅니다");
			frm.password.focus();
			frm.password.value = "";
			frm.password2.value = "";
			return false;
		}
	}
</script>
</head>
<body>
	<div class="contain">
		<form action="join.ki" method="post" name="frm"
			onsubmit="return chkPass()">
			<table>
				<caption style="color: grey; font-size: 30px">회원 가입</caption>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" autofocus="autofocus" required="required" id="userId" pattern="[A-Za-z0-9]{2,12}"
						placeholder="최대 12자"></td>
					<td><div id="err"></div>
						<input type="button" value="중복체크" id="BtnId" onclick="dupChkId()"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="2"><input type="password" name="password"
						required="required" id="password" pattern="[A-Za-z0-9]{8,}"
						placeholder="8자리 이상"></td>
					<td></td>
				</tr>
				<tr>
					<th>비밀번호 재입력</th>
					<td colspan="2"><input type="password" name="password2" required="required" id="passwordConfirm"></td>
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" name="name"
						required="required" id="userName"></td>
					<td></td>
				</tr>
				<tr>
					<th>별명</th>
					<td><input type="text" name="nickName" required="required" id="nickName" pattern="[A-Za-z0-9가-힣]{2,6}" placeholder="2~6글자"></td>
					<td><div id="err2"></div>
						<input type="button" value="중복체크" id="BtnNick" onclick="dupChkNick()"></td>
				</tr>
				<tr>
					<th>전화</th>
					<td colspan="2"><input type="tel" name="tel" id="tel"
						required="required" pattern="010-\d{3,4}-\d{4}"
						placeholder="010-xxxx-xxxx" title="전화형식은 010-3/4자리-4자리"></td>
					<td></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email_id" required="required"
						id="email_id" style="width: 42.5%"> @ <input type="text"
						name="email_domain" required="required" id="email_domain"
						style="width: 42.5%"></td>
					<td><select class="select" title="이메일 도메인 주소 선택"
						style="float: right">
							<option value="">-선택-</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="direct">직접입력</option>
					</select></td>
				</tr>
				<tr>
					<th colspan="3"><input type="submit" value="회원 가입" id="Btn"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>