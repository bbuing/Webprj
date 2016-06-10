<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="js/holder.js"></script>
<script src="js/write.js"></script>
<style>
</style>
<Script>
function selectImg(i) {
	var check = $(i).is(".selected");
	if(check == true) {
		$(i).css("border", "1px solid white").removeClass("selected");
	}
	else {
		$(i).css("border","1px solid red").addClass("selected");		
	}
}

jQuery(document).ready(function() {
	$("#instaBtn").click(function(event){
		event.preventDefault();
		window.open("https://www.instagram.com/oauth/authorize/?client_id=05496e57bdfa4b7494198b60c3a806d0&redirect_uri=http://localhost:8080/Webprj/Write_google.jsp&response_type=token&scope=likes+comments+relationships+basic");
	})
});
</Script>
<script>
jQuery(function($) {  
    var tocken = "3321034159.05496e5.f52383b3aa8442b598bc9520813ed274"; /* Access Tocken 입력 */  
    var count = "6";  
    $.ajax({  
        type: "GET",  
        dataType: "jsonp",  
        cache: false,  
        url: "https://api.instagram.com/v1/users/self/media/recent/?access_token=" + tocken + "&count=" + count,  
        success: function(response) {  
         if ( response.data.length > 0 ) {
              for(var i = 0; i < response.data.length; i++) {  
                   var insta = '<div class="col-md-4">';  
                   //insta += "<a target='_blank' href='" + response.data[i].link + "'>";  
                   //insta += "<div class='image-layer'>";  
                   //insta += "<img src='" + response.data[i].images.thumbnail.url + "'>";  
                   insta += '<img src="' + response.data[i].images.thumbnail.url + '" onClick="selectImg(this)">';  
                   insta += "</div>";  
                   //console.log(response.data[i].caption.text);  
                   //if ( response.data[i].caption !== null ) {  
                     //   insta += "<div class='caption-layer'>";  
                     //   if ( response.data[i].caption.text.length > 0 ) {  
                       //      insta += "<p class='insta-caption'>" + response.data[i].caption.text + "</p>"  
                       // }  
                       // insta += "<span class='insta-likes'>" + response.data[i].likes.count + " Likes</span>";  
                        //insta += "</div>";  
                   //}  
                   //insta += "</a>";  
                   //insta += "</div>";  
                   $("#instaPics").append(insta);  
              }  
         }  
        }  
       });  
});  
</script>
<%
	String token = request.getParameter("access_token");
%>
</head>
<body>
	<div class="container">
		<div class="row" align="center">
			<h1>헤더 부분 입니다.</h1>
			<hr/>
		</div>

		<!-- 제목,여행기간을 작성할 상단 부분 -->
		<div class="row">
			<div class="form-inline col-md-12" align="center">
				<div class="form-group thumbnail" style="float:left">
					<img id="img_preview" src="holder.js/200x200"/>
					<div class="caption">
						<input type="file" id="title_img" style="display: none"/>
						<button type="button" class="btn btn-info" onClick="document.getElementById('title_img').click();">
							<span class="glyphicon glyphicon-picture"></span>
						</button>
					</div>
				</div>
				<div class="form-group">
					<input class="form-control input-lg" type="text" size="60" name="title" placeholder="타이틀을 넣어주세요" /><br/><br/>
					<input class="form-control input-lg" type="text" size="60" name="date" placeholder="여행 기간 입력" /><br/><br/>
				</div>
				<form id="title_upload" action="upload.do" method="POST" enctype="multipart/form-data">
				</form>
			</div>
		</div>
		<hr />
		<!-- 하단 작성할 내용 부분 -->
		<div class="row">
			<div class="form-horizontal col-md-4 ">
					<div class="btn-group">
						<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-plane"></span></button>
						<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-heart"></span></button>
						<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-home"></span></button>
						<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-send"></span></button>
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
			<div class="col-md-6" style="border: 1px black solid; margin-top: 35px">
				<div class="btn-group btn-group-justified">
					<input type="file" id="card_img" style="display: none" />
					<a class="btn btn-default btn-sm" onclick="document.getElementById('card_img').click();"><span class="glyphicon glyphicon-picture"></span></a> 
					<a class="btn btn-default btn-sm" id="instaBtn"><span class="glyphicon glyphicon-camera"></span></a>
					<a class="btn btn-default btn-sm"><span class="glyphicon glyphicon-thumbs-up"></span></a>
					<a class="btn btn-default btn-sm active"><span class="glyphicon glyphicon-map-marker"></span></a>
					<a class="btn btn-default btn-sm"><span class="glyphicon glyphicon-option-horizontal"></span></a>
				</div>
				<div>
					<!-- <%@include file="GoogleMap.jsp" %>-->
					<div id="instaPics"></div>
				</div>
			</div>
		</div>
		
		<div class="row" align="center">
			<hr />
			<h1>푸터 부분 입니다.</h1>
		</div>
	</div>
</body>
</html>