<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>알바고</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta name="description" content="Small Corporation" />
	<meta name="keywords" content="small, corporation" />
	<link rel="stylesheet" href="style.css" type="text/css" />
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
</script>
</head>
<body>

<%
	request.setCharacterEncoding("euc-kr");
	String NoIdPw = request.getParameter("NoIdPw");
	String tru = "true";
	%>
<div id="content">
		<div id="top">
			<p><a href="index.html">Home</a><a href="#">고객센터</a>
		</div>

		<div id="search">
			<a href="index.html"><img src = "images/name.jpg" height = "150"></a>
			<form id="search_engine" method="post" action="." accept-charset="euc-kr">
				<p><input class="searchfield" name="search_query" type="text" id="keywords" value="" onfocus="document.forms['search_engine'].keywords.value='검색';" onblur="if (document.forms['search_engine'].keywords.value == '') document.forms['search_engine'].keywords.value='';" />
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
					<li><a href="#">채용 공고</a></li>
					<li><a href="#">개인 공고</a></li>
                   <li><a href="#">게시판</a>
                        <ul>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">건의사항</a></li> 
							<li><a href="board.jsp">자유게시판</a></li>
                        </ul> 
                   </li>             
                </ul>  
          </div>
          <div class="col-md-1"></div>
        </div>
		<center>
		<br></br><br></br>
		<form name=login method="post" action="loginchk.jsp">
			<div>
			<input class="inputid" type="text" name="id" size="20" placeholder="아이디"></input>
			</div>
			<div>
			<input class="inputpass" type="password" name="pass" size="20" placeholder="비밀번호"></input>
			</div>
			<div>
			<%if(!NoIdPw.equals(tru)){
				%><font color=red>아이디 또는 비밀번호를 다시 확인하세요.<br>
				알바고에 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.</font>
			<%
			}
			%>
			</div>
			<input class="loginbutton" name="ok" type="button" value="로그인"  onclick="loginchk()"></input>
			</form>
			<div>
			<a href="member/regFormImpl2.jsp"><font color = "black"><u>회원가입</u></font></a>
			<a href="#"><font color = "black"><u>아이디 / 비밀번호 찾기</u></font></a>
			</div>
		</center>
		
		</div>
</div>
</body>
</html>