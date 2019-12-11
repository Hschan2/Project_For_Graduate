<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="description" content="Small Corporation" />
<meta name="keywords" content="small, corporation" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="checkstyle.css" type="text/css" />


<%



request.setCharacterEncoding("euc-kr");
String match = request.getParameter("match");
String[] best_user= new String[10];
best_user[0] = request.getParameter("best_user0");
best_user[1] = request.getParameter("best_user1");
best_user[2] = request.getParameter("best_user2");
best_user[3] = request.getParameter("best_user3");
best_user[4] = request.getParameter("best_user4");
best_user[5] = request.getParameter("best_user5");
best_user[6] = request.getParameter("best_user6");
best_user[7] = request.getParameter("best_user7");
best_user[8] = request.getParameter("best_user8");
best_user[9] = request.getParameter("best_user9");


String sessionOk = null;
sessionOk = (String) session.getAttribute("who");
PreparedStatement pstmt;
Statement stmt;



try{
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://211.218.150.109:3306/ci2016pocit";
	String ID = "ci2016pocit";
	String pw = "2016pocit";
	int total = 0;
	Connection conn = DriverManager.getConnection(url, ID, pw);
	int i;			
%>

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
                   <li><a href="board.jsp">게시판</a>
                        <ul>
                            <li><a href="#">공지사항</a></li>
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
		<embed src="images/leftbanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"		type="application/x-shockwave-flash" width="600" height="130"></embed>
		</object>
		</div>
		
		<div id = "empty"></div>
		
	
	<hr>
<style>
  
body * {
  box-sizing: border-box;
}

.header {
  background-color: #289BFF;
  color: white;
  font-size: 2.5em;
  font: "맑은 고딕";
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}


.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 800px;

}

table {
  width: 100%;
  
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
  font-size: 2em;
}
table td:last-child {
  
  font-size: 2em;
  line-height: 1.4;
  text-align: left;
}
table th {
  background-color: #B4FFFF;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #B4FFFF;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: 'Name:';
    
  }
  td:nth-child(3):before {
    content: 'Email:';
  }
  td:nth-child(4):before {
    content: 'Phone:';
  }
  td:nth-child(5):before {
    content: 'Comments:';
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
  
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
    
  }
  td:last-child {
    padding-bottom: 1rem !important;
    
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}
</style>

<div class="table-users">
   <div class="header">매칭하기</div>


   <table name="mat">
      <tr>
        <th width="80"><font size ="5"></font></th>
        <th width="200"><font size="4">매칭 목록</font></th>
        <th width="320"><font size="4"> 매칭 결과</font></th>
      </tr>

         <%
         if(match.equals("personal")){
     		for(i = 0; i<10; i++){
     			String sql = "select a.* , b.* ,b.user_number as bnumber from user a, user_company b where a.user_number = b.number and b.user_number=(?)";
     			pstmt = conn.prepareStatement(sql.toString());
     			pstmt.setString(1,best_user[i]);
     			ResultSet rs = pstmt.executeQuery();
         if(rs.next()){
        	 %>
        	 <tr>
         	 <td><img src="images/human.png" alt="" /></td>
        	 <td><%=rs.getString("user_id") %></td>
             <td><a href="hireok.jsp?user_number=<%= rs.getString("bnumber") %>"><%=rs.getString("title") %></td>

          </tr>
          <%
			}
		}
		
	}else if(match.equals("company")){
		for(i = 0; i<10; i++){
 			String sql = "select a.* , b.*, b.user_number as bnumber from user a, user_personal b where a.user_number = b.number and b.user_number=(?)";
 			pstmt = conn.prepareStatement(sql.toString());
 			pstmt.setString(1,best_user[i]);
 			ResultSet rs = pstmt.executeQuery();
     if(rs.next()){
    	 %>
    	 <tr>
     	 <td><img src="images/human.png" alt="" /></td>
    	 <td><%=rs.getString("user_id") %></td>
         <td><a href="personalok.jsp?user_number=<%= rs.getString("bnumber") %>"><%=rs.getString("title") %></td>

      </tr>
      <%
		}
	}
	}
	conn.close();
}catch(SQLException e) {
	out.println(e.toString());
}
	
         %>
        
   </table>
</div>
</body>
</html>