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
			<h2 class="text-center">이메일 찾기</h2>
			<hr/>
			<div class="form-group">
				<label for="Loseidname" class="col-sm-3 control-label">이름 </label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="Loseidname" placeholder="이름"/>
				</div>
			</div>
			
			<div class="form-group">
				<label for="Loseidnickname" class="col-sm-3 control-label">별명 </label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="Loseidnickname" placeholder="별명" />
				</div>
			</div>
			
			<div class="form-group">
				<label for="Loseidphone" class="col-sm-3 control-label">핸드폰 번호 </label>
					<div class="col-sm-2">
					<select class="form-control">
						<option value="Loseidphone1_1">010</option>
						<option value="Loseidphone1_2">011</option>
						<option value="Loseidphone1_3">016</option>
						<option value="Loseidphone1_4">017</option>
						<option value="Loseidphone1_5">019</option>
					</select>
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="Loseidphone2"/>
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="Loseidphone3"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-2">&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-info">아이디 찾기</button>
				</div>
			</div>
			<br/>
			<h2 class="text-center">비밀번호 찾기</h2>
			<hr/>
			
			<div class="form-group">
				<label for="Losepwname" class="col-sm-3 control-label">이름 </label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="Losepwname" placeholder="이름"/>
				</div>
			</div>
			
			<div class="form-group">
				<label for="Losepwnickname" class="col-sm-3 control-label">별명 </label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="Losepwnickname" placeholder="별명" />
				</div>
			</div>
			<div class="form-group">
				<label for="Losepwemail" class="col-sm-3 control-label">이메일 주소</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="Losepwemail" placeholder="이메일" />
				</div>
				<div class="col-sm-3">
					<select class="form-control">
						<option  value="Losepwemail1">naver.com</option>
						<option  value="Losepwemail2">daum.net</option>
						<option  value="Losepwemail3">google.com</option>
						<option  value="Losepwemail4">nate.com</option>
						<option  value="Losepwemail5">직접 입력</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="Losepwphone" class="col-sm-3 control-label">핸드폰 번호 </label>
					<div class="col-sm-2">
					<select class="form-control">
						<option value="Losepwphone1_1">010</option>
						<option value="Losepwphone1_2">011</option>
						<option value="Losepwphone1_3">016</option>
						<option value="Losepwphone1_4">017</option>
						<option value="Losepwphone1_5">019</option>
					</select>
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="Losepwphone2"/>
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="Losepwphone3"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-2">&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-info" onclick="location.href='Loseidpw2.jsp'">비밀번호 찾기</button>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>