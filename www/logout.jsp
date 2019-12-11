<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page session="true" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>로그아웃</title>
</head>
<body>
<%

 session.removeAttribute("who");
 response.sendRedirect("index.html");
%>
</body>
</html>
