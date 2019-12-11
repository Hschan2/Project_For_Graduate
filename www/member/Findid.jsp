<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기</title>
<script type="text/javascript">
function findid(){
document.form1.submit();
}
</script>

</head>
<body>
  <form action="FindidProc.jsp" method="post" name="form1" >

<legend>아이디 찾기</legend>
 <ol>
   <li>
     <label for="name">이름</label>
    <input type="text"  name="name"> </li>
  
  
   <li> <label for="phone_number">핸드폰(숫자만 입력)</label>
        <input type="text" name="phone_number"></label></li>
 
  <button input type="submit" onclick="findidProc()">찾기</button>
  </ol>
  </form>
</body>
</html>