<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    <%@ page import="java.sql.*" %>
<script language = "javascript">  // 자바 스크립트 시작

function assessCheck(frm)
{
 var form = document.assessform;
 
 if( !form.memo.value ) 
 {
  alert( "평가를 적어주세요" );
  form.memo.focus();  
  return;
 }

form.submit();
}

</script>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
.select_style {
    background: #FFF;
    overflow: hidden;
    display: inline-block;
    color: #525252;
    font-weight: 300;
    -webkit-border-radius: 5px 4px 4px 5px/5px 5px 4px 4px;
    -moz-border-radius: 5px 4px 4px 5px/5px 5px 4px 4px;
    border-radius: 5px 4px 4px 5px/5px 5px 4px 4px;
    -webkit-box-shadow: 0 0 5px rgba(123, 123, 123, 0.2);
    -moz-box-shadow: 0 0 5px rgba(123,123,123,.2);
    box-shadow: 0 0 5px rgba(123, 123, 123, 0.2);
    border: solid 1px #DADADA;
    font-family: "helvetica neue",arial;
    position: relative;
    cursor: pointer;
    padding-right:20px;
}
.select_style span {
    position: absolute;
    right: 10px;
    width: 8px;
    height: 8px;
    background: url(http://projects.authenticstyle.co.uk/niceselect/arrow.png) no-repeat;
    top: 50%;
    margin-top: -4px;
}
.select_style select {
    -webkit-appearance: none;
    appearance:none;
    width:120%;
    background:none;
    background:transparent;
    border:none;
    outline:none;
    cursor:pointer;
    padding:7px 10px;
}

input.freebutton { width: 50px; height: 30px; background: #8C8C8C; border: 0; padding: 6px; color: #FFFFFF; font-weight: bold; font-size: 1em; cursor:pointer; }
input.titlefield { width: 300px; padding: 4px; spacing : 2px; border: 2px solid #ccc; font-size: .9em; }
</style>
<title>assess</title>
</head>
<body>
<%	
	response.setCharacterEncoding("EUC-KR");

	String name = request.getParameter("bname");
%>

<table style="margin-left: auto; margin-right: auto;">
<form name="assessform" method="post" action="assess_ok.jsp">
<tr>
<th><input type="text" name="bname" value = "<%= name %>" style="border:0px; background:#FFFFFF; font-size:25; text-align:center; font-weight:bold;" readonly></th>
</tr>
<tr>
<th>
<br><div class='select_style'><select name="grade">
<option value="1" selected = "start">★☆☆☆☆</option>
<option value="2">★★☆☆☆</option>
<option value="3">★★★☆☆</option>
<option value="4">★★★★☆</option>
<option value="5">★★★★★</option>
</select></div></th>
</tr><br>
<tr>
<th><br><textarea name="memo" cols="50" rows="13" style="resize:none;"></textarea></th>
</tr>
<tr>
<th><br><input class="freebutton" type="button" value="등록" OnClick="javascript:assessCheck();" /></th>
</tr>
</table>
</form>
</body>
</html><%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    <%@ page import="java.sql.*" %>
<script language = "javascript">  // 자바 스크립트 시작

function assessCheck(frm)
{
 var form = document.assessform;
 
 if( !form.memo.value ) 
 {
  alert( "평가를 적어주세요" );
  form.memo.focus();  
  return;
 }

form.submit();
}

</script>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
.select_style {
    background: #FFF;
    overflow: hidden;
    display: inline-block;
    color: #525252;
    font-weight: 300;
    -webkit-border-radius: 5px 4px 4px 5px/5px 5px 4px 4px;
    -moz-border-radius: 5px 4px 4px 5px/5px 5px 4px 4px;
    border-radius: 5px 4px 4px 5px/5px 5px 4px 4px;
    -webkit-box-shadow: 0 0 5px rgba(123, 123, 123, 0.2);
    -moz-box-shadow: 0 0 5px rgba(123,123,123,.2);
    box-shadow: 0 0 5px rgba(123, 123, 123, 0.2);
    border: solid 1px #DADADA;
    font-family: "helvetica neue",arial;
    position: relative;
    cursor: pointer;
    padding-right:20px;
}
.select_style span {
    position: absolute;
    right: 10px;
    width: 8px;
    height: 8px;
    background: url(http://projects.authenticstyle.co.uk/niceselect/arrow.png) no-repeat;
    top: 50%;
    margin-top: -4px;
}
.select_style select {
    -webkit-appearance: none;
    appearance:none;
    width:120%;
    background:none;
    background:transparent;
    border:none;
    outline:none;
    cursor:pointer;
    padding:7px 10px;
}

input.freebutton { width: 50px; height: 30px; background: #8C8C8C; border: 0; padding: 6px; color: #FFFFFF; font-weight: bold; font-size: 1em; cursor:pointer; }
input.titlefield { width: 300px; padding: 4px; spacing : 2px; border: 2px solid #ccc; font-size: .9em; }
</style>
<title>assess</title>
</head>
<body>
<%	
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("bname");
%>

<table style="margin-left: auto; margin-right: auto;">
<form name="assessform" method="post" action="assess_ok.jsp">
<tr>
<th><input type="text" name="bname" value = "<%= name %>" style="border:0px; background:#FFFFFF; font-size:25; text-align:center; font-weight:bold;" readonly></th>
</tr>
<tr>
<th>
<br><div class='select_style'><select name="grade">
<option value="1" selected = "start">★☆☆☆☆</option>
<option value="2">★★☆☆☆</option>
<option value="3">★★★☆☆</option>
<option value="4">★★★★☆</option>
<option value="5">★★★★★</option>
</select></div></th>
</tr><br>
<tr>
<th><br><textarea name="memo" cols="50" rows="13" style="resize:none;"></textarea></th>
</tr>
<tr>
<th><br><input class="freebutton" type="button" value="등록" OnClick="javascript:assessCheck();" /></th>
</tr>
</table>
</form>
</body>
</html>