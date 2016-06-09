<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.beans.DefaultPersistenceDelegate"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	String path = request.getServletContext().getRealPath("upload");
	int size = 5 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	File file = multi.getFile("file");
%>
<%= file %>