<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="my.member.MemberDao, my.member.MemberVo" %>
    <%
    MemberDao dao = new MemberDao();
    String user_id = (String)session.getAttribute("user_id"); 
    MemberVo vo = dao.selectMember(user_id);

    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../style.css" type="text/css" />
<title>Insert title here</title>
<script type="text/javascript">
var right = 0;
function regChk(){
var user_pw = document.form.user_pw.value;
if(user_pw.length<6 || user_pw==null){
alert("비밀번호를 입력하십시오(6글자이상)");
return false;
}

var user_pw2 = document.form.user_pw2.value;
if(user_pw2.length<6 || user_pw2==null){
alert("비밀번호 확인을 입력하십시오(6글자이상)");
return false;
}


var email = document.form.email.value;
if(email.length==0 || email==null){
alert("이메일을 입력하십시오");
return false;
}


var phone_number = document.fo	rm.phone_number.value;
if(phone_number.length==0 || phone_number==null){
alert("핸드폰번호를 입력하십시오");
return false;
}
if (!num_regx.test(phone_number) || !num_regx.test(phone_number)){
alert("핸드폰번호는 숫자만 입력가능합니다");
return false;
}

var address = document.form.address.value;
if(address.length==0 || address==null){
alert("주소를 입력하십시오");
return false;
}


form.action = "updateFormProc.jsp";
form.target = "_self";
form.submit();
}

function passchk(){
var user_pw = document.form.user_pw.value;
var user_pw2 = document.form.user_pw2.value;
if (user_pw2.length == 0 || user_pw2 == null) {
document.form.chk.value = "비밀번호를 입력하세요";
right = 0;
} else if (user_pw != user_pw2) {
document.form.chk.value = "비밀번호가 다릅니다.";
right = 0;
} else { 
document.form.chk.value = "비밀번호가 동일합니다.";
right = 1;
}
return;
}

</script>
</head>
<body>


<div id="content">
		<div id="top">
			<p><a href="index.html">Home</a><a href="#">고객센터</a>
		</div>

		<div id="search">
			<a href="index.html"><img src = "../images/name.jpg" height = "150"></a>
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
					<li><a href="hirelist.jsp">채용 공고</a></li>
					<li><a href="reglist.jsp">개인 공고</a></li>
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
        <form action="updateFormProc.jsp" name="form" method="post">
   <p align="center">
<table width="655px" height="400" style="margin-left:  0 0 20px;">
 
        <tr>
         <td width="150" bgcolor="#CEF279">
<b><label for="user_pw">아이디(수정 불가)</label></b></td>
<td><input type="text" name="user_id" value="<%=vo.getUser_id()%>" readonly><br></td></tr>      
<tr><td bgcolor="#CEF279"><b><label for="user_pw">비밀번호(6자 이상)</label></b></td>
<td><input id="user_pw" name="user_pw" type="password" value="<%=vo.getUser_pw() %>"  ><br></td></tr>
<tr><td bgcolor="#CEF279"><b><label for="user_pw2">비번확인</label></b></td>
<td><input id="user_pw2" type="password"name="user_pw2" onblur="passchk()"> 
<label for="user_pw3">&nbsp;&nbsp;&nbsp;&nbsp;</label>
<input type="text" name="chk" value="비번 입력하세요" readonly="readonly"><br></b></tr>
<tr><td bgcolor="#CEF279"><b><label for="email">이메일</label></b></td>
<td><input type="text"  name="email"value="<%=vo.getEmail()%>"></td></tr>
<tr><td bgcolor="#CEF279"><b><label for="phone_number">핸드폰(숫자만 입력)</label></b></td>
<td><input type="text" name="phone_number"value="<%=vo.getPhone_number()%>"></label></td></tr>
<tr><td bgcolor="#CEF279"><b><label for="address1">주소</label></b></td>
<td> <input type="text" name="address1" value="<%=vo.getAddress1()%>"></td></tr>
<tr><td bgcolor="#CEF279"><b><label for="address2">상세주소</label></b></td>
<td> <input type="text" name="address2" value="<%=vo.getAddress2()%>" ></td></tr>
 
    <tr>
   <td align="center" colspan="2">
   <hr><br>

     
  <button input type="submit"  onclick="up()">수정완료</button>
  <button input type="reset" >다시입력</button>
 </form>
   </td>
  </tr>

</body>
</html>
