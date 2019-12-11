<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,org.json.simple.*" %>
<%
	PreparedStatement pstmt;
 	Connection cn = null;

 %>
<%	

	//test link
	//http://localhost:8080/android_test02/android_personal_match.jsp?best_user0=1&best_user1=3&best_user2=5&best_user3=7&best_user4=35&best_user5=30&best_user6=32&best_user7=33&best_user8=34&best_user9=35
	//--------------company이 돌렷을떄------------------------------
	request.setCharacterEncoding("utf-8");
	
	request.setCharacterEncoding("utf-8");
	String best[] = new String[10];
	int best_user[] = new int[10];
	
	for(int i = 0; i < 10 ; i++){
		best[i]=request.getParameter("best_user"+i);
		best_user[i] = Integer.parseInt(best[i]);
	}
	
	
	JSONObject jObject = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jMain = new JSONObject();

	
	int a=0;
	try{
		
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit?zeroDateTimeBehavior=convertToNull";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   
	 	
		
	 	
		for(int i = 0 ; i < 10 ; i ++){
			//company personal usernumber 수정 후 주석 x
		 	/*String Sql = "select user_id from user where user_number=(?)";
			pstmt = cn.prepareStatement(Sql.toString());
			pstmt.setString(1,user_number);
			ResultSet rs = pstmt.executeQuery();
		
			if(rs.next()){
				String number = rs.getString("user_id");
				jObject.put("user_id",number);
			}else if(!rs.next()){
				jObject.put("msg_ok","false");
			}*/
			
			String Sql = "select a.* , b.* from user a, user_company b where a.user_number = b.number and b.user_number=(?)";
			pstmt = cn.prepareStatement(Sql.toString());
			pstmt.setInt(1,best_user[i]);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				jObject.put("msg_ok"+i,"true");
				jObject.put("title"+i,rs.getString("title"));
				jObject.put("hire"+i,rs.getString("hire"));
				jObject.put("sex"+i,rs.getString("sex"));
				jObject.put("age"+i,rs.getString("age"));
				jObject.put("collage"+i,rs.getString("collage"));
				jObject.put("week"+i,rs.getString("week"));
				jObject.put("time1_"+i,rs.getString("time1"));
				jObject.put("time2_"+i,rs.getString("time2"));
				jObject.put("special"+i,rs.getString("special"));
				jObject.put("language"+i,rs.getString("language"));
				jObject.put("money"+i,rs.getString("money"));
				
				jObject.put("number"+i,rs.getString("number"));
				jObject.put("name"+i,rs.getString("name"));
				jObject.put("phone_number"+i,rs.getString("phone_number"));
				jObject.put("email"+i,rs.getString("email"));
				
			}else if(!rs.next()){
				jObject.put("msg_ok","false");
				a=1;
			}
		}
		
		if(a==0){
			jObject.put("msg_ok","true");
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


