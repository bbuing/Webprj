<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
$(document).ready(function(){
	$("#searchBtn").click(function(){
		var $keyword = $("#search").val().split(" ");
		var query = "";
		$($keyword).each(function(){
			query += encodeURI(this); 
		})
		$("#map").attr("src","https://www.google.com/maps/embed/v1/place?key=AIzaSyAmsGI_8BQcslfyf8AnFmSvi0zESELZWOQ&q=" + query);
	});
});
</script>
</head>
<body>
<body>
	<div class="input-group" style="width:360px;">
		<input type="search" id="search" class="form-control" placeholder="지역을 입력하세요"/> 
		<span class="input-group-btn">
			<button class="btn btn-default" id="searchBtn" type="button">검색</button>
		</span>
	</div>
	<iframe id="map" width="478" height="308" frameborder="0" style="border:0"
  		src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAmsGI_8BQcslfyf8AnFmSvi0zESELZWOQ
    	&q=%EC%84%9C%EC%9A%B8%20%EA%B4%91%ED%99%94%EB%AC%B8"  allowfullscreen>
	</iframe>
	<button type="button" class="btn btn-default">저장</button>
</body>
</html>