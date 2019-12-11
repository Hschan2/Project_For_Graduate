<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="my.member.MemberDao, my.member.MemberVo" %>
    <%
    MemberDao dao = new MemberDao();
    String id= (String)request.getParameter("user_id"); 

    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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
        <p align="center">
<table width="655px" height="400" style="margin-left:  0 0 20px;">
 
<tr><td width="80" bgcolor="#CEF279"><b>ID : </b></td>
<td><%=vo.getUser_id() %></td></tr>
<tr><td bgcolor="#CEF279"><b>이름 : </b></td>
<td><%=vo.getName() %></td></tr>
<tr><td bgcolor="#CEF279"><b>이메일 : </b></td>
<td><%=vo.getEmail() %></td></tr>
<tr><td bgcolor="#CEF279"><b>생년월일 : </b></td>
<td><%=vo.getBirth_date() %></td></tr>
<tr><td bgcolor="#CEF279"><b>핸드폰번호 : </b></td>
<td><%=vo.getPhone_number() %></td></tr>
<tr><td bgcolor="#CEF279"><b>나이 : </b></td>
<td><%=vo.getAge() %></td></tr>
<tr><td bgcolor="#CEF279"><b>주소 : </b></td>
<td><%=vo.getAddress1() %> <%=vo.getAddress2() %></td></tr>
  <tr>
   <td align="center" colspan="2">
   <hr><br>
    <form action="updateForm.jsp">
				<input type=hidden name="id" value=id>
				 <input class="loginbutton" type="submit" name="input" value="내정보수정"/>
				 </form>
				<input type="button" value="회원탈퇴" onclick="javascript:location.href='deleteProc.jsp?id=<%=user_id%>'"> 
   </td>
  </tr>
 </table>
 </p>
</body>
</html>
	