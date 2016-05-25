<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
</head>

<style>
body {
	padding-top: 70px;
}
</style>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">마이페이지</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="?page=Join.jsp">개인정보수정</a></li>
				<li><a href="?page=Login.jsp" id="1">내가 작성한 글</a></li>
				<li><a href="?page=Loseidpw.jsp">내가 좋아요 누른 글</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">로그아웃</a></li>
			</ul>
		</div>
	</div>

	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2">
				<img src="123.png" alt="Responsive image" class="img-circle">
			</div>
			<div class="col-sm-9">
				<%
					String BodyPage = "Join.jsp";
					if (request.getParameter("page") != null) {
						BodyPage = request.getParameter("page");
					}
				%>
				<jsp:include page="<%=BodyPage%>" flush="false" />
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>