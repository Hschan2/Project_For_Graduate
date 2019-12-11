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
		window.open('member/Findid.jsp',"���̵� ã��",'width=580,height=250');
}
function popupOpen2(){
		window.open('member/Findid2.jsp',"��й�ȣ ã��",'width=580,height=250');
}
function popupOpen3(){
	window.open('member/regFormImpl2.jsp',"ȸ������",'width=580,height=750');
}
function popupOpen4(){
	window.open('member/regFormImpl3.jsp',"ȸ������",'width=580,height=750');
}
</script>

<title>�˹ٰ�</title>
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
	
	String sql = "select count(*) from company_eval";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		total = rs.getInt(1);
	}
	rs.close();
	
	String sqlList = "select number, name, grade, comment from company_eval order by grade desc";
	PreparedStatement pstmt = conn.prepareStatement(sqlList);
	
	rs = pstmt.executeQuery();
%>

<div id="content">
		<div id="top">
			<p><a href="index.jsp">Home</a><a href="service.jsp">������</a>
		</div>

		<div id="search">
			<a href="index.jsp"><img src = "images/name.jpg" height = "150"></a>
			<form id="search_engine" method="post" action="search.jsp" accept-charset="euc-kr">
				<p><select name = "list">
				<option value="hire">ä��</option><option value="personal">����</option></select>
				<input class="searchfield" name="search" type="text" placeholder="ã�� ���� ���� �Է�" />
				<input class="searchbutton" name="submit" type="submit" value="�˻�" /></p>
			</form>
		</div>
		
		<div id = "miniblank"></div>
		    
       <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">
                <ul id="nav">
                  <li><a href="hirereg.jsp">����ϱ�</a>
                    <ul>
                      <li><a href="hirereg.jsp">ä����</a></li>
                      <li><a href="personalreg.jsp">���ε��</a></li>      
                    </ul>
                  </li>
					<li><a href="hirelist.jsp">ä�� ����</a></li>
					<li><a href="reglist.jsp">���� ����</a></li>
                   <li><a href="list.jsp">�Խ���</a>
                        <ul>
                            <li><a href="list.jsp">��������</a></li>
                            <li><a href="service.jsp">���ǻ���</a></li> 
							<li><a href="board.jsp">�����Խ���</a></li>
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
				<font size="4" color="black"><b><%=session.getAttribute("user_id")%>�� ȯ���մϴ�</b><br><br></font>
				<form action="logout.jsp">
				<input type=hidden name="id" value=id>
				 <input class="loginbutton" type="submit" name="input" value="�α׾ƿ�"/>
				</form>
				<%
				}
		else{
				%>
				<form name=login method="post" action="loginchk.jsp">
			<div>
			<input class="loginfield" type="text" name="id" size="15" placeholder="���̵�"></input>
			</div>
			<div>
			<input class="loginfield" type="password" name="pass" size="15" placeholder="��й�ȣ" onkeypress="if(event.keyCode == 13){ loginchk(); return; }"></input>
			</div>
			<div>
			<input class="loginbutton" name="ok" type="button" value="�α���"  onclick="loginchk()">
			</input>
			</div>
			
			<div>
			<a href="javascript:popupOpen3();"><font color = "black"><u>����/</u></font></a>
			<a href="javascript:popupOpen4();"><font color = "black"><u>��� ȸ������</u></font></a>
			<a href="javascript:popupOpen();"><font color = "black"><u>���̵�/</u></font></a>
			<a href="javascript:popupOpen2();"><font color = "black"><u>��й�ȣ ã��</u></font></a>
			</div>
				<%
		} %>
		</div>
		
		<div id = "left">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="600" height="130" >
		<param name="movie" value="images/leftbanner.swf">
		<param name="quality" value="high">
		<embed src="images/leftbanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"		type="application/x-shockwave-flash" width="600" height="130"></embed>
		</object>
		</div>
		
		<div id = "empty"></div>
	<% out.print("�� �Խù� : " + total + "��"); %>
	<hr>
<table class="one">
 <tr>
   <th width="250"><font size=3><b>�����</b></font></th>
   <th width="100"><font size=3><b>������</b></font></th>
   <th width="550"><font size=3><b>�򰡳���</b></font></th>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">��ϵ� ���� �����ϴ�.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String title = rs.getString(2);
			int grade = rs.getInt(3);
			String comment = rs.getString(4);
%>
<tr>
	<td><%=title %></td>
	<%
	if(grade == 0){
	%>
	<td>�١١١١�</td>
	<%
	} else if(grade == 1){
	%>
	<td>�ڡ١١١�</td>
	<%
	} else if(grade == 2){
	%>
	<td>�ڡڡ١١�</td>
	<%
	} else if(grade == 3){
	%>
	<td>�ڡڡڡ١�</td>
	<%
	} else if(grade == 4){
	%>
	<td>�ڡڡڡڡ�</td>
	<%
	} else if(grade == 5){
	%>
	<td>�ڡڡڡڡ�</td>
	<%
	}
	%>
	<td><%=comment %></td>
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
 <table style="margin-left: auto; margin-right: auto;"><tr><td>
<form id="search_engine" method="post" action="asearch.jsp" accept-charset="euc-kr">
				<input class="searchfield" name="search" type="text" placeholder="ã�� ���� �����" />
				<input class="searchbutton" name="submit" type="submit" value="�˻�" /></p>
</form>
</td></tr></table>
</body>
</html>