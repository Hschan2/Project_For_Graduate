<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

	<title>알바고</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
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
	window.open('clac.jsp',"시급 계산기",'width=600,height=800');
}
</script>

</head>
<body>
<%
		request.setCharacterEncoding("euc-kr");
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
			
			String sqlList = "select user_number, title, hire from user_company order by user_number desc limit 3";
			PreparedStatement pstmt = conn.prepareStatement(sqlList);
			String sqlList1 = "select user_number, title, hire from user_personal order by user_number desc limit 3";
			PreparedStatement pstmt1 = conn.prepareStatement(sqlList1);
			String sqlList2 = "select NUM, TITLE, USERNAME from board_free order by NUM desc limit 3";
			PreparedStatement pstmt2 = conn.prepareStatement(sqlList2);
			String sqlList3 = "select number, name, grade from company_eval order by number desc limit 3";
			PreparedStatement pstmt3 = conn.prepareStatement(sqlList3);
			
			ResultSet rs = pstmt.executeQuery();
			ResultSet rs1 = pstmt1.executeQuery();
			ResultSet rs2 = pstmt2.executeQuery();
			ResultSet rs3 = pstmt3.executeQuery();
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
				 	<form action="member/info.jsp">
				<input type=hidden name="id" value=id>
				 <input class="loginbutton" type="submit" name="input" value="내정보수정"/>
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
			<a href="javascript:popupOpen3();"><font color = "black"><u>회원가입</u></font></a>
			<a href="javascript:popupOpen();"><font color = "black"><u>아이디/</u></font></a>
			<a href="javascript:popupOpen2();"><font color = "black"><u>비밀번호 찾기</u></font></a>
			<a href="javascript:popupOpen4();"><font color = "black"><u>시급 계산기</u></font></a>
			</div>
				<%
			}
			%>
		</div>
		
			<div id = "left">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="600" height="130" >
		<param name="movie" value="images/leftbanner.swf">
		<param name="quality" value="high">
		<embed wmode="transparent" src="images/leftbanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"		type="application/x-shockwave-flash" width="600" height="130"></embed>
		</object>
		</div>
		<div id = "rightbanner2"><a href="javascript:popupOpen4();"><img src = "images/si2.png"></a></div>
		<div id = "rightbanner"><img src = "images/rightbanner_v1.png"></div>
		
		<div id = "empty"></div>

		<table class="main" width="600" border="0" cellspacing="0" cellpadding="0" style="border:0px; padding:2px;">
		<tr style="border:0px; padding:2px;">
		<td style="border:0px; padding:2px;"><font color = "red"><h3>공지사항</h3></font></td>
		<td style="border:0px; padding:2px;" align = "right"><a href = "list.jsp">more</a></td>
		</tr>	
		</table><p>
		<div id = "boardline"></div>
		 <table width="600" cellpadding="0" cellspacing="0" id="board" align = "left" style="border:2px solid #ccc">
        <%
            while(rs2.next()) {
			int idx = rs2.getInt(1);
			String title = rs2.getString(2);
			String name = rs2.getString(3);
		%>
            <tr>
                <td width="500" style="border:0px; padding:2px;"><a href="view.jsp?NUM=<%=idx %>"><%=title %></td>
                <td width="100" style="border:0px; padding:2px;"><%= name %></td>
			</tr>
			 <%
            }
  			rs2.close();
            %>
            </table>
			<div id = "blank"></div>
		<table class="main" width="600" border="0" cellspacing="0" cellpadding="0" style="border:0px; padding:2px;">
		<tr style="border:0px; padding:2px;">
		<td style="border:0px; padding:2px;"><font color = "red"><h3>채용 실시간</h3></font></td>
		<td style="border:0px; padding:2px;" align = "right"><a href = "hirelist.jsp">more</a></td>
		</tr>
		</table><p>
	    <div id = "boardline"></div>
		 <table width="600" cellpadding="0" cellspacing="0" id="board" align = "left" style="border:2px solid #ccc">
		<%
            while(rs.next()) {
			int idx = rs.getInt(1);
			String title = rs.getString(2);
			String hire = rs.getString(3);
		%>
            <tr>
                <td style="border:0px; padding:2px;"><a href="hireok.jsp?user_number=<%=idx %>"><%=title %></td>
                <td width="100" style="border:0px; padding:2px;"><%=hire %></td>
            </tr>
            <%
            }
  			rs.close();
            %>
            </table>
			<div id = "blank"></div>
		<table class="main" width="600" border="0" cellspacing="0" cellpadding="0" style="border:0px; padding:2px;">
		<tr style="border:0px; padding:2px;">
		<td style="border:0px; padding:2px;"><font color = "red"><h3>개인 실시간</h3></font></td>
		<td style="border:0px; padding:2px;" align = "right"><a href = "reglist.jsp">more</a></td>
		</tr>
		</table><p>
	    <div id = "boardline"></div>
		 <table width="600" cellpadding="0" cellspacing="0" id="board" align = "left" style="border:2px solid #ccc">
        <%
            while(rs1.next()) {
			int idx = rs1.getInt(1);
			String title = rs1.getString(2);
			String hire = rs1.getString(3);
		%>
            <tr>
                <td width="500" style="border:0px; padding:2px;"><a href="personalok.jsp?user_number=<%=idx %>"><%=title %></td>
                <td width="100" style="border:0px; padding:2px;"><%=hire %></td>
            </tr>
              <%
            }
  			rs1.close();
            %>
            </table>
			<div id = "blank"></div>
		<table class="main" width="600" border="0" cellspacing="0" cellpadding="0" style="border:0px; padding:2px;">
		<tr style="border:0px; padding:2px;">
		<td style="border:0px; padding:2px;"><font color = "red"><h3>우수 기업</h3></font></td>
		<td style="border:0px; padding:2px;" align = "right"><a href = "#">more</a></td>
		</tr>
		</table><p>
	    <div id = "boardline"></div>
		 <table width="600" cellpadding="0" cellspacing="0" id="board" align = "left" style="border:2px solid #ccc">
        <%
            while(rs3.next()) {
			int idx = rs3.getInt(1);
			String name = rs3.getString(2);
			String grade = rs3.getString(3);
		%>
            <tr>
                <td width="500" style="border:0px; padding:2px;"><a href="#"><%= name %></a></td>
                <td width="100" style="border:0px; padding:2px;"><%= grade %></td>
            </tr>
			<% 
            }
        rs3.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
            </table>
			<div id = "blank"></div>
		</div>	
	</div>
</body>
</html>