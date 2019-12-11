<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="description" content="Small Corporation" />
<meta name="keywords" content="small, corporation" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="checkstyle.css" type="text/css" />

<script>

function loginchk(){
	
	 var regx = /^[a-zA-Z0-9]*$/;
	 var id = document.login.id.value;
	 var pass = document.login.pass.value;

	 
	 if (id.length == 0 || id == null) {
	  document.login.id.focus();
	  return;
	 }
	 if (!regx.test(id)){
	  document.login.id.focus();
	  return false;
	 }
	 if (pass.length == 0 || pass == null) {
	  document.login.pass.focus();
	  return;
	 }
	 if (!regx.test(pass)){
	  document.login.pass.focus();
	  return false;
	 }
	 
	 document.login.submit();
	 
	}
	
function popupOpen(){
		window.open('member/Findid.jsp',"아이디 찾기",'width=580,height=250');
}
function popupOpen2(){
		window.open('member/Findid2.jsp',"비밀번호 찾기",'width=580,height=250');
}
function popupOpen3(){
	window.open('member/regFormImpl2.jsp',"회원가입",'width=580,height=750');
}
function popupOpen4(){
	window.open('member/regFormImpl3.jsp',"회원가입",'width=580,height=750');
}
</script>

<title>알바고</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");

String id =request.getParameter("user_id");
String sessionOk = null;
sessionOk = (String) session.getAttribute("who");

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://211.218.150.109:3306/ci2016pocit";
String ID = "ci2016pocit";
String pw = "2016pocit";
int total = 0;


try{
	Connection conn = DriverManager.getConnection(url, ID, pw);
	Statement stmt = conn.createStatement();
	
	String sql = "select count(*) from user_company";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		total = rs.getInt(1);
	}
	rs.close();
	
	
	String sqlList = "select user_number, title, hire, collage, sex, money from user_company order by user_number desc";
	PreparedStatement pstmt = conn.prepareStatement(sqlList);
	
	rs = pstmt.executeQuery();
%>

<div id="content">
		<div id="top">
			<p><a href="index.html">Home</a><a href="service.jsp">고객센터</a>
		</div>

		<div id="search">
			<a href="index.html"><img src = "images/name.jpg" height = "150"></a>
			<form id="search_engine" method="post" action="search.jsp" accept-charset="euc-kr">
				<p><select name = "list">
				<option value="hire">채용</option><option value="personal">개인</option></select>
				<input class="searchfield" name="search" type="text" placeholder="찾고 싶은 제목 입력" />
				<input class="searchbutton" name="submit" type="submit" value="검색" /></p>
			</form>
		</div>
		
		<div id = "miniblank"></div>
		    
       <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">
                <ul id="nav">
                  <li><a href="hirereg.jsp">등록하기</a>
                    <ul>
                      <li><a href="hirereg.jsp">채용등록</a></li>
                      <li><a href="personalreg.jsp">개인등록</a></li>      
                    </ul>
                  </li>
					<li><a href="hirelist.jsp">채용 공고</a></li>
					<li><a href="reglist.jsp">개인 공고</a></li>
                   <li><a href="list.jsp">게시판</a>
                        <ul>
                            <li><a href="list.jsp">공지사항</a></li>
                            <li><a href="service.jsp">건의사항</a></li> 
							<li><a href="board.jsp">자유게시판</a></li>
                        </ul> 
                   </li>             
                </ul>  
          </div>
          <div class="col-md-1"></div>
        </div>
    
		<div id = "miniblank"></div>

	<div id="ad">
		<%
		if (sessionOk!=null){
			%>
				<font size="4" color="black"><b><%=session.getAttribute("user_id")%>님 환영합니다</b><br><br></font>
				<form action="logout.jsp">
				<input type=hidden name="id" value=id>
				 <input class="loginbutton" type="submit" name="input" value="로그아웃"/>
				</form>
				<%
				}
		else{
				%>
				<form name=login method="post" action="loginchk.jsp">
			<div>
			<input class="loginfield" type="text" name="id" size="15" placeholder="아이디"></input>
			</div>
			<div>
			<input class="loginfield" type="password" name="pass" size="15" placeholder="비밀번호" onkeypress="if(event.keyCode == 13){ loginchk(); return; }"></input>
			</div>
			<div>
			<input class="loginbutton" name="ok" type="button" value="로그인"  onclick="loginchk()">
			</input>
			</div>
			
			<div>
			<a href="javascript:popupOpen3();"><font color = "black"><u>개인/</u></font></a>
			<a href="javascript:popupOpen4();"><font color = "black"><u>기업 회원가입</u></font></a>
			<a href="javascript:popupOpen();"><font color = "black"><u>아이디/</u></font></a>
			<a href="javascript:popupOpen2();"><font color = "black"><u>비밀번호 찾기</u></font></a>
			</div>
				<%
		} %>
		</div>
		
		<div id = "left">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="600" height="130" >
		<param name="movie" value="images/leftbanner.swf">
		<param name="quality" value="high">
		<embed wmode="transparent" src="images/leftbanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"		type="application/x-shockwave-flash" width="600" height="130"></embed>
		</object>
		</div>
		
		<div id = "empty"></div>
	<% out.print("총 게시물 : " + total + "개" + "&nbsp&nbsp&nbsp&nbsp&nbsp | " + "원하는 글의 번호를 클릭해 주세요."); %>
	<hr>
<table class="one">
 <tr>
   <th width="73" height=30><font size=3><b>번호</b></font></th>
   <th width="310"><font size=3><b>제목</b></font></th>
   <th width="164"><font size=3><b>고용형태</b></font></th>
   <th width="141"><font size=3><b>요구 학력</b></font></th>
   <th width="20"><font size=3><b>성별</b></font></th>
   <th width="38"><font size=3><b>시급</b></font></th>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String title = rs.getString(2);
			String hire = rs.getString(3);
			String collage = rs.getString(4);
			String sex = rs.getString(5);
			String money = rs.getString(6);
%>
<tr>
	<td><%=idx %></a></td>
	<td><a href="hireok.jsp?user_number=<%=idx %>"><%=title %></td>
	<td><%=hire %></td>
	<td><%=collage %></td>
	<td><%=sex %></td>
	<td><%=money %></td>
</tr>
  
<% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
 </table>

</body>
</html>