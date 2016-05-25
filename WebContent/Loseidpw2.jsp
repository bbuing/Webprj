<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이메일/비밀번호 찾기 페이지</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="form-horizontal">
			<h2 class="text-center">비밀번호 2차 인증</h2>
			<hr/>
			<div class="form-group">
				<label for="Losepwquestion" class="col-sm-3 control-label">질문 </label>
				<div class="col-sm-6">
					<select class="form-control">
						<option value="hint1">기억에 남는 추억의 장소는?</option>
						<option value="hint2">자신의 인생 좌우명은?</option>
						<option value="hint3">자신의 보물 제1호는?</option>
						<option value="hint4">가장 기억에 남는 선생님 성함은?</option>
						<option value="hint5">타인이 모르는 자신만의 신체비밀이 있다면?</option>
						<option value="hint6">추억하고 싶은 날짜가 있다면?</option>
						<option value="hint7">받았던 선물 중 기억에 남는 독특한 선물은?</option>
						<option value="hint8">유년시절 가장 생각나는 친구 이름은?</option>
						<option value="hint9">인상 깊게 읽은 책 이름은?</option>
						<option value="hint10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
						<option value="hint11">자신이 두번째로 존경하는 인물은?</option>
						<option value="hint12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
						<option value="hint13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
						<option value="hint14">다시 태어나면 되고 싶은 것은?</option>
						<option value="hint15">내가 좋아하는 캐릭터는?</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<input type="text" class="form-control" id="Losepwquestion" placeholder="질문의 답을 입력하세요." />
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-2">&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-info">비밀번호 찾기</button>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>