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
	String match=request.getParameter("match");
	
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
   
	 	String Sql02 = "SELECT a. * , b. * , a.name as company_name, b.name as title FROM user a JOIN company_eval b ON a.user_number = b.number_company WHERE b.comment NOT LIKE '0' ORDER BY number DESC ";
		pstmt = cn.prepareStatement(Sql02.toString());
		ResultSet rs = pstmt.executeQuery();
		rs = pstmt.executeQuery();
	
		int i=0;
		
		
			while(rs.next()){
				jObject.put("company"+i,rs.getString("number"));
				jObject.put("company_title"+i,rs.getString("title"));
				jObject.put("company_grade"+i,rs.getString("grade"));
				jObject.put("company_name"+i,rs.getString("company_name"));
				jObject.put("company_comment"+i,rs.getString("comment"));
				i++;
				//추천은 10개만
				if(i>=4){
					break;
				}
			}
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

%>


