<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="euc-kr"%>
<!doctype html>
<html>
<head>
<link href="styyy.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 창</title>
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
alert("아이디를 입력하십시오");
return false;
}
if (!regx.test(user_id)){
alert("아이디는 영어, 숫자만 입력가능합니다.");
document.form.user_id.focus();
return false;
}

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


var name = document.form.name.value;
if(name.length==0 || name==null){
alert("이름을 입력하십시오");
return false;
}

var email = document.form.email.value;
if(email.length==0 || email==null){
alert("이메일을 입력하십시오");
return false;
}


var phone_number = document.form.phone_number.value;
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
document.form.chk.value = "비밀번호가 다릅니다.";
right = 0;
} else { 
document.form.chk.value = "비밀번호가 동일합니다.";
right = 1;
}
return;
}

function idcheck(){
	 var user_id = document.form.user_id.value;
	 if(user_id.length<1 || user_id==null){
	  alert("중복체크할 아이디를 입력하십시오");
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
          <h1>회원가입 </h1>
   <form action="/" method="post">
  
    
  <div class="field-wrap">
              <input type="text"id="user_id" name="user_id" placeholder="아이디(영어,숫자만 가능)" />
            </div>
  
       <button type="button"class="button2 button-block2"/  onclick="idcheck()"> 중복체크 </button> 
         <div class="field-wrap">
              <input type="password"id="user_pw" name="user_pw" placeholder="비밀번호(6자 이상)" />
            </div>
      <div class="field-wrap">
              <input type="password"id="user_pw2" name="user_pw2"onblur="passchk()" placeholder="한번 더 입력하세요" />
            </div>
  <div class="field-wrap">
              <input type="text" name="chk" readonly="readonly" />
            </div>
 <div class="field-wrap">
              <input type="text"name="name" placeholder="이름" />
            </div>
  
       <div class="field-wrap">
              <input type="text" name="email" placeholder="이메일" />
            </div>
        <div class="field-wrap">
              <input type="text" name="phone_number" placeholder="핸드폰(숫자만입력)" />
            </div>
   <div>
      <div style="float:left;width: 50%;">
     <input name="gender" value="0" style="width: inherit;vertical-align: middle;" type="radio"> <font color="#ffffff">남자</font> &nbsp;&nbsp;
       </div>
<div style="float:left;width: 50%;">
     <input name="gender" value="1" style="width: inherit;" type="radio"> <font color="ffffff">여자</font>
       </div>
       <p style="margin:0;clear:both;"></p>
  </div>

    <div class="field-wrap">
              <input type="text" name="birth_date" onblur="happybirth()" placeholder="생년월일(xxxx-xx-xx형식)" />
            </div>
     <div class="field-wrap">
              <input type="text" name="address1" placeholder="주소" />
            </div>
          <div class="field-wrap">
              <input type="text" name="address2" placeholder="상세주소" />
            </div>
    
    <input type="hidden" name="brith_year">
	<input type="hidden" name="age">

    
     
  <button input type="submit" class="button button-block"/ onclick="regChk()">가입신청</button>
  
</form>
  </div>

    
</body>
</html>
