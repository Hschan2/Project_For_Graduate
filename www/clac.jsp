<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="euc-kr"%>
<!doctype html>
<%
   // ������ �����Ѵ�.
   int result = 0;
	int result2 = 0;
	 int result3 = (int) (result - (result * 0.033));

     int result4 = (int) (result - (result * 0.033));
   // POST �� ���޵� ��츸 ����
   if (request.getMethod().equals("POST")) {

      // �����ڸ� ������ �´�.
      String op = request.getParameter("operator");

      // ���ڿ� ���·� ���޵� ���ڸ� int�� ��ȯ�Ѵ�.
      int num1 = Integer.parseInt(request.getParameter("num1"));
      int num2 = Integer.parseInt(request.getParameter("num2"));
     
      int num8 = Integer.parseInt(request.getParameter("num8"));

      // �� �����ں��� ó���Ѵ�.
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
          <h1>�ñ� ���� </h1>

<form name=form1 method=post>
<div class="field-wrap">
 <input type="text" name="num1" placeholder="�ñ��� �Է��ϼ���" />
            </div>
<input type="hidden" name="operator" value="*"> 
<div class="field-wrap">
 <input type="text" name="num2" placeholder="�ٹ��ð��� �Է��ϼ���" />
            </div>
            <input type="hidden" name="operator" value="*"> 
 <div class="field-wrap">
 <input type="text" name="num8" placeholder="�ٹ��ϼ��� �Է��ϼ���" />
            </div>
            <input type="hidden" name="operator" value="*"> 

                        
            
<button input type="submit" class="button button-block"/ name="B1">���</button><br>
<button input type="reset" class="button button-block"/ name="B2">�ٽ��Է�</button>
</from>
<div class="field-wrap">
<input type="text" name="num3" placeholder="�ϱ�: <%=result %>"/><br>
</div>
<div class="field-wrap">
<input type="text" name="num5" placeholder="���� �ϱ�: <%=result3 %>"/><br>
</div>
<div class="field-wrap">
<input type="text" name="num4" placeholder="�� �ӱ� : <%=result2 %>"/><br>
</div>
<div class="field-wrap">
<input type="text" name="num6" placeholder="���� �� �ӱ� : <%=result4 %>"/><br>
</div>



</BODY>
</HTML>