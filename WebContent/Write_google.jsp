<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.http.util.EntityUtils"%>
<%@page import="org.apache.http.HttpEntity"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.impl.client.HttpClientBuilder"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmsGI_8BQcslfyf8AnFmSvi0zESELZWOQ&signed_in=true&callback=initMap"
      async defer></script>
<Script>
	function addTheme() {
		var divTheme = document.getElementById("addTheme");
		var div = document.createElement("div");
		div.innerHTML = '<div class="group_theme">'
				+ '<div class="form-inline"><div class="form-group" >'
				+ '<button type="button" class="form-control btn btn-sm"><span class="glyphicon glyphicon-plane"></span></button>'
				+ '<button type="button" class="form-contorl btn btn-sm"><span class="glyphicon glyphicon-heart"></span></button>'
				+ '<button type="button" class="form-contorl btn btn-sm"><span class="glyphicon glyphicon-home"></span></button>'
				+ '<button type="button" class="form-contorl btn btn-sm"><span class="glyphicon glyphicon-send"></span></button></div></div>'
				+ '<div id="theme_row" class="form-group text-right">'
				+ '<textarea class="form-control" rows="8" name="theme" placeholder="내용을 작성해 주세요."></textarea>'
				+ '<button type="button" class="btn btn-default" onClick="removeTheme(this)"><span class="glyphicon glyphicon-trash"></span></button></div>'
				+ '</div>';
		divTheme.appendChild(div);
	}
	function removeTheme(theme) {
		$(theme).parent().parent().remove();
	}
	
	function initMap() {
		  var map = new google.maps.Map(document.getElementById('map'), {
		    zoom: 8,
		    center: {lat: -34.397, lng: 150.644}
		  });
		  var geocoder = new google.maps.Geocoder();

		  document.getElementById('searchBtn').addEventListener('click', function() {
		    geocodeAddress(geocoder, map);
		  });
		}

		function geocodeAddress(geocoder, resultsMap) {
		  var address = document.getElementById('address').value;
		  geocoder.geocode({'address': address}, function(results, status) {
		    if (status === google.maps.GeocoderStatus.OK) {
		      resultsMap.setCenter(results[0].geometry.location);
		      var marker = new google.maps.Marker({
		        map: resultsMap,
		        position: results[0].geometry.location
		      });
		    } else {
		      alert('Geocode was not successful for the following reason: ' + status);
		    }
		  });
</Script>

</head>
<body>
	<div class="container">
		<div class="row" align="center">
			<h1>헤더 부분 입니다.</h1>
			<hr />
		</div>

		<!-- 제목,여행기간을 작성할 상단 부분 -->
		<div class="row" style="width: 100%">
			<div class="col-md-12" align="center">
				<input class="form-control input-lg" type="text" name="title"
					placeholder="타이틀을 넣어주세요" /><br /> <input
					class="form-control input-lg" type="text" name="date"
					placeholder="여행 기간 입력" /><br />
				<br /> <input type="file" id="title_img" style="display: none" />
				<button type="button" class="btn btn-info"
					onClick="document.getElementById('title_img').click();">
					<span class="glyphicon glyphicon-picture"></span>
				</button>
			</div>
		</div>
		<hr />
		<!-- 하단 작성할 내용 부분 -->
		<div class="row">
			<div class="form-horizontal col-md-4 ">
				<div class="form-inline">
					<div class="form-group">
						<button type="button" class="form-control btn btn-sm">
							<span class="glyphicon glyphicon-plane"></span>
						</button>
						<button type="button" class="form-contorl btn btn-sm">
							<span class="glyphicon glyphicon-heart"></span>
						</button>
						<button type="button" class="form-contorl btn btn-sm">
							<span class="glyphicon glyphicon-home"></span>
						</button>
						<button type="button" class="form-contorl btn btn-sm">
							<span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</div>
				<div class="form-group">
					<textarea class="form-control" rows="8" name="theme"
						placeholder="내용을 작성해 주세요."></textarea>
				</div>
				<div class="form-group">
					<!-- 테마 추가 버튼(아래쪽) -->
					<button class="form-control form-group-lg" type="button"
						class="btn btn-default btn-lg btn-block" onClick="addTheme()">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					</button>
				</div>
				<div id="addTheme"></div>
			</div>
			<div class="col-md-1" style="margin-top: 35px">
				<!-- 부가내용 추가 버튼(오른쪽) -->
				<div style="height: 150px">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				</div>
			</div>
			<div class="col-md-6"
				style="border: 1px black solid; margin-top: 35px">
				<div class="btn-group btn-group-justified">
					<input type="file" id="card_img" style="display: none" />
					<a href="#" class="btn btn-default" onclick="document.getElementById('card_img').click();"><span class="glyphicon glyphicon-picture"></span></a> 
						<a href="#"	class="btn btn-default"><span
						class="glyphicon glyphicon-camera"></span></a> <a href="#"
						class="btn btn-default"><span
						class="glyphicon glyphicon-thumbs-up"></span></a> <a href="#"
						class="btn btn-default active"><span
						class="glyphicon glyphicon-map-marker"></span></a> <a href="#"
						class="btn btn-default"><span
						class="glyphicon glyphicon-option-horizontal"></span></a>
				</div>
				<h3>
					<strong>Naver Maps</strong>
				</h3>
				<div class="input-group">
					<input type="search" id="search" class="form-control"
						placeholder="지역을 입력하세요" /> <span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
				<div id="floating-panel">
					<input id="address" type="textbox" value="서울"> 
				</div>
				<div id="map"></div>
				<button type="button" id="searchBtn" class="checkbtn btn btn-success" value="확인">확인</button>
			</div>
		</div>
		<div class="row" align="center">
			<hr />
			<h1>푸터 부분 입니다.</h1>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script type="text/javascript"
		src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			$("#searchBtn").click(function() {
				var $query = $("#search").val();
				if ($query != null) {
				}
			});
		});
	</script>
</body>
</html>