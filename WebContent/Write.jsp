<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=0WHH0daM0No75W5iZoZC"></script>
<Script>
	function addTheme() {
		var divTheme = document.getElementById("addTheme");
		var div = document.createElement("div");
		div.innerHTML =
			'<div class="group_theme">'+
			'<div class="form-inline"><div class="form-group" >' + 
			'<button type="button" class="form-control btn btn-sm"><span class="glyphicon glyphicon-plane"></span></button>'+
			'<button type="button" class="form-contorl btn btn-sm"><span class="glyphicon glyphicon-heart"></span></button>'+
			'<button type="button" class="form-contorl btn btn-sm"><span class="glyphicon glyphicon-home"></span></button>'+
			'<button type="button" class="form-contorl btn btn-sm"><span class="glyphicon glyphicon-send"></span></button></div></div>'+ 
			'<div id="theme_row" class="form-group text-right">' + 
			'<textarea class="form-control" rows="8" name="theme" placeholder="내용을 작성해 주세요."></textarea>' + 
			'<button type="button" class="btn btn-default" onClick="removeTheme(this)"><span class="glyphicon glyphicon-trash"></span></button></div>'+
			'</div>';
		divTheme.appendChild(div); 
	}
	function removeTheme(theme) {
		$(theme).parent().parent().remove();
	}
</Script>
<script type="text/javascript">
                        try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
</script>

