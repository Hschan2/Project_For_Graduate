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
			String user_id = rs.getString("user_id");
			if(user_id.equals(id)){
				String user_pw = rs.getString("user_pw");
					if(user_pw.equals(pass)){
						String user_number = rs.getString("user_number");
	    				jObject.put("msg_ok","true");
						jObject.put("user_number",user_number);
						
				}else{
					jObject.put("msg_ok","false");
					jObject.put("user_number","false");
				}
			}else{
				jObject.put("msg_ok","false");
				jObject.put("user_number","false");
			}
		}
		else if(!rs.next()){
			jObject.put("msg_ok","false");
			jObject.put("user_number","false");
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


