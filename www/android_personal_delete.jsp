<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,org.json.simple.*" %>
<%
	PreparedStatement pstmt;
 	Connection cn = null;

 %>
<%	
	request.setCharacterEncoding("utf-8");
	
	String number = request.getParameter("number");
	
	
	JSONObject jObject = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jMain = new JSONObject();
	
	try{
		
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   
	 	String Sql = "delete from user_personal where user_number=(?)";
		pstmt = cn.prepareStatement(Sql.toString());
		pstmt.setString(1,number);
		pstmt.executeUpdate();
	
		
		jObject.put("msg_ok","true");
		
		
		jArray.add(0,jObject);
		jMain.put("List",jArray);
		
		pstmt.close();
		cn.close();
		out.println(jMain.toString());
	}catch(SQLException e){
		out.println("error" + e.getMessage());
		e.printStackTrace();
		out.println("실패");
		
	}finally{
		  if(cn!=null){
			  cn.close();
		  }
	}
	%>

	
