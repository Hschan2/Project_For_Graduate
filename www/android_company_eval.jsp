<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,org.json.simple.*" %>
<%
	PreparedStatement pstmt;
 	Connection cn = null;

 %>
<%	

	//test link
	//--------------personal이 돌렷을떄------------------------------
	request.setCharacterEncoding("utf-8");
	String user_number=request.getParameter("user_number");
	String best_user=request.getParameter("best_user");
	String match=request.getParameter("match");
	
	int a = 0;
	JSONObject jObject = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jMain = new JSONObject();

if(match.equals("0")){
		
	try{
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit?zeroDateTimeBehavior=convertToNull";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   

	 	String Sql = "insert into company_eval values(0,0,0,0,?,?)";
		pstmt = cn.prepareStatement(Sql);
		pstmt.setString(1, user_number);
		pstmt.setString(2, best_user);
		pstmt.execute();
		
		jObject.put("msg_ok","true");
		
		
		
		jArray.add(0,jObject);
		jMain.put("List",jArray);
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
}else{
	try{
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit?zeroDateTimeBehavior=convertToNull";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   

	 	String Sql = "insert into company_eval values(0,0,0,0,?,?)";
		pstmt = cn.prepareStatement(Sql);
		pstmt.setString(1, user_number);
		pstmt.setString(2, best_user);
		pstmt.execute();
		
		jObject.put("msg_ok","true");
		
		
		
		jArray.add(0,jObject);
		jMain.put("List",jArray);
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
}
%>


