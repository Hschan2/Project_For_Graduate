<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="euc-kr"%>
<!doctype html>
<html>
<head>
<link href="styyy.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ â</title>
<script type="text/javascript">	
var right = 0;
function happybirth(){
	var birth_date = document.form.birth_date.value;

	var birth_year = birth_date.substring(0,4);
	
	birth_year = parseInt(birth_year);
	

	var now = new Date(); 

	var year = now.getFullYear(); 

	var age = year - birth_year; 

	document.form.age.value = age; 
	}
function regChk(){
var user_id = document.form.user_id.value;
var regx = /^[a-zA-Z0-9]*$/;
if(user_id.length==0 || user_id==null){
alert("���̵� �Է��Ͻʽÿ�");
return false;
}
if (!regx.test(user_id)){
alert("���̵�� ����, ���ڸ� �Է°����մϴ�.");
document.form.user_id.focus();
return false;
}

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


var name = document.form.name.value;
if(name.length==0 || name==null){
alert("�̸��� �Է��Ͻʽÿ�");
return false;
}

var email = document.form.email.value;
if(email.length==0 || email==null){
alert("�̸����� �Է��Ͻʽÿ�");
return false;
}


var phone_number = document.form.phone_number.value;
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


form.action = "regFormProc.jsp";
form.target = "_self";
form.submit();
}

function passchk(){
var user_pw = document.form.user_pw.value;
var user_pw2 = document.form.user_pw2.value;
if (user_pw2.length == 0 || user_pw2 == null) {
document.form.chk.value = "";
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

function idcheck(){
	 var user_id = document.form.user_id.value;
	 if(user_id.length<1 || user_id==null){
	  alert("�ߺ�üũ�� ���̵� �Է��Ͻʽÿ�");
	  return false;
	 }
	 var url = "idCheck.jsp?user_id=" + user_id;
	 window.open(url, "get", "height = 180, width = 300");
	}
	

</script>
</head>
<body>
  <div class="form">
    
<form action="regFormProc.jsp" name="form" method="post">

  
<div class="tab-content">
        <div id="signup">   
          <h1>ȸ������ </h1>
   <form action="/" method="post">
  
    
  <div class="field-wrap">
              <input type="text"id="user_id" name="user_id" placeholder="���̵�(����,���ڸ� ����)" />
            </div>
  
       <button type="button"class="button2 button-block2"/  onclick="idcheck()"> �ߺ�üũ </button> 
         <div class="field-wrap">
              <input type="password"id="user_pw" name="user_pw" placeholder="��й�ȣ(6�� �̻�)" />
            </div>
      <div class="field-wrap">
              <input type="password"id="user_pw2" name="user_pw2"onblur="passchk()" placeholder="�ѹ� �� �Է��ϼ���" />
            </div>
  <div class="field-wrap">
              <input type="text" name="chk" readonly="readonly" />
            </div>
 <div class="field-wrap">
              <input type="text"name="name" placeholder="�̸�" />
            </div>
  
       <div class="field-wrap">
              <input type="text" name="email" placeholder="�̸���" />
            </div>
        <div class="field-wrap">
              <input type="text" name="phone_number" placeholder="�ڵ���(���ڸ��Է�)" />
            </div>
   <div>
      <div style="float:left;width: 50%;">
     <input name="gender" value="0" style="width: inherit;vertical-align: middle;" type="radio"> <font color="#ffffff">����</font> &nbsp;&nbsp;
       </div>
<div style="float:left;width: 50%;">
     <input name="gender" value="1" style="width: inherit;" type="radio"> <font color="ffffff">����</font>
       </div>
       <p style="margin:0;clear:both;"></p>
  </div>

    <div class="field-wrap">
              <input type="text" name="birth_date" onblur="happybirth()" placeholder="�������(xxxx-xx-xx����)" />
            </div>
     <div class="field-wrap">
              <input type="text" name="address1" placeholder="�ּ�" />
            </div>
          <div class="field-wrap">
              <input type="text" name="address2" placeholder="���ּ�" />
            </div>
    
    <input type="hidden" name="brith_year">
	<input type="hidden" name="age">

    
     
  <button input type="submit" class="button button-block"/ onclick="regChk()">���Խ�û</button>
  
</form>
  </div>

    
</body>
</html>
