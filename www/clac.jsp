<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="euc-kr"%>
<!doctype html>
<%
   // 변수를 설정한다.
   int result = 0;
	int result2 = 0;
	 int result3 = (int) (result - (result * 0.033));

     int result4 = (int) (result - (result * 0.033));
   // POST 로 젼달된 경우만 수행
   if (request.getMethod().equals("POST")) {

      // 연산자를 가지고 온다.
      String op = request.getParameter("operator");

      // 문자열 형태로 전달된 인자를 int로 변환한다.
      int num1 = Integer.parseInt(request.getParameter("num1"));
      int num2 = Integer.parseInt(request.getParameter("num2"));
     
      int num8 = Integer.parseInt(request.getParameter("num8"));

      // 각 연산자별로 처리한다.
      if (op.equals("*")) {
         result = num1 * num2;
         result2 = num1 * num2 * num8;
         result3 = (int) (result - (result * 0.033));
         result4 = (int) (result2 - (result * 0.033));
      }
      
   }

%>

<HTML>
<HEAD>
<link href="styyy.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</HEAD>

<BODY>
  <div class="form">
<div class="tab-content">
        <div id="signup">   
          <h1>시급 계산기 </h1>

<form name=form1 method=post>
<div class="field-wrap">
 <input type="text" name="num1" placeholder="시급을 입력하세요" />
            </div>
<input type="hidden" name="operator" value="*"> 
<div class="field-wrap">
 <input type="text" name="num2" placeholder="근무시간을 입력하세요" />
            </div>
            <input type="hidden" name="operator" value="*"> 
 <div class="field-wrap">
 <input type="text" name="num8" placeholder="근무일수를 입력하세요" />
            </div>
            <input type="hidden" name="operator" value="*"> 

                        
            
<button input type="submit" class="button button-block"/ name="B1">계산</button><br>
<button input type="reset" class="button button-block"/ name="B2">다시입력</button>
</from>
<div class="field-wrap">
<input type="text" name="num3" placeholder="일급: <%=result %>"/><br>
</div>
<div class="field-wrap">
<input type="text" name="num5" placeholder="세후 일급: <%=result3 %>"/><br>
</div>
<div class="field-wrap">
<input type="text" name="num4" placeholder="총 임금 : <%=result2 %>"/><br>
</div>
<div class="field-wrap">
<input type="text" name="num6" placeholder="세후 총 임금 : <%=result4 %>"/><br>
</div>



</BODY>
</HTML>