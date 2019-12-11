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
	String number=request.getParameter("number");
	String star_of=request.getParameter("star");

	int star=Integer.parseInt(star_of);
	String title = new String(request.getParameter("title").getBytes("8859_1"),"utf-8");
	String context = new String(request.getParameter("context").getBytes("8859_1"),"utf-8");
	int a = 0;
	JSONObject jObject = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jMain = new JSONObject();


	
	try{
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit?zeroDateTimeBehavior=convertToNull";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   

	 	String Sql = "update company_eval set name=?,grade=?,comment=? where number=(?)";
		pstmt = cn.prepareStatement(Sql);
		pstmt.setString(1, title);
		pstmt.setInt(2, star);
		pstmt.setString(3, context);
		pstmt.setString(4, number);
		int ok =pstmt.executeUpdate();
		
		
		if(ok==0){
			jObject.put("msg_ok","false");
		}else if(ok==1){
			jObject.put("msg_ok","true");
		}else{
			jObject.put("msg_ok","false");
		}
		
		
		
		
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

%>


