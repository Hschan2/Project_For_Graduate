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
alert("��й�ȣ�� �Է��Ͻʽÿ�(6�����̻�)");
return false;
}

var user_pw2 = document.form.user_pw2.value;
if(user_pw2.length<6 || user_pw2==null){
alert("��й�ȣ Ȯ���� �Է��Ͻʽÿ�(6�����̻�)");
return false;
}


var email = document.form.email.value;
if(email.length==0 || email==null){
alert("�̸����� �Է��Ͻʽÿ�");
return false;
}


var phone_number = document.fo	rm.phone_number.value;
if(phone_number.length==0 || phone_number==null){
alert("�ڵ�����ȣ�� �Է��Ͻʽÿ�");
return false;
}
if (!num_regx.test(phone_number) || !num_regx.test(phone_number)){
alert("�ڵ�����ȣ�� ���ڸ� �Է°����մϴ�");
return false;
}

var address = document.form.address.value;
if(address.length==0 || address==null){
alert("�ּҸ� �Է��Ͻʽÿ�");
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
document.form.chk.value = "��й�ȣ�� �Է��ϼ���";
right = 0;
} else if (user_pw != user_pw2) {
document.form.chk.value = "��й�ȣ�� �ٸ��ϴ�.";
right = 0;
} else { 
document.form.chk.value = "��й�ȣ�� �����մϴ�.";
right = 1;
}
return;
}

</script>
</head>
<body>


<div id="content">
		<div id="top">
			<p><a href="index.html">Home</a><a href="#">������</a>
		</div>

		<div id="search">
			<a href="index.html"><img src = "../images/name.jpg" height = "150"></a>
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
					<li><a href="hirelist.jsp">ä�� ����</a></li>
					<li><a href="reglist.jsp">���� ����</a></li>
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
        <form action="updateFormProc.jsp" name="form" method="post">
   <p align="center">
<table width="655px" height="400" style="margin-left:  0 0 20px;">
 
        <tr>
         <td width="150" bgcolor="#CEF279">
<b><label for="user_pw">���̵�(���� �Ұ�)</label></b></td>
<td><input type="text" name="user_id" value="<%=vo.getUser_id()%>" readonly><br></td></tr>      
<tr><td bgcolor="#CEF279"><b><label for="user_pw">��й�ȣ(6�� �̻�)</label></b></td>
<td><input id="user_pw" name="user_pw" type="password" value="<%=vo.getUser_pw() %>"  ><br></td></tr>
<tr><td bgcolor="#CEF279"><b><label for="user_pw2">���Ȯ��</label></b></td>
<td><input id="user_pw2" type="password"name="user_pw2" onblur="passchk()"> 
<label for="user_pw3">&nbsp;&nbsp;&nbsp;&nbsp;</label>
<input type="text" name="chk" value="��� �Է��ϼ���" readonly="readonly"><br></b></tr>
<tr><td bgcolor="#CEF279"><b><label for="email">�̸���</label></b></td>
<td><input type="text"  name="email"value="<%=vo.getEmail()%>"></td></tr>
<tr><td bgcolor="#CEF279"><b><label for="phone_number">�ڵ���(���ڸ� �Է�)</label></b></td>
<td><input type="text" name="phone_number"value="<%=vo.getPhone_number()%>"></label></td></tr>
<tr><td bgcolor="#CEF279"><b><label for="address1">�ּ�</label></b></td>
<td> <input type="text" name="address1" value="<%=vo.getAddress1()%>"></td></tr>
<tr><td bgcolor="#CEF279"><b><label for="address2">���ּ�</label></b></td>
<td> <input type="text" name="address2" value="<%=vo.getAddress2()%>" ></td></tr>
 
    <tr>
   <td align="center" colspan="2">
   <hr><br>

     
  <button input type="submit"  onclick="up()">�����Ϸ�</button>
  <button input type="reset" >�ٽ��Է�</button>
 </form>
   </td>
  </tr>

</body>
</html>
