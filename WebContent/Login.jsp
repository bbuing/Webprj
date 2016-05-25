<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 페이지</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="form-horizontal">
			<h2 class="text-center">로그인</h2>
			<hr/>
			
			<div class="form-group">
				<label class="col-md-3 control-label" for="Loginemail">이메일 주소</label>
				<div class="col-md-6">
					<input type="text" class="form-control" id="Loginemail" placeholder="이메일 주소를 입력하세요." />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="Loginpw">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="Loginpw" placeholder="비밀번호를 입력하세요." />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-3">&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary">로그인</button>
					<button type="button" class="btn btn-default col-sm-offset-3" onclick="location.href='Join1.jsp'">회원가입</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-default" onclick="location.href='Loseidpw.jsp'">이메일/비밀번호 찾기</button>
				</div>
			</div>	
		</form>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>