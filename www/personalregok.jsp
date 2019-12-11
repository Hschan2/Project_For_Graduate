<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="java.sql.*,java.util.*,java.util.Calendar,java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="checkstyle.css" type="text/css" />
<title>알바고</title>
<script>
function frmsubmit()
{
	return true;
	}
</script>
</head>
<body>
<%
int user_number_count_desc[] = new int[10];
request.setCharacterEncoding("euc-kr");

String url = "jdbc:mysql://211.218.150.109/ci2016pocit?zeroDateTimeBehavior=convertToNull";
String id = "ci2016pocit";
String pw = "2016pocit";

Class.forName("com.mysql.jdbc.Driver");

String title = request.getParameter("title");
String hire = request.getParameter("hire");
String sex = request.getParameter("sex");
String[] area = request.getParameterValues("area");
String[] week = request.getParameterValues("week");
String time1  =request.getParameter("time1");
String time2 = request.getParameter("time2");
String[] special = request.getParameterValues("special");
String[] language = request.getParameterValues("language");
String money = request.getParameter("money");
String renew = request.getParameter("renew");

int a=0;
String area_all = "";
for(a = 0; a < area.length;a++){
	area_all+=area[a]+",";
}
area_all = area_all.substring(0,area_all.length()-1);
String week_all = "";
for(a = 0; a < week.length;a++){
	week_all+=week[a]+",";
}
week_all = week_all.substring(0,week_all.length()-1);
String special_all = "";
for(a = 0; a < special.length;a++){
	special_all+=special[a]+",";
}
special_all = special_all.substring(0,special_all.length()-1);
String language_all = "";
for(a = 0; a < language.length;a++){
	language_all+=language[a]+",";
}
language_all = language_all.substring(0,language_all.length()-1);
/*String title =new String(title_of.getBytes("8859_1"),"utf-8");
String hire =new String(hire_of.getBytes("8859_1"),"utf-8");
String sex =new String(sex_of.getBytes("8859_1"),"utf-8");
String area =new String(area_all.getBytes("8859_1"),"utf-8");
String week =new String(week_all.getBytes("8859_1"),"utf-8");
String time1 =new String(time1_of.getBytes("8859_1"),"utf-8");
String time2 =new String(time2_of.getBytes("8859_1"),"utf-8");
String special =new String(special_all.getBytes("8859_1"),"utf-8");
String language =new String(language_all.getBytes("8859_1"),"utf-8");
String money =new String(money_of.getBytes("8859_1"),"utf-8");
String renew =new String(renew_of.getBytes("8859_1"),"utf-8");*/

