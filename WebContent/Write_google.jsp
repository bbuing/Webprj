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
<script src="bootstrap/js/bootstrap.min.js"></script>
<style>
#instaPics{
	width:400px;
	height:250px;
}
#insta{
	width:150px;
	height:150px;
	margin:2px;
}
#instaDesc {
	width:400px;
	height:250px;
	text-align: center;
}
#header {
    position: fixed;
    top: 0px;
    left:30px;
    width:100%;
    z-index: 1;
}
#title {
	margin-top:110px;
}
#card_content {
	border: 1px silver solid;
	margin-top: 35px;
	padding:5px; 
	width:490px; 
	height:345px; 
	display:none;
}
</style>
<Script>
</Script>
</head>
<body>
	<input type="hidden" id="token" name="token" onChange="test()"/>
	<div class="container">
		<div id="header" class="row">
			<h1>헤더 부분 입니다.</h1>
			<hr/>
		</div>

		<!-- 제목,여행기간을 작성할 상단 부분 -->
		<div id="title" class="row"class="form-inline col-md-12">
			<div class="form-inline" align="center">
				<div class="form-group thumbnail" style="float:left">
					<img id="title_img_preview" src="holder.js/200x200"/>
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
					<h3><span class="form-control label label-default">작성 순서</span></h3>
					<div id="theme_order">
						<span class="glyphicon glyphicon-send"></span>
					</div>
				</div>
				<form id="title_upload" action="upload.do" method="POST" enctype="multipart/form-data">
				</form>
			</div>
		</div>
		<hr />
		<!-- 하단 작성할 내용 부분 -->
		<div class="row">
			<div id="theme_list" class="form-horizontal col-md-4 ">
				<div class="btn-group">
					<button type="button" class="btn btn-default" onClick="setTheme(this)"><span class="glyphicon glyphicon-plane"></span></button>
					<button type="button" class="btn btn-default" onClick="setTheme(this)"><span class="glyphicon glyphicon-heart"></span></button>
					<button type="button" class="btn btn-default" onClick="setTheme(this)"><span class="glyphicon glyphicon-home"></span></button>
					<button type="button" class="btn btn-default active" onClick="setTheme(this)"><span class="glyphicon glyphicon-send"></span></button>
				</div>
				<div class="form-group">
					<textarea class="form-control" rows="16" name="theme" placeholder="내용을 작성해 주세요."></textarea><br/>
					<button class="form-control form-group-lg" type="button" class="btn btn-default btn-lg btn-block" onClick="addTheme(this)">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					</button>
				</div>
			</div>
			<div class="col-md-1" style="margin-top: 35px">
				<!-- 부가내용 추가 버튼(오른쪽) -->
				<button id="show_card_btn" class="btn btn-default" onClick="showCard()" style="height: 335px;"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
				<button id="del_card_btn" class="btn btn-default" onClick="delCard()" style="height: 335px; display: none;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
			</div>
			<div id="card_content" class="col-md-4">
				<ul class="nav nav-tabs nav-justified">
					<li><input type="file" id="card_img" style="display: none" /><a class="btn btn-default" onclick="cardTab(this)"><span class="glyphicon glyphicon-picture"></span></a></li>
					<li><a id="instaBtn" class="btn btn-default" onclick="cardTab(this)"><span class="glyphicon glyphicon-camera"></span></a></li>
					<li><a class="btn btn-default"onclick="cardTab(this)"><span class="glyphicon glyphicon-thumbs-up"></span></a></li>
					<li><a class="btn btn-default"onclick="cardTab(this)"><span class="glyphicon glyphicon-map-marker"></span></a></li>
					<li><a class="btn btn-default"onclick="cardTab(this)"><span class="glyphicon glyphicon-option-horizontal"></span></a></li>
				</ul>
				<div id="card">
					<div style="display: none;"><jsp:include page = "OwnPhotos.jsp"/></div>
					<div class="continaer" style="display: none;">
						<div id="instaPics" class="row" style="overflow: auto;"></div>
						<button type="button" id="instaAdd" class="btn btn-info">추가</button>
						<div id="instaDesc" style="display:none;"></div>
					</div>
					<div style="display: none;"><jsp:include page = "Youtube.jsp" /></div>
					<div style="display: none;"><jsp:include page = "GoogleMap.jsp"/></div>
				</div>
			</div>
		</div>
		<div id="test"></div>
		<div id="footer" class="row">
			<hr />
			<h1>푸터 부분 입니다.</h1>
		</div>
	</div>
</body>
</html>