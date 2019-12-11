<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("euc-kr"); %>
    <jsp:useBean id="dao" class="my.member.MemberDao"/>
    <jsp:useBean id="vo" class="my.member.MemberVo"/>
    <jsp:setProperty property="*" name="vo"/>
<%
  String user_pw = null;
 user_pw = dao.findid2(vo);
%>
<%if(user_pw==null){ %>
<script type="text/javascript">
alert("정보가 일치하지 않아요!");
history.go(-1);
</script>
<%}else{%>
<script type="text/javascript">
alert("당신의 비번은 <%=user_pw%>입니다.");
window.close();
</script>
<%}%>