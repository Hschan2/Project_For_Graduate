<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="my.member.MemberDao" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="vo" class="my.member.MemberVo"/>
<jsp:setProperty property="*" name="vo"/>
<%
 int rst = 0;
 MemberDao dao = new MemberDao();
 rst = dao.updateMember(vo);
%>
<%if(rst>0){%>
<script type="text/javascript">
alert("���� ���� �Ϸ�");
location.href="info.jsp";
</script>
<%}else{%>
<script type="text/javascript">
alert("���� ���� ����");
history.go(-1);
</script>
<%}%>