<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
a:LINK {
 text-decoration:none;
 color: #ffffff;
}
a:HOVER {
 text-decoration:none;
 color: #ffffff;
}
a:VISITED {
 text-decoration:none;
 color: #ffffff;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����Ƽ��ũ ���� ��������</title>
</head>
<body>
<table width="100%">
 <tr>
  <td colspan="2" height="30" bgcolor="#47C83E">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="white"><b>���� ��������</b></font>
  </td>
 </tr>
 <tr>
  <td colspan="2" height="30" bgcolor="#5D5D5D" align="center" style="padding-left: 150px;color: #ffffff">
  �� ���̵� : <%=(String)session.getAttribute("loginId") %>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="../index.jsp">Ȩ���� �̵�</a>
  </td>
 </tr>
 <tr>
  <td width="20%" align="right" valign="top">
   <jsp:include page="memberMenu.jsp"/>
  </td>
  <td width="80%" align="left">
   <jsp:include page="memberView.jsp"/>
  </td>
 </tr>
</table>
</body>
</html>