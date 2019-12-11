<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,org.json.simple.*" %>
<%
	Statement stmt;
 	Connection cn = null;

 %>
<%	
	request.setCharacterEncoding("utf-8");
	
	int i=0;
	
	JSONObject jObject = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jMain = new JSONObject();


	try{
		
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit?zeroDateTimeBehavior=convertToNull";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   
	 	String Sql = "select * from user_company ORDER BY user_number DESC";
	 	stmt=cn.createStatement();
		ResultSet rs = stmt.executeQuery(Sql);
	if(rs.next()){
		jObject.put("msg_ok","true");
		jObject.put("user_number"+i,rs.getString("user_number"));
		jObject.put("title"+i,rs.getString("title"));
		jObject.put("hire"+i,rs.getString("hire"));
		jObject.put("age"+i,rs.getString("age"));
		jObject.put("collage"+i,rs.getString("collage"));
		jObject.put("special"+i,rs.getString("special"));


		for(i=1;i<3&&rs.next();i++){
			jObject.put("user_number"+i,rs.getString("user_number"));
			jObject.put("title"+i,rs.getString("title"));
			jObject.put("hire"+i,rs.getString("hire"));
			jObject.put("age"+i,rs.getString("age"));
			jObject.put("collage"+i,rs.getString("collage"));
			jObject.put("special"+i,rs.getString("special"));
				
				
		}
	}else if(!rs.next()){
			jObject.put("msg_ok","false");
		}
	jArray.add(0,jObject);
	jMain.put("List",jArray);
		
		rs.close();
		stmt.close();
		cn.close();
		out.println(jMain.toString());
	}catch(Exception e){
		out.println("error" + e.getMessage());
		out.println("실패");
				
	}finally{
		  if(cn!=null){
			  cn.close();
		  }
	}
%>


