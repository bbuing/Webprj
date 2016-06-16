<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<style>
	#r_map{
		width:478px;
		height:308px;
	}
</style>
</head>
<body>
		<div class="input-group" style="width:360px;">
			<input type="search" id="search" class="form-control" placeholder="지역을 입력하세요"/> 
			<span class="input-group-btn">
				<button class="btn btn-default" id="searchBtn" type="button">검색</button>
			</span>
		</div>
		<div id="r_map"></div>
		<button type="button" class="btn btn-default">저장</button>
<script>
	var map;
	var geocoder;
	
	function initMap() {
		alert("init");
		var myLatLng = {lat : 37.570152, lng : 126.983078};
		map = new google.maps.Map(document.getElementById('r_map'), {
			zoom : 17,
			center : myLatLng
		});
	      
	    var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			title : '종각역'
		});
	    
		geocoder = new google.maps.Geocoder();
	}
	
	function geocodeAddress(geocoder, resultsMap) {
		var address = document.getElementById('search').value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status === google.maps.GeocoderStatus.OK) {
				resultsMap.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : resultsMap,
					position : results[0].geometry.location
				});
			} else {
				alert("검색되지 않는 지역입니다. 다른 지역을 입력해주세요");
			}
		});
	}
	
	document.getElementById('searchBtn').addEventListener('click',
			function() {
				alert("event");
				geocodeAddress(geocoder, map);
			});
	$("#search").bind('keypress', function(e){
		if(e.which == 13)
			geocodeAddress(geocoder, map);
	});
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmsGI_8BQcslfyf8AnFmSvi0zESELZWOQ&signed_in=true&callback=initMap" async defer></script>
</body>
</html>