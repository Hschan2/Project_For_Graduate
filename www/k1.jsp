
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="description" content="Small Corporation" />
<meta name="keywords" content="small, corporation" />
    <link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="checkstyle.css" type="text/css" />
    <link rel="stylesheet" href="style2.css" type="text/css" />
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>
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
<div id="content">
		<div id="top">
			<p><a href="index.html">Home</a><a href="service.jsp">������</a>
		</div>

		<div id="search">
			<a href="index.html"><img src = "images/name.jpg" height = "150"></a>
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
                   <li><a href="board.jsp">�Խ���</a>
                        <ul>
                            <li><a href="#">��������</a></li>
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
    <div id = "left">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="600" height="130" >
		<param name="movie" value="images/leftbanner.swf">
		<param name="quality" value="high">
		<embed src="images/leftbanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"		type="application/x-shockwave-flash" width="600" height="130"></embed>
		</object>
		</div>
<div class="table-users">
   <div class="header">Users</div>

   <table>
      <tr>
         <th width="100">Picture</th>
         <th width="250">Name</th>
          <th width="250">Comments</th>
      </tr>

      <tr>
         <td><img src="http://lorempixel.com/100/100/people/1" alt="" /></td>
         <td>Jane Doe</td>
         <td>jane.doe@foo.com</td>

      </tr>

      <tr>
         <td><img src="http://lorempixel.com/100/100/sports/2" alt="" /></td>
         <td>John Doe</td>
         <td>john.doe@foo.com</td>

    
      </tr>

      <tr>
         <td><img src="http://lorempixel.com/100/100/people/9" alt="" /></td>
         <td>Jane Smith</td>
         <td>jane.smith@foo.com</td>
      
      
      </tr>

      <tr>
         <td><img src="http://lorempixel.com/100/100/people/3" alt="" /></td>
         <td>John Smith</td>
         <td>john.smith@foo.com</td>
  

      </tr>
   </table>
</div>


</body>
</html>
