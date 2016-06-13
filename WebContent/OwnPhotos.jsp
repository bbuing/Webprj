<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script src="js/holder.js"></script>
</head>
<body>
	<div style="width:220px; height:220px;">
	<div class="thumbnail">
		<img id="card_img_preview" src="holder.js/200x200"/>
		<div class="caption">
			<input type="text" placeholder="설명"/>
			<input type="file" id="card_img" style="display: none"/>
			<center><button type="button" class="btn btn-info" onClick="document.getElementById('card_img').click();">
				<span class="glyphicon glyphicon-picture"></span>
			</button></center>
		</div>
	</div>
	</div>
</body>
</html>