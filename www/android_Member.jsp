<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,org.json.simple.*" %>
<%
	PreparedStatement pstmt;
 	Connection cn = null;

 %>
<%	
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
	
	
	JSONObject jObject = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jMain = new JSONObject();
	
	try{
		
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   
	 	String Sql = "select * from user where user_id=(?)";
		pstmt = cn.prepareStatement(Sql.toString());
		pstmt.setString(1,id);
		ResultSet rs = pstmt.executeQuery();
	
		if(rs.next()){
			jObject.put("member_ok","overlap");
		}else if(!rs.next()){
			Sql = "insert into user(user_id,user_pw,email) values(?,?,?)";
			pstmt = cn.prepareStatement(Sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, email);
			pstmt.execute();
			
			jObject.put("member_oK","true");
		}
		
		
		
		jArray.add(0,jObject);
		jMain.put("member_List",jArray);
		
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

	
