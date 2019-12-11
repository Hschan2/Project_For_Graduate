<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:useBean id="dao" class="my.member.MemberDao" />
<jsp:setProperty property="*" name="vo" />
<%
String id = (String) session.getAttribute("loginId");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br>
<input type="button" value="회원탈퇴" onclick="javascript:location.href='deleteProc.jsp?id=<%=id%>'">
</body>
</html>
