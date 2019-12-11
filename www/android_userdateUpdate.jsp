<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="java.sql.*,java.util.*,org.json.simple.*,java.util.Calendar,java.net.URLEncoder" %>
<%
	PreparedStatement pstmt;
 	Connection cn = null;

 %>
<%	
	response.setCharacterEncoding("UTF-8");

	Calendar c = Calendar.getInstance();
	int now_year=c.get(Calendar.YEAR);
	String user_number = request.getParameter("id");
	String user_name = new String(request.getParameter("name").getBytes("8859_1"),"utf-8");
	String user_gender = new String(request.getParameter("gender").getBytes("8859_1"),"utf-8");
	String year = request.getParameter("year");
	String date = request.getParameter("date");
	String user_phon = request.getParameter("ph");
	String user_address = new String(request.getParameter("address").getBytes("8859_1"),"utf-8");
	
	//String user_name= java.net.URLDecoder.decode(name,"UTF-8");
	//String user_address = URLEncoder.encode(address,"euc-kr");
	JSONObject jObject = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jMain = new JSONObject();
	
	int user_year = Integer.parseInt(year);
	int user_date = Integer.parseInt(date);
	int user_age = now_year-user_year;

	try{
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit?zeroDateTimeBehavior=convertToNull";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   
	 	
	 	String Sql = "update user set name=?,gender=?,birth_year=?,birth_date=?,age=?,phone_number=?,address1=? where user_number=?";
		pstmt = cn.prepareStatement(Sql.toString());
		pstmt.setString(1,user_name);
		pstmt.setString(2,user_gender);
		pstmt.setInt(3,user_year);
		pstmt.setInt(4,user_date);
		pstmt.setInt(5,user_age);
		pstmt.setString(6,user_phon);
		pstmt.setString(7,user_address);
		pstmt.setString(8,user_number);
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
		
		pstmt.close();
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


