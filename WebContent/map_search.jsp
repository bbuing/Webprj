<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Geocoding service</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
#floating-panel {
  position: absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

    </style>
  </head>
  <body>
    <div id="floating-panel">
      <input id="address" type="textbox" value="Sydney, NSW">
      <input id="submit" type="button" value="Geocode">
    </div>
    <div id="map"></div>
    <script>
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: {lat: -34.397, lng: 150.644}
  });
  var geocoder = new google.maps.Geocoder();

  document.getElementById('submit').addEventListener('click', function() {
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
}

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmsGI_8BQcslfyf8AnFmSvi0zESELZWOQ&signed_in=true&callback=initMap"
        async defer></script>
  </body>
</html>
<%/*
	String clientId = "0WHH0daM0No75W5iZoZC";
	String clientSecret = "TT9fRoYVGD";
	String query = URLEncoder.encode("서울강남구","UTF-8");
	String url = "https://openapi.naver.com/v1/map/geocode?encoding=utf-8&coord=latlng&output=json&query="+query;
	
	HttpClient client = HttpClientBuilder.create().build();
	HttpGet req = new HttpGet(url);
	 
	req.addHeader("X-Naver-Client-Id", clientId);
	req.addHeader("X-Naver-Client-Secret", clientSecret);
	HttpResponse resp = client.execute(req);
	HttpEntity data = resp.getEntity();
	data.getContentLength();
	BufferedReader br = new BufferedReader(new InputStreamReader(data.getContent()));
	String str = "";
	while((str = br.readLine()) != null) {
		out.println(str + "\n");
	}*/
%>

