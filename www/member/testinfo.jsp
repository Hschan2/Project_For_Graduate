<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="my.member.MemberDao, my.member.MemberVo" %>
    <%
    MemberDao dao = new MemberDao();
    String user_id = (String)session.getAttribute("user_id"); 
    MemberVo vo = dao.selectMember(user_id);

    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../style123.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div id="content">
		<div id="top">
			<p><a href="index.html">Home</a><a href="#">고객센터</a>
		</div>

		<div id="search">
			<a href="../index.jsp"><img src = "../images/name.jpg" height = "150"></a>
			<form id="search_engine" method="post" action="." accept-charset="euc-kr">
				<p><input class="searchfield" name="search_query" type="text" id="keywords" value="" onfocus="document.forms['search_engine'].keywords.value='검색';" onblur="if (document.forms['search_engine'].keywords.value == '') document.forms['search_engine'].keywords.value='';" />
				<input class="searchbutton" name="submit" type="submit" value="검색" /></p>
			</form>
		</div>
		
		<div id = "miniblank"></div>
		    
       <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-10">
                <ul id="nav">
                  <li><a href="hirereg.jsp">등록하기</a>
                    <ul>
                      <li><a href="hirereg.jsp">채용등록</a></li>
                      <li><a href="personalreg.jsp">개인등록</a></li>      
                    </ul>
                  </li>
					<li><a href="hirelist.jsp">채용 공고</a></li>
					<li><a href="reglist.jsp">개인 공고</a></li>
                   <li><a href="#">게시판</a>
                        <ul>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">건의사항</a></li> 
							<li><a href="board.jsp">자유게시판</a></li>
                        </ul> 
                   </li>             
                </ul>  
          </div>
          <style>
  
body * {
  box-sizing: border-box;
}

.header {
  background-color: #289BFF;
  color: white;
  font-size: 2.5em;
  font: "맑은 고딕";
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}


.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 800px;

}

table {
  width: 100%;
  
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
  font-size: 2em;
}
table td:last-child {
  
  font-size: 2em;
  line-height: 1.4;
  text-align: left;
}
table th {
  background-color: #B4FFFF;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #B4FFFF;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: 'Name:';
    
  }
  td:nth-child(3):before {
    content: 'Email:';
  }
  td:nth-child(4):before {
    content: 'Phone:';
  }
  td:nth-child(5):before {
    content: 'Comments:';
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
  
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
    
  }
  td:last-child {
    padding-bottom: 1rem !important;
    
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}
</style>
  <div class="table-users">
   <div class="header">매칭상대 정보</div>

   <table>
      <tr>
        <th width="80"><font size ="5"></font></th>
        <th width="200"><font size="4">항목</font></th>
        <th width="320"><font size="4"> 내용</font></th>
      </tr>

 <tr><td><img src="../images/human.png" alt="" /></td>
         <td>ID</td>
         <td>dongyang514</td></tr>
 <tr><td><img src="../images/human.png" alt="" /></td>
         <td>이름</td>
         <td>서영빈</td></tr>
 <tr><td><img src="../images/human.png" alt="" /></td>
         <td>이메일</td>
         <td>youngbin@naver.com</td></tr>
 <tr><td><img src="../images/human.png" alt="" /></td>
         <td>생년월일</td>
         <td>1995-04-08</td></tr>
 <tr><td><img src="../images/human.png" alt="" /></td>
         <td>핸드폰번호</td>
         <td>010-2784-3252</td></tr>
 <tr><td><img src="../images/human.png" alt="" /></td>
         <td>나이</td>
         <td>22살</td></tr>
 <tr><td><img src="../images/human.png" alt="" /></td>
         <td>주소</td>
         <td>서울특별시 강남구 삼성동 삼성 아이파크</td></tr>

  <tr>
   <td></td>
   <td>
   
				 </td>
				<td></td> 
   
  </tr>
 </table>

</body>
</html>
	