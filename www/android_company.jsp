<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="java.sql.*,java.util.*,org.json.simple.*,java.util.Calendar,java.net.URLEncoder" %>
<%
	PreparedStatement pstmt;
	PreparedStatement pstmt2;
	Connection cn = null;
	Statement stmt;

 %>
<%	


	//************person & company****************insert,update 하는거 뒤에 0 붙이기(count추가)!! WEB 
	response.setCharacterEncoding("UTF-8");

	Calendar c = Calendar.getInstance();
	int now_year=c.get(Calendar.YEAR);
	String number = request.getParameter("id");
	String title = request.getParameter("title");
	String emp =request.getParameter("emp");
	String age =request.getParameter("age");
	String gender =request.getParameter("gender");
	String collage =request.getParameter("collage");
	String week =request.getParameter("week");
	String strong =request.getParameter("strong");
	String foreign =request.getParameter("foreign");
	String money =request.getParameter("money");
	String spinner =request.getParameter("spinner");
	
	String user_title =new String(title.getBytes("8859_1"),"utf-8");
	String user_emp =new String(emp.getBytes("8859_1"),"utf-8");
	String user_gender =new String(gender.getBytes("8859_1"),"utf-8");
	String user_collage =new String(collage.getBytes("8859_1"),"utf-8");
	String user_age =new String(age.getBytes("8859_1"),"utf-8");
	String user_week =new String(week.getBytes("8859_1"),"utf-8");
	String user_strong =new String(strong.getBytes("8859_1"),"utf-8");
	String user_foreign =new String(foreign.getBytes("8859_1"),"utf-8");
	String user_money =new String(money.getBytes("8859_1"),"utf-8");
	String user_spinner =new String(spinner.getBytes("8859_1"),"utf-8");
	JSONObject jObject = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jMain = new JSONObject();
	int user_number = Integer.parseInt(number);
	try{
		//test request link
		//http://localhost:8080/android_test02/android_company.jsp?id=1&title=1&emp=%EA%B3%84%EC%95%BD%EC%A7%81&age=50&gender=%EC%97%AC%EC%9E%90&collage=%EA%B3%A0%EB%93%B1%ED%95%99%EA%B5%90%20%EC%A1%B8%EC%97%85%20|&week=%EC%9B%94%EC%9A%94%EC%9D%BC%20|&strong=%EB%AC%B8%EC%84%9C%EC%9E%91%EC%84%B1%20%EB%8A%A5%EC%88%99%20|&foreign=%EC%98%81%EC%96%B4%20%EC%83%81%20|&money=1213&spinner=1
		
		
		
		String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit?zeroDateTimeBehavior=convertToNull";
	 	String dbId="ci2016pocit";
	 	String dbPw="2016pocit";
		Class.forName("com.mysql.jdbc.Driver");
	 	cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   
	 	

		//저장되어있는 usernumber 마지막(마지막으로 가입한 회원)number 구하기
		String Sql_user_number_LIMIT = "select user_number from user_personal order by user_number desc LIMIT 1";
		stmt=cn.createStatement();
		ResultSet rs_LIMIT = stmt.executeQuery(Sql_user_number_LIMIT);
			 	
		int LIMIT =0;
		if(rs_LIMIT.next()){
			LIMIT = rs_LIMIT.getInt("user_number");
		}else if(!rs_LIMIT.next()){
			jObject.put("msg_ok","false");
		}
				
		
		String[] split_week = user_week.split("[,]");
		String[] split_special = user_strong.split("[,]");
		String[] split_foreign = user_foreign.split("[,]");
				
		for(int i =1; i<=LIMIT;i++){
					
			int user_count=0;

				
				
			//week sql count
			String Sql_all_week = "SELECT user_number";
			for(int r = 0; r < split_week.length; r++ ){
				Sql_all_week+=", count(case when week like ? then 1 end) cnt"+r;
			}
			Sql_all_week+=" FROM user_personal where user_number=(?)";
			pstmt = cn.prepareStatement(Sql_all_week.toString());
			for(int r = 0; r < split_week.length; r++ ){
				pstmt.setString(r+1,"%"+split_week[r]+"%");
			}
			pstmt.setInt(split_week.length+1,i);
			ResultSet rs_week = pstmt.executeQuery();
				
			
			if(rs_week.next()){
				for(int r = 0; r < split_week.length; r++ ){
					user_count+=rs_week.getInt("cnt"+r);
				}
			}else if(!rs_week.next()){
				jObject.put("msg_ok","false");
			}
				
			//special sql count
			String Sql_all_special = "SELECT user_number";
			for(int r = 0; r < split_special.length; r++ ){
				Sql_all_special+=", count(case when special like ? then 1 end) cnt"+r;
			}
			Sql_all_special+=" FROM user_personal where user_number=(?)";
			pstmt = cn.prepareStatement(Sql_all_special.toString());
			for(int r = 0; r < split_special.length; r++ ){
				pstmt.setString(r+1,"%"+split_special[r]+"%");
			}
			pstmt.setInt(split_special.length+1,i);
			ResultSet rs_special = pstmt.executeQuery();
				
	
			if(rs_special.next()){
				for(int r = 0; r < split_special.length; r++ ){
					user_count+=rs_special.getInt("cnt"+r);
				}
			}else if(!rs_special.next()){
				jObject.put("msg_ok","false");
			}
				
			//foreign sql count
			String Sql_all_foreign = "SELECT user_number";
			for(int r = 0; r < split_foreign.length; r++ ){
				Sql_all_foreign+=", count(case when language like ? then 1 end) cnt"+r;
			}
			Sql_all_foreign+=" FROM user_personal where user_number=(?)";
			pstmt = cn.prepareStatement(Sql_all_foreign.toString());
			for(int r = 0; r < split_foreign.length; r++ ){
				pstmt.setString(r+1,"%"+split_foreign[r]+"%");
			}
			pstmt.setInt(split_foreign.length+1,i);
			ResultSet rs_foreign = pstmt.executeQuery();
				
			
			if(rs_foreign.next()){
				for(int r = 0; r < split_foreign.length; r++ ){
					user_count+=rs_foreign.getInt("cnt"+r);
				}
			}else if(!rs_foreign.next()){
				jObject.put("msg_ok","false");
			}
		
			//조건에 맞으면 1을반환 아니면 0 
			String Sql_all = "SELECT user_number, count(case when hire=(?) then 1 end)cnt1, count(case when sex=(?) then 1 end )cnt2,count(case when money=(?) then 1 end )cnt3 FROM user_personal where user_number=(?)";
				 	
			pstmt = cn.prepareStatement(Sql_all.toString());
			pstmt.setString(1,user_emp);
			pstmt.setString(2,user_gender);
			pstmt.setString(3,user_money);
			//web 밑에 추가하기 / sql도 추가하기 / pstmt number바꾸기
			//Sql_all += count(case when time1=(?) then 1 end )cnt8 , count(case when time2=(?) then 1 end )cnt9,
			//pstmt.setString(8,user_time1);
			//pstmt.setString(9,user_time2);
			pstmt.setInt(4,i);
			ResultSet rs = pstmt.executeQuery();
					
			if(rs.next()){
				//cnt 모두 합하여 DB count에 넣기
				//web +rs.getInt("cnt9")+rs.getInt("cnt10") 추가하기
				user_count+=rs.getInt("cnt1")+rs.getInt("cnt2")+rs.getInt("cnt3");
				String Sql_count_update="update user_personal set count=(?) where user_number=(?)";
				pstmt = cn.prepareStatement(Sql_count_update.toString());
				pstmt.setInt(1,user_count);
				pstmt.setInt(2,rs.getInt("user_number"));
				pstmt.executeUpdate();
			}else if(!rs.next()){
				jObject.put("msg_ok","false");
			}
		}
		
		String Sql_user_count_desc = "Select user_number from user_personal order by count desc";
		
		ResultSet rs_count_desc = stmt.executeQuery(Sql_user_count_desc);
		
		int user_number_count_desc[] = new int[10];
		int i=0;
		while(rs_count_desc.next()){
			user_number_count_desc[i]=rs_count_desc.getInt("user_number");
			i++;
			
			//추천은 10개만
			if(i>=10){
				break;
			}
		}
		
		
		for(i=0;i<10;i++){
			jObject.put("best_user"+i,user_number_count_desc[i]);
		}
		
		

	 	String Sql = "insert into user_company values(0,?,?,?,?,?,?,0,0,?,?,?,?,0,?)";
		pstmt2 = cn.prepareStatement(Sql.toString());
		//pstmt.setInt(1,user_number);
		pstmt2.setString(1,user_title);
		pstmt2.setString(2,user_emp);
		pstmt2.setString(3,user_gender);
		pstmt2.setString(4,user_age);
		pstmt2.setString(5,user_collage);
		pstmt2.setString(6,user_week);
		pstmt2.setString(7,user_strong);
		pstmt2.setString(8,user_foreign);
		pstmt2.setString(9,user_money);
		pstmt2.setString(10,user_spinner);
		pstmt2.setString(11,number);
		int ok =pstmt2.executeUpdate();
		
		
		String Sql_user_number_LIMIT_company = "select user_number from user_company order by user_number desc LIMIT 1";
		stmt=cn.createStatement();
		ResultSet rs_LIMIT_company = stmt.executeQuery(Sql_user_number_LIMIT_company);
			 	
		int LIMIT_company =0;
		if(rs_LIMIT_company.next()){
			LIMIT_company = rs_LIMIT_company.getInt("user_number");
		}
		
		
		
		if(ok==0){
			jObject.put("msg_ok","false");
		}else if(ok==1){
			jObject.put("msg_ok","true");
		}else{
			jObject.put("msg_ok","false");
		}
		
		
		jObject.put("number",LIMIT_company);
		jArray.add(0,jObject);
		jMain.put("List",jArray);
		
		pstmt2.close();
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


