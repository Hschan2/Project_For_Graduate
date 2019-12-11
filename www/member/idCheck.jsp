<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="my.member.MemberDao"/>
<%
 int rst = 0;
 String user_id = (String)request.getParameter("user_id");
 rst = dao.idCheck(user_id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 중복 확인</title>
</head>
<body>
<%
if(rst == 1){
%>
<img src="../images/joong1.png" width="270" height="146">
<!-- 아이디가 이미 존재할때 이미지 -->
<%}else{ %>
<img src="../images/joong2.png" width="270" height="146">
<!-- 아이디가 존재하지 않을 때 이미지 -->
<%} %>
</body>
</html>