%>
<%
PreparedStatement pstmt;
Statement stmt;
try{
	Connection conn = DriverManager.getConnection(url, id, pw);
	
	//***************************************************************************************************************
	
	//test link http://localhost:8080/android_login/personalregok.jsp?id=1&title=1&hire=1&sex=1&area=1&week=1&special=1&language=1&time1=1&time1=0&money=1&renew=1
		//저장되어있는 usernumber 마지막(마지막으로 가입한 회원)number 구하기
	 	String Sql_user_number_LIMIT = "select user_number from user_company order by user_number desc LIMIT 1";
	 	stmt=conn.createStatement();
		ResultSet rs_LIMIT = stmt.executeQuery(Sql_user_number_LIMIT);
	 	
		int LIMIT =0;
		if(rs_LIMIT.next()){
			LIMIT = rs_LIMIT.getInt("user_number");
		}else if(!rs_LIMIT.next()){
			
		}
		
		//-------------------------------------------------------------------
		String[] split_week = week_all.split("[,]");
		String[] split_special = special_all.split("[,]");
		String[] split_foreign = language_all.split("[,]");

		for(int i =1; i<=LIMIT;i++){
			
			int user_count=0;
			
				
				
			//week sql count
			String Sql_all_week = "SELECT user_number";
			for(int r = 0; r < split_week.length; r++ ){
				Sql_all_week+=", count(case when week like ? then 1 end) cnt"+r;
			}
			Sql_all_week+=" FROM user_company where user_number=(?)";
			pstmt = conn.prepareStatement(Sql_all_week.toString());
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
				break;
			}
			
			//special sql count
			String Sql_all_special = "SELECT user_number";
			for(int r = 0; r < split_special.length; r++ ){
				Sql_all_special+=", count(case when special like ? then 1 end) cnt"+r;
			}
			Sql_all_special+=" FROM user_company where user_number=(?)";
			pstmt = conn.prepareStatement(Sql_all_special.toString());
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
				break;
			}
			
			//foreign sql count
			String Sql_all_foreign = "SELECT user_number";
			for(int r = 0; r < split_foreign.length; r++ ){
				Sql_all_foreign+=", count(case when language like ? then 1 end) cnt"+r;
			}
			Sql_all_foreign+=" FROM user_company where user_number=(?)";
			pstmt = conn.prepareStatement(Sql_all_foreign.toString());
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
				break;
			}
			

			
			String Sql_all = "SELECT user_number, count(case when hire=(?) then 1 end)cnt1, count(case when sex=(?) then 1 end )cnt2, count(case when money=(?) then 1 end )cnt3, count(case when time1=(?) then 1 end )cnt4 , count(case when time2=(?) then 1 end )cnt5 FROM user_company where user_number=(?)";
			//조건에 맞으면 1을반환 아니면 0
			
			
			pstmt = conn.prepareStatement(Sql_all.toString());
			pstmt.setString(1,hire);
			pstmt.setString(2,sex);
			pstmt.setString(3,money);
			pstmt.setString(4,time1);
			pstmt.setString(5,time2);
			pstmt.setInt(6,i);
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()){
				//cnt 모두 합하여 DB count에 넣기
				//web +rs.getInt("cnt9")+rs.getInt("cnt10") 추가하기
				user_count+=rs.getInt("cnt1")+rs.getInt("cnt2")+rs.getInt("cnt3")+rs.getInt("cnt4")+rs.getInt("cnt5");
				String Sql_count_update="update user_company set count=(?) where user_number=(?)";
				pstmt = conn.prepareStatement(Sql_count_update.toString());
				pstmt.setInt(1,user_count);
				pstmt.setInt(2,rs.getInt("user_number"));
				pstmt.executeUpdate();
			}else if(!rs.next()){
				break;
			}
		}
		
				
		String Sql_user_count_desc = "Select user_number from user_company order by count desc";
				
		ResultSet rs_count_desc = stmt.executeQuery(Sql_user_count_desc);
				
		
		int i=0;
		while(rs_count_desc.next()){
			user_number_count_desc[i]=rs_count_desc.getInt("user_number");
			i++;
					
			//추천은 10개만
			if(i>=10){
				break;
			}
		}
				
		

		//***************************************************************************************************************
	 	
		
	String sql = "insert into user_personal(title, hire, sex, area, week, time1, time2, special, language, money, renew,count,number) values(?,?,?,?,?,?,?,?,?,?,?,0,?)";
	PreparedStatement pstmt2 = conn.prepareStatement(sql);
	

	pstmt2.setString(1, title);
	pstmt2.setString(2, hire);
	pstmt2.setString(3, sex);
	pstmt2.setString(4, area_all);
	pstmt2.setString(5, week_all);
	pstmt2.setString(6, time1);
	pstmt2.setString(7, time2);
	pstmt2.setString(8, special_all);
	pstmt2.setString(9, language_all);
	pstmt2.setString(10, money);
	pstmt2.setString(11, renew);
	pstmt2.setString(12,session.getAttribute("user_number").toString());
	
	pstmt2.executeUpdate();
	pstmt2.close();
	
	conn.close();
	%>
    <jsp:forward page="matchok.jsp">
    	<jsp:param name="match" value="personal"/>
		<jsp:param name="best_user0" value="<%=user_number_count_desc[0]%>"/>
		<jsp:param name="best_user1" value="<%=user_number_count_desc[1]%>"/>
		<jsp:param name="best_user2" value="<%=user_number_count_desc[2]%>"/>
		<jsp:param name="best_user3" value="<%=user_number_count_desc[3]%>"/>
		<jsp:param name="best_user4" value="<%=user_number_count_desc[4]%>"/>
		<jsp:param name="best_user5" value="<%=user_number_count_desc[5]%>"/>
		<jsp:param name="best_user6" value="<%=user_number_count_desc[6]%>"/>
		<jsp:param name="best_user7" value="<%=user_number_count_desc[7]%>"/>
		<jsp:param name="best_user8" value="<%=user_number_count_desc[8]%>"/>
		<jsp:param name="best_user9" value="<%=user_number_count_desc[9]%>"/>
    </jsp:forward>
    <%
}catch(SQLException e) {
	out.println(e.toString());
}
%>
<script>
self.window.alert("등록 완료하였습니다.");
</script>

</body>
</html>