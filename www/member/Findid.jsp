<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵� ã��</title>
<script type="text/javascript">
function findid(){
document.form1.submit();
}
</script>

</head>
<body>
  <form action="FindidProc.jsp" method="post" name="form1" >

<legend>���̵� ã��</legend>
 <ol>
   <li>
     <label for="name">�̸�</label>
    <input type="text"  name="name"> </li>
  
  
   <li> <label for="phone_number">�ڵ���(���ڸ� �Է�)</label>
        <input type="text" name="phone_number"></label></li>
 
  <button input type="submit" onclick="findidProc()">ã��</button>
  </ol>
  </form>
</body>
</html>