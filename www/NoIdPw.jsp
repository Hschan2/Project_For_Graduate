<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>�˹ٰ�</title>
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
			<p><a href="index.html">Home</a><a href="#">������</a>
		</div>

		<div id="search">
			<a href="index.html"><img src = "images/name.jpg" height = "150"></a>
			<form id="search_engine" method="post" action="." accept-charset="euc-kr">
				<p><input class="searchfield" name="search_query" type="text" id="keywords" value="" onfocus="document.forms['search_engine'].keywords.value='�˻�';" onblur="if (document.forms['search_engine'].keywords.value == '') document.forms['search_engine'].keywords.value='';" />
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
					<li><a href="#">ä�� ����</a></li>
					<li><a href="#">���� ����</a></li>
                   <li><a href="#">�Խ���</a>
                        <ul>
                            <li><a href="#">��������</a></li>
                            <li><a href="#">���ǻ���</a></li> 
							<li><a href="board.jsp">�����Խ���</a></li>
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
			<input class="inputid" type="text" name="id" size="20" placeholder="���̵�"></input>
			</div>
			<div>
			<input class="inputpass" type="password" name="pass" size="20" placeholder="��й�ȣ"></input>
			</div>
			<div>
			<%if(!NoIdPw.equals(tru)){
				%><font color=red>���̵� �Ǵ� ��й�ȣ�� �ٽ� Ȯ���ϼ���.<br>
				�˹ٰ� ��ϵ��� ���� ���̵��̰ų�, ���̵� �Ǵ� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.</font>
			<%
			}
			%>
			</div>
			<input class="loginbutton" name="ok" type="button" value="�α���"  onclick="loginchk()"></input>
			</form>
			<div>
			<a href="member/regFormImpl2.jsp"><font color = "black"><u>ȸ������</u></font></a>
			<a href="#"><font color = "black"><u>���̵� / ��й�ȣ ã��</u></font></a>
			</div>
		</center>
		
		</div>
</div>
</body>
</html>