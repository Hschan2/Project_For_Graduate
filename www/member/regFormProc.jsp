 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="dao" class="my.member.MemberDao"/>
    <jsp:useBean id="vo" class="my.member.MemberVo"/>
    <%request.setCharacterEncoding("euc-kr"); %>
 <jsp:setProperty property="*" name="vo"/>
<%
 int rst = 0;
 request.setCharacterEncoding("euc-kr");
 rst = dao.insertMember(vo);
 if(rst>0){
%>
<script type="text/javascript">
alert("ȸ������ ����");
window.close();
</script>
<%}else{ %>
<script type="text/javascript">
alert("ȸ������ ����");
history.go(-1);
</script>
<%} %>
		