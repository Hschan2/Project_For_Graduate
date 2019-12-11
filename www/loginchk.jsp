<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회원 확인</title>
</head>
<body>

<%@page import="java.sql.*" session="true" %>
<%
   request.setCharacterEncoding("euc-kr");

   String id = request.getParameter("id");
    String pass = request.getParameter("pass");
 
    //id = new String(id.getBytes("8859_1"), "utf-8");
   //pass = new String(pass.getBytes("8859_1"), "utf-8");

    PreparedStatement pstmt;
    Connection cn = null;
    Statement stmt = null;
    Boolean isLogin = false;
    
    Boolean NoIdPw=false;
 
 try{
   
       String jdbcUrl="jdbc:mysql://211.218.150.109/ci2016pocit";
       String dbId="ci2016pocit";
       String dbPw="2016pocit";
      Class.forName("com.mysql.jdbc.Driver");
       cn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
   
      String Sql = "select * from user where user_id=(?)";
      pstmt = cn.prepareStatement(Sql.toString());
      pstmt.setString(1,id);
      ResultSet rs = pstmt.executeQuery();
      

        if(rs.next()){
           String user_id = rs.getString("user_id");
           if(user_id.equals(id)){
              String user_pw = rs.getString("user_pw");
                 if(user_pw.equals(pass)){
                    session.setMaxInactiveInterval(3600);
                       session.setAttribute("who", "true" );
                       session.setAttribute("user_number", rs.getString("user_number") );
                       session.setAttribute("user_id", id );
                       isLogin = true;
                 
                  
                  rs.close();
                  pstmt.close();
                  cn.close();
                  
                  response.sendRedirect("index.jsp");
                  
                 }else if(!rs.next()){

                  rs.close();
                  pstmt.close();
                  cn.close();
                 %>
                 <jsp:forward page="NoIdPw.jsp">
                    <jsp:param name="NoIdPw" value="<%=NoIdPw %>"/>
                 </jsp:forward>>
                 <%
           }
         }else if(!rs.next()){

           rs.close();
           pstmt.close();
           cn.close();
           %>
         <jsp:forward page="NoIdPw.jsp">
            <jsp:param name="NoIdPw" value="<%=NoIdPw %>"/>
         </jsp:forward>>
         <%
      }
   
  }else if(!rs.next()){

      rs.close();
      pstmt.close();
      cn.close();
      %>
      <jsp:forward page="NoIdPw.jsp">
         <jsp:param name="NoIdPw" value="<%=NoIdPw %>"/>
      </jsp:forward>>
      <%
   }
   
   rs.close();
  
 }catch(ClassNotFoundException e){
   out.println("해당 클래스를 찾을 수 없습니다." + e.getMessage());
  }finally{
     if(stmt!=null){
        stmt.close();
     }
     if(cn!=null){
        cn.close();
     }
  }
%>

</body>
</html>