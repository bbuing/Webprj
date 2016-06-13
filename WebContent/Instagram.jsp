<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<title>Instagram Login</title>
</head>
<body>
<script>
	$(document).ready(function(){
		var token = document.location.href.split("token=");
		
		function post_token() {
			$("<form>",{
				method : "POST",
				action : "http://localhost:8080/Webprj/Write_google.jsp",
				value : $("<input>",{
					type : "hidden",
					name : "token",
					value : token[1]
					})
			}).submit();
		}
		window.close();
	});
</script>
</body>
</html>