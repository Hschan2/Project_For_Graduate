<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
     
<script>

function loginchk(){
	
	 var regx = /^[a-zA-Z0-9]*$/;
	 var id = document.login.id.value;
	 var pass = document.login.pass.value;

	 
	 if (id.length == 0 || id == null) {
	  document.login.id.focus();
	  alert("���̵� �Է����ּ���.");
	  return;
	 }
	 if (!regx.test(id)){
	  document.login.id.focus();
	  return false;
	 }
	 if (pass.length == 0 || pass == null) {
	  document.login.pass.focus();
	  alert("��й�ȣ�� �Է����ּ���.");
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

function writeCheck()
{
	var form = document.hireform;
	
	if( !form.title.value )  
	{
		alert( "������ �����ּ���" ); 
		form.title.focus();  
		return;
	}
 
	if( !form.hire.value )
	{
		alert( "������¸� �������ּ���" );
		form.hire.focus();
		return;
	}
 
	if( !form.sex.value )
	{
		alert( "������ �������ּ���" );
		form.sex.focus();
		return;
	}

	if( !form.money.value )
	{
		alert( "�ñ��� �����ּ���" );
		form.money.focus();
		return;
	}

	form.submit();
	}
</script>
     
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="description" content="Small Corporation" />
<meta name="keywords" content="small, corporation" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="checkstyle.css" type="text/css" />
<title>�˹ٰ�</title>
</head>
<body>
<%
		request.setCharacterEncoding("euc-kr");
		String id =request.getParameter("user_id");
		String sessionOk = null;
		sessionOk = (String) session.getAttribute("who");
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
			<a href="javascript:popupOpen3();"><font color = "black"><u>ȸ������</u></font></a>
			<a href="javascript:popupOpen();"><font color = "black"><u>���̵�/</u></font></a>
			<a href="javascript:popupOpen2();"><font color = "black"><u>��й�ȣ ã��</u></font></a>
			</div>
			</form>
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
		
		<form name="hireform" method="post" action="hireregok.jsp">
		<table class="three" width = "100%">
			<tr>
				<th bgcolor = "#EAEAEA">����</th>
				<td><input class="titlefield" type = "text" name = "title"></td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">�������</th>
				<td>
				<input id="radio1" type="radio" name="hire" value="���ϰŸ�"><label for="radio1" style="cursor:pointer;">���ϰŸ�</label>
				<input id="radio2" type="radio" name="hire" value="�����"><label for="radio2">�����</label>
				<input id="radio3" type="radio" name="hire" value="�ܱ�˹�"><label for="radio3">�ܱ�˹�</label>
				<input id="radio4" type="radio" name="hire" value="���˹�"><label for="radio4">���˹�</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">����</th>
				<td>
				<input id="man" type="radio" name="sex" value="����"><label for="sex1">����</label>
				<input id="woman" type="radio" name="sex" value="����"><label for="sex2">����</label>
				<input id="nosex" type="radio" name="sex" value="��������"><label for="sex3">��������</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">�䱸 ����</th>
				<td><select name = "age">
				<option value = "20" selected = "lim">20</option>
				<option value = "25">25</option>
				<option value = "30">30</option>
				<option value = "35">35</option>
				<option value = "40">40</option>
				<option value = "45">45</option>
				<option value = "50">50</option>
				</select>&nbsp;&nbsp;�� ����&nbsp;&nbsp;
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">�䱸 �з�</th>
				<td>
				<input type="checkbox" id="collage1" class="css-checkbox" name="collage" value="����б�����">
				<label for="collage1" class="css-label lite-green-check">����б� ����&nbsp;&nbsp;</label>
				<input type="checkbox" id="collage2" class="css-checkbox" name="collage" value="����������">
				<label for="collage2" class="css-label lite-green-check">������ ����&nbsp;&nbsp;</label>
				<input type="checkbox" id="collage3" class="css-checkbox" name="collage" value="����������">
				<label for="collage3" class="css-label lite-green-check">�Ϲ� ���б� ����&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">����</th>
				<td>
				<input type="checkbox" id="day1" class="css-checkbox" name="week" value="������">
				<label for="day1" class="css-label lite-green-check">������&nbsp;&nbsp;</label>
				<input type="checkbox" id="day2" class="css-checkbox" name="week" value="ȭ����">
				<label for="day2" class="css-label lite-green-check">ȭ����&nbsp;&nbsp;</label>
				<input type="checkbox" id="day3" class="css-checkbox" name="week" value="������">
				<label for="day3" class="css-label lite-green-check">������&nbsp;&nbsp;</label>
				<input type="checkbox" id="day4" class="css-checkbox" name="week" value="�����">
				<label for="day4" class="css-label lite-green-check">�����&nbsp;&nbsp;</label>
				<input type="checkbox" id="day5" class="css-checkbox" name="week" value="�ݿ���">
				<label for="day5" class="css-label lite-green-check">�ݿ���&nbsp;&nbsp;</label>
				<input type="checkbox" id="day6" class="css-checkbox" name="week" value="�����">
				<label for="day6" class="css-label lite-green-check">�����&nbsp;&nbsp;</label>
				<input type="checkbox" id="day7" class="css-checkbox" name="week" value="�Ͽ���">
				<label for="day7" class="css-label lite-green-check">�Ͽ���&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">�ð�</th>
				<td><select name = "time1">
				<option value = "00">00</option><option value = "01">01</option>
				<option value = "02">02</option><option value = "03">03</option>
				<option value = "04">04</option><option value = "05">05</option>
				<option value = "06">06</option><option value = "07">07</option>
				<option value = "08">08</option><option value = "09" selected = "start">09</option>
				<option value = "10">10</option><option value = "11">11</option>
				<option value = "12">12</option><option value = "13">13</option>
				<option value = "14">14</option><option value = "15">15</option>
				<option value = "16">16</option><option value = "17">17</option>
				<option value = "18">18</option><option value = "19">19</option>
				<option value = "20">20</option><option value = "21">21</option>
				<option value = "22">22</option><option value = "23">23</option>
				</select>&nbsp;&nbsp;�� ����&nbsp;&nbsp;
				<select name = "time2">
				<option value = "00">00</option><option value = "01">01</option>
				<option value = "02">02</option><option value = "03">03</option>
				<option value = "04">04</option><option value = "05">05</option>
				<option value = "06">06</option><option value = "07">07</option>
				<option value = "08">08</option><option value = "09">09</option>
				<option value = "10">10</option><option value = "11">11</option>
				<option value = "12">12</option><option value = "13">13</option>
				<option value = "14">14</option><option value = "15">15</option>
				<option value = "16">16</option><option value = "17">17</option>
				<option value = "18" selected = "end">18</option><option value = "19">19</option>
				<option value = "20">20</option><option value = "21">21</option>
				<option value = "22">22</option><option value = "23">23</option>
				</select>&nbsp;&nbsp;�� ����</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">�䱸 Ư�����</th>
				<td>
				<a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)"> Ư������� �����ϼ��� (���߼��� ����)
				</a><div style="DISPLAY: none">
				<br><input type="checkbox" id="usual1" class="css-checkbox" name="special" value="�����ۼ��ɼ�">
				<label for="usual1" class="css-label lite-green-check">�����ۼ� �ɼ�&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual2" class="css-checkbox" name="special" value="�����ɼ�">
				<label for="usual2" class="css-label lite-green-check">���� �ɼ�&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual3" class="css-checkbox" name="special" value="ü�¿��">
				<label for="usual3" class="css-label lite-green-check">ü�� ���&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual4" class="css-checkbox" name="special" value="���Ⱑ����">
				<label for="usual4" class="css-label lite-green-check">���Ⱑ ����&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual5" class="css-checkbox" name="special" value="��ǻ������/��ġ�ɼ�">
				<label for="usual5" class="css-label lite-green-check">��ǻ�� ����/��ġ �ɼ�&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual6" class="css-checkbox" name="special" value="��������">
				<label for="usual6" class="css-label lite-green-check">���� ����&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual7" class="css-checkbox" name="special" value="�米������">
				<label for="usual7" class="css-label lite-green-check">�米�� ����&nbsp;&nbsp;</label>
				<br><input type="checkbox" id="usual8" class="css-checkbox" name="special" value="���ֺ�������">
				<label for="usual8" class="css-label lite-green-check">���ֺ��� ����&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual9" class="css-checkbox" name="special" value="�丮�Ƿ¿��">
				<label for="usual9" class="css-label lite-green-check">�丮�Ƿ� ���&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual10" class="css-checkbox" name="special" value="�����Կ��ɼ�">
				<label for="usual10" class="css-label lite-green-check">�����Կ� �ɼ�&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual11" class="css-checkbox" name="special" value="�ð����ö��">
				<label for="usual11" class="css-label lite-green-check">�ð���� ö��&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual12" class="css-checkbox" name="special" value="�۾���(�����)�ɼ�">
				<label for="usual12" class="css-label lite-green-check">�۾���(�����) �ɼ�&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual13" class="css-checkbox" name="special" value="����������û������">
				<label for="usual13" class="css-label lite-green-check">�������� �� û�� ����&nbsp;&nbsp;</label>
				<br><input type="checkbox" id="usual14" class="css-checkbox" name="special" value="�Ĳ��Ѽ���">
				<label for="usual14" class="css-label lite-green-check">�Ĳ��� ����&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual15" class="css-checkbox" name="special" value="�������">
				<label for="usual15" class="css-label lite-green-check">��� ����&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual16" class="css-checkbox" name="special" value="���ǰ��ٸ�">
				<label for="usual16" class="css-label lite-green-check">���ǰ� �ٸ�&nbsp;&nbsp;</label>
				</div>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">�䱸 �ܱ��� �ɷ�</th>
				<td>
				<input type="checkbox" id="lang1" class="css-checkbox" name="language" value = "�����">
				<label for="lang1" class="css-label lite-green-check">���� ��&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang2" class="css-checkbox" name="language" value = "������">
				<label for="lang2" class="css-label lite-green-check">���� ��&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang3" class="css-checkbox" name="language" value = "������">
				<label for="lang3" class="css-label lite-green-check">���� ��&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang4" class="css-checkbox" name="language" value = "�Ϻ����">
				<label for="lang4" class="css-label lite-green-check">�Ϻ��� ��&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang5" class="css-checkbox" name="language" value = "�Ϻ�����">
				<label for="lang5" class="css-label lite-green-check">�Ϻ��� ��&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang6" class="css-checkbox" name="language" value = "�Ϻ�����">
				<label for="lang6" class="css-label lite-green-check">�Ϻ��� ��&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang7" class="css-checkbox" name="language" value = "�߱����">
				<label for="lang7" class="css-label lite-green-check">�߱��� ��&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang8" class="css-checkbox" name="language" value = "�߱�����">
				<label for="lang8" class="css-label lite-green-check">�߱��� ��&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang9" class="css-checkbox" name="language" value = "�߱�����">
				<label for="lang9" class="css-label lite-green-check">�߱��� ��&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">�ñ�</th>
				<td><input class="shortfield" type = "text" name = "money"> ��</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">������ ����</th>
				<td><select name = "renew">
				<option value = "1">1</option><option value = "2">2</option>
				<option value = "3">3</option><option value = "4">4</option>
				<option value = "5">5</option><option value = "6">6</option>
				<option value = "7">7</option><option value = "8">8</option>
				<option value = "9">9</option><option value = "10">10</option>
				</select>&nbsp;&nbsp;��</td>
			</tr>
		</table>

		<div id = "blank">
		
		<table width = "100%" style = "border-width : 0px;">
			<tr style = "border-width : 0px;">
			<td align = 'center' style = "border-width : 0px;">
			<%
			if (sessionOk==null) { %>
		    <script>
 		       alert ("�α��� �� ��� ����");
  		      window.location = 'index.jsp';
 		   </script>
			<%} else {%>
			<input class="regbutton" name="ok" type="button" onclick="javascript:writeCheck();" value="���" />&nbsp;&nbsp;&nbsp;&nbsp;
			<% } %>
			<input class="regbutton" name="cancel" type="button" onclick = "location.href='index.jsp'" value="���" />
			</td>
			</tr>
		</table>
		</form>
	
	</div>
	<div id = "blank"></div>
</body>
</html>