<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.*" %>
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

function assessOpen(frm){
	var width = 450; 
	  var height = 430; 
	  var left = (screen.width - width) / 2 ; 
	  var top = (screen.height - height) / 2 ; 
	  
	  var winObject = null;
	  var url = "assess.jsp?bname="+frm;
	  
	  winObject = window.open(url,'assess','width='+width+', height='+height+', left='+left+', top='+top);   
	
	}

</script>
<title>�˹ٰ�</title>
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

	int idx = Integer.parseInt(request.getParameter("user_number"));

	try{
		Connection conn = DriverManager.getConnection(url, ID, pw);
		Statement stmt = conn.createStatement();
		
		String sql = "select title, hire, sex, age, collage, week, time1, time2, special, language, money, renew, number from user_company where user_number =" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		
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
		<embed wmode="transparent" src="images/leftbanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"		type="application/x-shockwave-flash" width="600" height="130"></embed>
		</object>
		</div>
		
		<div id = "blank"></div><div id = "blank"></div>
		
		<%
		List<String> collage = new ArrayList<String>(); 
		List<String> week = new ArrayList<String>(); 
		List<String> special = new ArrayList<String>(); 
		List<String> language = new ArrayList<String>(); 
		 while(rs.next()){
				String title = rs.getString(1);
				String hire = rs.getString(2);
				String sex = rs.getString(3);
				String age = rs.getString(4);
				collage.add(new String(rs.getString(5)));
				week.add(new String(rs.getString(6)));
				String time1 = rs.getString(7);
				String time2 = rs.getString(8);
				special.add(new String(rs.getString(9)));
				language.add(new String(rs.getString(10)));
				String money = rs.getString(11);
				String renew = rs.getString(12);
				int money2 = Integer.parseInt(rs.getString(11));
				int number = Integer.parseInt(rs.getString(13));
		%>
		
		<table class = "two" width = "100%">
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">����</th>
				<td>
				<%= title %>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">�������</th>
				<td>
				<%= hire %>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">����</th>
				<td>
				<%= sex %>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">�䱸 ����</th>
				<td>
				<%= age %>&nbsp;��
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">�䱸 �з�</th>
				<td>
				<%= rs.getString(5) %>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">����</th>
				<td>
				<%= rs.getString(6) %>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">�ð�</th>
				<td>
				<%=time1 %>
				&nbsp;��&nbsp;~&nbsp;
				<%=time2 %>
				&nbsp;��
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">�䱸 Ư�����</th>
				<td>
				<%= rs.getString(9) %>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">�䱸 �ܱ��� �ɷ�</th>
				<td>
				<%= rs.getString(10) %>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">�ñ�</th>
				<td>
				<%= money %>&nbsp;��
				<a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)"> �ñް��
				</a><div style="DISPLAY: none">
				<br> * �� 8�ð� �ٹ� : <%= money2*8 %>��
				/ * �� 8�ð� 5�� �ٹ�  : <%= (money2*8)*5 %>�� 
				/ * �� 8�ð� 6�� �ٹ�  : <%= (money2*8)*6 %>�� 
				<br> * �� 8�ð� 20�� �ٹ�  : <%= (money2*8)*20 %>�� 
				/ * �� 8�ð� 24�� �ٹ�  : <%= (money2*8)*24 %>��
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">������ ����</th>
				<td>
				<%= renew %>&nbsp;��
				</td>
			</tr>
<%
		String sql2 = "select phone_number, name from user where user_number =" + number;
		ResultSet rs2 = stmt.executeQuery(sql2);
%>
<%
		while(rs2.next()){
				String phone = rs2.getString(1);
				String username = rs2.getString(2);
%>
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">�ڵ��� ��ȣ</th>
				<td>
				<%= phone %>
				</td>
			</tr>
			<form name="form" method="post">
			<tr>
				<th bgcolor = "#EAEAEA" width = "150">�����</th>
				<td>
				<div name="bname"><%= username %></div>
				</td>
			</tr>
		</table>

		<div id = "blank">
		
		<table width = "100%" style = "border-width : 0px;">
			<tr style = "border-width : 0px;">
			<td align = 'center' style = "border-width : 0px;">
			<%
			if(sessionOk==null){
			%>
			<input class="regbutton" name="ok" type="button" onclick = "location.href='hirelist.jsp'"  value="���" />
			<%
			} else if(sessionOk!=null){
			%>
			<input class="regbutton" name="ok" type="button" onclick = "location.href='hirelist.jsp'"  value="���" />&nbsp;&nbsp;&nbsp;
			<input class="regbutton" name="assess" type="button" onclick = "javascript:assessOpen('<%= username %>');"  value="��" />
			<%
			}
			%>
			</td>
			</tr>
			</form>
			<%
			}rs2.close();
			rs.close();
		 	stmt.close();
		 	conn.close();
			 	} 
			}catch(SQLException e) {
		}

			%>
		</table>
		</div>	
	</div>
	<div id = "blank"></div>
</body>
</html>