<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,org.json.simple.*" %>
<%
	PreparedStatement pstmt;
 	Connection cn = null;

 %>
<%	
	request.setCharacterEncoding("utf-8");
	
	String user_number = request.getParameter("id");
	
	
	JSONObject jObject = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jMain = new JSONObject();


	try{
		
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit?zeroDateTimeBehavior=convertToNull";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   
	 	String Sql = "select * from user where user_number=(?)";
		pstmt = cn.prepareStatement(Sql.toString());
		pstmt.setString(1,user_number);
		ResultSet rs = pstmt.executeQuery();
	
		if(rs.next()){
			String number = rs.getString("user_number");
			if(user_number.equals(number)){
				jObject.put("msg_ok","true");
				
				if(rs.getString("name")==null){
					jObject.put("name","null");
				}else{
					jObject.put("name",rs.getString("name"));
				}
				
				if(rs.getString("gender")==null){
					jObject.put("gender","null");
				}else{
					jObject.put("gender",rs.getString("gender"));
				}
				
				if(rs.getString("birth_date")==null){
					jObject.put("birth","null");
				}else{
					jObject.put("birth",rs.getString("birth_date"));
				}
				
				if(rs.getString("phone_number")==null){
					jObject.put("phone_number","null");
				}else{
					jObject.put("phone_number",rs.getString("phone_number"));
				}
				
				if(rs.getString("email")==null){
					jObject.put("email","null");
				}else{
					jObject.put("email",rs.getString("email"));
				}
				
				if(rs.getString("address1")==null){
					jObject.put("address","null");
				}else{
					String add = rs.getString("address1");
					jObject.put("address",add);
				}
				
				
			}
		}else if(!rs.next()){
			jObject.put("msg_ok","false");
		}
		
		
		
		String Sql02 = "select a.* , b.* from user a join company_eval b on a.user_number = b.number_company where b.number_person=(?)  and b.comment like '0'";
		pstmt = cn.prepareStatement(Sql02.toString());
		pstmt.setString(1,user_number);
		rs = pstmt.executeQuery();
	
		int i=0;
		
		if(!rs.next()){
			jObject.put("company"+i,"null");
			jObject.put("company_name"+i,"null");
		}else{
			//while(rs.next()){
				jObject.put("company"+i,rs.getString("number"));
				jObject.put("company_name"+i,rs.getString("name"));
				//i++;
				
				//추천은 10개만
				//if(i>=10){
				//	break;
				//}
			//}
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


