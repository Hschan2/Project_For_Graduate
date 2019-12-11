<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("euc-kr"); %>
    <jsp:useBean id="dao" class="my.member.MemberDao"/>
    <jsp:useBean id="vo" class="my.member.MemberVo"/>
    <jsp:setProperty property="*" name="vo"/>
<%
  String user_id = null;
 user_id = dao.findid(vo);
%>
<%if(user_id==null){ %>
<script type="text/javascript">
alert("아이디가 없습니다!");
history.go(-1);
</script>
<%}else{%>
<script type="text/javascript">
alert("찾으시는 계정은 <%=user_id%>입니다.");
window.close();
</script>
<%}%>