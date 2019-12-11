<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기</title>
<script type="text/javascript">
function findid(){
document.form2.submit();
}
</script>

</head>
<body>
  <form action="FindidProc2.jsp" method="post" name="form2" >

<legend>비밀번호 찾기</legend>
 <ol>
   <li>
     <label for="user_id">아이디</label>
    <input type="text"  name="user_id"> </li>
  
  
   <li> <label for="phone_number">핸드폰(숫자만 입력)</label>
        <input type="text" name="phone_number"></label></li>
 
  <button input type="submit" onclick="findidProc2()">찾기</button>
  </ol>
  </form>
</body>
</html>