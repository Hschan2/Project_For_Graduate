<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="checkstyle.css" type="text/css" />
<title>assess_ok</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

String url = "jdbc:mysql://211.218.150.109:3306/ci2016pocit";
String id = "ci2016pocit";
String pw = "2016pocit";

Class.forName("com.mysql.jdbc.Driver");

String title = request.getParameter("bname");
int grade = Integer.parseInt(request.getParameter("grade"));
String memo = request.getParameter("memo");

try{
	Connection conn = DriverManager.getConnection(url, id, pw);
	
	String sql = "insert into company_eval(name, grade, comment) values(?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, title);
	pstmt.setInt(2, grade);
	pstmt.setString(3, memo);
	
	pstmt.executeUpdate();
	pstmt.close();
	
	conn.close();
}catch(SQLException e) {
	out.println(e.toString());
}
%>
<script>
self.window.alert("등록 완료하였습니다.");
window.close();
</script>
</body>
</html>