</head>
<body>
	<div class="container">
		<div class="row" align="center">
			<h1>헤더 부분 입니다.</h1>
			<hr/>
		</div>
		
		<div class="multiple-items">
		    <div><button type="button" class="form-control btn btn-sm"><span class="glyphicon glyphicon-plane"></span></button></div>
		    <div><button type="button" class="form-control btn btn-sm"><span class="glyphicon glyphicon-plane"></span></button></div>
		    <div><button type="button" class="form-control btn btn-sm"><span class="glyphicon glyphicon-plane"></span></button></div>
		    <div><button type="button" class="form-control btn btn-sm"><span class="glyphicon glyphicon-plane"></span></button></div>
		    <div><button type="button" class="form-control btn btn-sm"><span class="glyphicon glyphicon-plane"></span></button></div>
		    <div><button type="button" class="form-control btn btn-sm"><span class="glyphicon glyphicon-plane"></span></button></div>
	  	</div>
		
		<!-- 제목,여행기간을 작성할 상단 부분 -->
		<div class="row" style="width: 100%">
			<div class="col-md-12" align="center">
				<input class="form-control input-lg" type="text" name="title" placeholder="타이틀을 넣어주세요" /><br/>
				<input class="form-control input-lg" type="text" name="date" placeholder="여행 기간 입력" /><br/><br/>
				<input type="file" id="title_img" style="display:none"/>
				<button type="button" class="btn btn-info" onClick="document.getElementById('title_img').click();"><span class="glyphicon glyphicon-picture"></span></button>
			</div>
		</div>
		<hr/>
		<!-- 하단 작성할 내용 부분 -->
		<div class="row">
			<div class="form-horizontal col-md-4 ">
				<div class="form-inline">
					<div class="form-group" >
						<button type="button" class="form-control btn btn-sm"><span class="glyphicon glyphicon-plane"></span></button>
						<button type="button" class="form-contorl btn btn-sm"><span class="glyphicon glyphicon-heart"></span></button>
						<button type="button" class="form-contorl btn btn-sm"><span class="glyphicon glyphicon-home"></span></button>
						<button type="button" class="form-contorl btn btn-sm"><span class="glyphicon glyphicon-send"></span></button>
					</div>
				</div>
				<div class="form-group">
					<textarea class="form-control" rows="8" name="theme" placeholder="내용을 작성해 주세요."></textarea>
				</div>
				<div class="form-group"> <!-- 테마 추가 버튼(아래쪽) -->
					<button class="form-control form-group-lg" type="button" class="btn btn-default btn-lg btn-block" onClick="addTheme()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>		
				</div>
				<div id="addTheme"></div>
			</div>
			<div class="col-md-1" style="margin-top: 35px">	<!-- 부가내용 추가 버튼(오른쪽) -->
				<div style="height: 150px">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				</div>
			</div>
			<div class="col-md-6" style="border: 1px black solid; margin-top: 35px">
				<div class="btn-group btn-group-justified" >
					<input type="file" id="card_img" style="display: none"/>
					<a href="#" class="btn btn-default" onclick="document.getElementById('card_img').click();"><span class="glyphicon glyphicon-picture"></span></a>
					<a href="#" class="btn btn-default"><span class="glyphicon glyphicon-camera"></span></a>
					<a href="#" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-up"></span></a>
					<a href="#" class="btn btn-default active"><span class="glyphicon glyphicon-map-marker"></span></a>
					<a href="#" class="btn btn-default"><span class="glyphicon glyphicon-option-horizontal"></span></a>
				</div>
				<h3><strong>Naver Maps</strong></h3>
				<div class="input-group">
					<input type="search" id="search" class="form-control" placeholder="지역을 입력하세요" />
					<span class="input-group-btn">
						<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
					</span>
				</div>
				<div id="map_div" style="border:1px solid #000; width:500px; height:300px; margin:20px;"></div>
				<button type="button" id="searchBtn" class="checkbtn btn btn-success" value="확인">확인</button>
			</div>
		</div>
		<div class="row" align="center">
			<hr/>
			<h1>푸터 부분 입니다.</h1>
		</div>
	</div>
	
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
<script>
$(document).ready(function(){
	$("#searchBtn").click(
		function() {
			var $query = $("#search").val();
			if($query != null) {
				<%
					URL mapXmlUrl = new URL("https://openapi.naver.com/v1/map/geocode?encoding=utf-8&coord=latlng&output=json&query=%EB%B6%88%EC%A0%95%EB%A1%9C%206");
					HttpURLConnection urlConn = (HttpURLConnection)mapXmlUrl.openConnection();
					urlConn.setDoOutput(true);
					urlConn.setRequestMethod("POST");
					
					int len = urlConn.getContentLength();
				%>
				alert(<%= len%>);
			}
		}		
	);
	$('.center').slick({
		  centerMode: true,
		  centerPadding: '60px',
		  slidesToShow: 2,
		  responsive: [
		    {
		      breakpoint: 768,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '40px',
		        slidesToShow: 2
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '40px',
		        slidesToShow: 1
		      }
		    }
		  ]
		});
	
	$('.multiple-items').slick({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 3
		});
});
</script>
	<script>
	var oPoint = new nhn.api.map.LatLng(37.5678732, 126.9830730); 
	nhn.api.map.setDefaultPoint('LatLng');
	oMap = new nhn.api.map.Map('map_div' ,{
	                        point : oPoint,
	                        zoom : 11,
	                        enableWheelZoom : true,
	                        enableDragPan : true,
	                        enableDblClickZoom : false,
	                        mapMode : 0,
	                        activateTrafficMap : false,
	                        activateBicycleMap : false,
	                        minMaxLevel : [ 1, 14 ],
	                        size : new nhn.api.map.Size(500, 300)
	                });
	var oSize = new nhn.api.map.Size(28, 37);
	var oOffset = new nhn.api.map.Size(14, 37);
	var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
	// - Draggable Marker 의 경우 Icon 인자는 Sprite Icon이 된다.
	// - 따라서 Sprite Icon 을 사용하기 위해 기본적으로 사용되는 값을 지정한다.
	// - Sprite Icon 을 사용하기 위해서 상세한 내용은 레퍼런스 페이지의 nhn.api.map.SpriteIcon 객체를 참조하면 된다.

	var oMarker1 = new nhn.api.map.Marker(oIcon, { title : 'KH 아카데미' });  //마커 생성 
	oMarker1.setPoint(oPoint); //마커 표시할 좌표 선택
	oMap.addOverlay(oMarker1); //마커를 지도위에 표현 
	var oLabel1 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
	oMap.addOverlay(oLabel1); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
	oLabel1.setVisible(true, oMarker1); // 마커 라벨 보이기
	</script>
</body>
</html>