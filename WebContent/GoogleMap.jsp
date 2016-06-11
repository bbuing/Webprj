<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<style>
	#r_map{
		width:450px;
		height:280px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<h3><strong>Google Maps</strong></h3>
				<div class="input-group">
					<input type="search" id="search" class="form-control" placeholder="지역을 입력하세요" /> 
						<span class="input-group-btn">
							<button class="btn btn-default" id="searchBtn" type="button"><span class="glyphicon glyphicon-search"></span></button>
						</span>
				</div>
				<div id="r_map"></div>
			</div>
		</div>
	</div>
	
	<script>
	function initMap() {
		var map = new google.maps.Map(document.getElementById('r_map'), {
			zoom : 8,
			center : {
				lat : -34.397,
				lng : 150.644
			}
		});
		var geocoder = new google.maps.Geocoder();

		document.getElementById('searchBtn').addEventListener('click',
				function() {
					geocodeAddress(geocoder, map);
				});
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
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}
</script>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmsGI_8BQcslfyf8AnFmSvi0zESELZWOQ&signed_in=true&callback=initMap"
        async defer></script>
</body>
</html>