<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
     
<script>

function loginchk(){
	
	 var regx = /^[a-zA-Z0-9]*$/;
	 var id = document.login.id.value;
	 var pass = document.login.pass.value;

	 
	 if (id.length == 0 || id == null) {
	  document.login.id.focus();
	  alert("아이디를 입력해주세요.");
	  return;
	 }
	 if (!regx.test(id)){
	  document.login.id.focus();
	  return false;
	 }
	 if (pass.length == 0 || pass == null) {
	  document.login.pass.focus();
	  alert("비밀번호를 입력해주세요.");
	  return;
	 }
	 if (!regx.test(pass)){
	  document.login.pass.focus();
	  return false;
	 }
	 
	 document.login.submit();
	 
	}
	
function popupOpen(){
		window.open('member/Findid.jsp',"아이디 찾기",'width=580,height=250');
}
function popupOpen2(){
		window.open('member/Findid2.jsp',"비밀번호 찾기",'width=580,height=250');
}
function popupOpen3(){
	window.open('member/regFormImpl2.jsp',"회원가입",'width=580,height=750');
}

function writeCheck()
{
	var form = document.hireform;
	
	if( !form.title.value )  
	{
		alert( "제목을 적어주세요" ); 
		form.title.focus();  
		return;
	}
 
	if( !form.hire.value )
	{
		alert( "고용형태를 선택해주세요" );
		form.hire.focus();
		return;
	}
 
	if( !form.sex.value )
	{
		alert( "성별을 선택해주세요" );
		form.sex.focus();
		return;
	}

	if( !form.money.value )
	{
		alert( "시급을 적어주세요" );
		form.money.focus();
		return;
	}

	form.submit();
	}
</script>
     
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="description" content="Small Corporation" />
<meta name="keywords" content="small, corporation" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="checkstyle.css" type="text/css" />
<title>알바고</title>
</head>
<body>
<%
		request.setCharacterEncoding("euc-kr");
		String id =request.getParameter("user_id");
		String sessionOk = null;
		sessionOk = (String) session.getAttribute("who");
%>
<div id="content">
		<div id="top">
			<p><a href="index.jsp">Home</a><a href="service.jsp">고객센터</a>
		</div>

		<div id="search">
			<a href="index.jsp"><img src = "images/name.jpg" height = "150"></a>
			<form id="search_engine" method="post" action="search.jsp" accept-charset="euc-kr">
				<p><select name = "list">
				<option value="hire">채용</option><option value="personal">개인</option></select>
				<input class="searchfield" name="search" type="text" placeholder="찾고 싶은 제목 입력" />
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
                   <li><a href="list.jsp">게시판</a>
                        <ul>
                            <li><a href="list.jsp">공지사항</a></li>
                            <li><a href="service.jsp">건의사항</a></li> 
							<li><a href="board.jsp">자유게시판</a></li>
                        </ul> 
                   </li>             
                </ul>  
          </div>
          <div class="col-md-1"></div>
        </div>
    
		<div id = "miniblank"></div>

		<div id="ad">
			<%
		if (sessionOk!=null){
			%>
				<font size="4" color="black"><b><%=session.getAttribute("user_id")%>님 환영합니다</b><br><br></font>
				<form action="logout.jsp">
				<input type=hidden name="id" value=id>
				 <input class="loginbutton" type="submit" name="input" value="로그아웃"/>
				</form>
				<%
				}
		else{
				%>
				<form name=login method="post" action="loginchk.jsp">
			<div>
			<input class="loginfield" type="text" name="id" size="15" placeholder="아이디"></input>
			</div>
			<div>
			<input class="loginfield" type="password" name="pass" size="15" placeholder="비밀번호" onkeypress="if(event.keyCode == 13){ loginchk(); return; }"></input>
			</div>
			<div>
			<input class="loginbutton" name="ok" type="button" value="로그인"  onclick="loginchk()">
			</input>
			
			</div>
			<div>
			<a href="javascript:popupOpen3();"><font color = "black"><u>회원가입</u></font></a>
			<a href="javascript:popupOpen();"><font color = "black"><u>아이디/</u></font></a>
			<a href="javascript:popupOpen2();"><font color = "black"><u>비밀번호 찾기</u></font></a>
			</div>
			</form>
				<%
		} %>
		</div>
		
		<div id = "left">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="600" height="130" >
		<param name="movie" value="images/leftbanner.swf">
		<param name="quality" value="high">
		<embed wmode="transparent" src="images/leftbanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"		type="application/x-shockwave-flash" width="600" height="130"></embed>
		</object>
		</div>
		
		<div id = "blank"></div><div id = "blank"></div>
		
		<form name="hireform" method="post" action="hireregok.jsp">
		<table class="three" width = "100%">
			<tr>
				<th bgcolor = "#EAEAEA">제목</th>
				<td><input class="titlefield" type = "text" name = "title"></td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">고용형태</th>
				<td>
				<input id="radio1" type="radio" name="hire" value="소일거리"><label for="radio1" style="cursor:pointer;">소일거리</label>
				<input id="radio2" type="radio" name="hire" value="계약직"><label for="radio2">계약직</label>
				<input id="radio3" type="radio" name="hire" value="단기알바"><label for="radio3">단기알바</label>
				<input id="radio4" type="radio" name="hire" value="장기알바"><label for="radio4">장기알바</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">성별</th>
				<td>
				<input id="man" type="radio" name="sex" value="남자"><label for="sex1">남자</label>
				<input id="woman" type="radio" name="sex" value="여자"><label for="sex2">여자</label>
				<input id="nosex" type="radio" name="sex" value="성별무관"><label for="sex3">성별무관</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">요구 나이</th>
				<td><select name = "age">
				<option value = "20" selected = "lim">20</option>
				<option value = "25">25</option>
				<option value = "30">30</option>
				<option value = "35">35</option>
				<option value = "40">40</option>
				<option value = "45">45</option>
				<option value = "50">50</option>
				</select>&nbsp;&nbsp;세 까지&nbsp;&nbsp;
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">요구 학력</th>
				<td>
				<input type="checkbox" id="collage1" class="css-checkbox" name="collage" value="고등학교졸업">
				<label for="collage1" class="css-label lite-green-check">고등학교 졸업&nbsp;&nbsp;</label>
				<input type="checkbox" id="collage2" class="css-checkbox" name="collage" value="전문대재학">
				<label for="collage2" class="css-label lite-green-check">전문대 졸업&nbsp;&nbsp;</label>
				<input type="checkbox" id="collage3" class="css-checkbox" name="collage" value="전문대졸업">
				<label for="collage3" class="css-label lite-green-check">일반 대학교 졸업&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">요일</th>
				<td>
				<input type="checkbox" id="day1" class="css-checkbox" name="week" value="월요일">
				<label for="day1" class="css-label lite-green-check">월요일&nbsp;&nbsp;</label>
				<input type="checkbox" id="day2" class="css-checkbox" name="week" value="화요일">
				<label for="day2" class="css-label lite-green-check">화요일&nbsp;&nbsp;</label>
				<input type="checkbox" id="day3" class="css-checkbox" name="week" value="수요일">
				<label for="day3" class="css-label lite-green-check">수요일&nbsp;&nbsp;</label>
				<input type="checkbox" id="day4" class="css-checkbox" name="week" value="목요일">
				<label for="day4" class="css-label lite-green-check">목요일&nbsp;&nbsp;</label>
				<input type="checkbox" id="day5" class="css-checkbox" name="week" value="금요일">
				<label for="day5" class="css-label lite-green-check">금요일&nbsp;&nbsp;</label>
				<input type="checkbox" id="day6" class="css-checkbox" name="week" value="토요일">
				<label for="day6" class="css-label lite-green-check">토요일&nbsp;&nbsp;</label>
				<input type="checkbox" id="day7" class="css-checkbox" name="week" value="일요일">
				<label for="day7" class="css-label lite-green-check">일요일&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">시간</th>
				<td><select name = "time1">
				<option value = "00">00</option><option value = "01">01</option>
				<option value = "02">02</option><option value = "03">03</option>
				<option value = "04">04</option><option value = "05">05</option>
				<option value = "06">06</option><option value = "07">07</option>
				<option value = "08">08</option><option value = "09" selected = "start">09</option>
				<option value = "10">10</option><option value = "11">11</option>
				<option value = "12">12</option><option value = "13">13</option>
				<option value = "14">14</option><option value = "15">15</option>
				<option value = "16">16</option><option value = "17">17</option>
				<option value = "18">18</option><option value = "19">19</option>
				<option value = "20">20</option><option value = "21">21</option>
				<option value = "22">22</option><option value = "23">23</option>
				</select>&nbsp;&nbsp;시 부터&nbsp;&nbsp;
				<select name = "time2">
				<option value = "00">00</option><option value = "01">01</option>
				<option value = "02">02</option><option value = "03">03</option>
				<option value = "04">04</option><option value = "05">05</option>
				<option value = "06">06</option><option value = "07">07</option>
				<option value = "08">08</option><option value = "09">09</option>
				<option value = "10">10</option><option value = "11">11</option>
				<option value = "12">12</option><option value = "13">13</option>
				<option value = "14">14</option><option value = "15">15</option>
				<option value = "16">16</option><option value = "17">17</option>
				<option value = "18" selected = "end">18</option><option value = "19">19</option>
				<option value = "20">20</option><option value = "21">21</option>
				<option value = "22">22</option><option value = "23">23</option>
				</select>&nbsp;&nbsp;시 까지</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">요구 특기사항</th>
				<td>
				<a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)"> 특기사항을 선택하세요 (다중선택 가능)
				</a><div style="DISPLAY: none">
				<br><input type="checkbox" id="usual1" class="css-checkbox" name="special" value="문서작성능숙">
				<label for="usual1" class="css-label lite-green-check">문서작성 능숙&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual2" class="css-checkbox" name="special" value="운전능숙">
				<label for="usual2" class="css-label lite-green-check">운전 능숙&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual3" class="css-checkbox" name="special" value="체력우수">
				<label for="usual3" class="css-label lite-green-check">체력 우수&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual4" class="css-checkbox" name="special" value="끈기가있음">
				<label for="usual4" class="css-label lite-green-check">끈기가 있음&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual5" class="css-checkbox" name="special" value="컴퓨터조립/설치능숙">
				<label for="usual5" class="css-label lite-green-check">컴퓨터 조립/설치 능숙&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual6" class="css-checkbox" name="special" value="기억력좋음">
				<label for="usual6" class="css-label lite-green-check">기억력 좋음&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual7" class="css-checkbox" name="special" value="사교성좋음">
				<label for="usual7" class="css-label lite-green-check">사교성 좋음&nbsp;&nbsp;</label>
				<br><input type="checkbox" id="usual8" class="css-checkbox" name="special" value="말주변이좋음">
				<label for="usual8" class="css-label lite-green-check">말주변이 좋음&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual9" class="css-checkbox" name="special" value="요리실력우수">
				<label for="usual9" class="css-label lite-green-check">요리실력 우수&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual10" class="css-checkbox" name="special" value="사진촬영능숙">
				<label for="usual10" class="css-label lite-green-check">사진촬영 능숙&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual11" class="css-checkbox" name="special" value="시간약속철저">
				<label for="usual11" class="css-label lite-green-check">시간약속 철저&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual12" class="css-checkbox" name="special" value="글쓰기(문장력)능숙">
				<label for="usual12" class="css-label lite-green-check">글쓰기(문장력) 능숙&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual13" class="css-checkbox" name="special" value="정리정돈및청소잘함">
				<label for="usual13" class="css-label lite-green-check">정리정돈 및 청소 잘함&nbsp;&nbsp;</label>
				<br><input type="checkbox" id="usual14" class="css-checkbox" name="special" value="꼼꼼한성격">
				<label for="usual14" class="css-label lite-green-check">꼼꼼한 성격&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual15" class="css-checkbox" name="special" value="계산잘함">
				<label for="usual15" class="css-label lite-green-check">계산 잘함&nbsp;&nbsp;</label>
				<input type="checkbox" id="usual16" class="css-checkbox" name="special" value="예의가바름">
				<label for="usual16" class="css-label lite-green-check">예의가 바름&nbsp;&nbsp;</label>
				</div>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">요구 외국어 능력</th>
				<td>
				<input type="checkbox" id="lang1" class="css-checkbox" name="language" value = "영어상">
				<label for="lang1" class="css-label lite-green-check">영어 상&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang2" class="css-checkbox" name="language" value = "영어중">
				<label for="lang2" class="css-label lite-green-check">영어 중&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang3" class="css-checkbox" name="language" value = "영어하">
				<label for="lang3" class="css-label lite-green-check">영어 하&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang4" class="css-checkbox" name="language" value = "일본어상">
				<label for="lang4" class="css-label lite-green-check">일본어 상&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang5" class="css-checkbox" name="language" value = "일본어중">
				<label for="lang5" class="css-label lite-green-check">일본어 중&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang6" class="css-checkbox" name="language" value = "일본어하">
				<label for="lang6" class="css-label lite-green-check">일본어 하&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang7" class="css-checkbox" name="language" value = "중국어상">
				<label for="lang7" class="css-label lite-green-check">중국어 상&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang8" class="css-checkbox" name="language" value = "중국어중">
				<label for="lang8" class="css-label lite-green-check">중국어 중&nbsp;&nbsp;</label>
				<input type="checkbox" id="lang9" class="css-checkbox" name="language" value = "중국어하">
				<label for="lang9" class="css-label lite-green-check">중국어 하&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">시급</th>
				<td><input class="shortfield" type = "text" name = "money"> 원</td>
			</tr>
			<tr>
				<th bgcolor = "#EAEAEA">갱신일 선택</th>
				<td><select name = "renew">
				<option value = "1">1</option><option value = "2">2</option>
				<option value = "3">3</option><option value = "4">4</option>
				<option value = "5">5</option><option value = "6">6</option>
				<option value = "7">7</option><option value = "8">8</option>
				<option value = "9">9</option><option value = "10">10</option>
				</select>&nbsp;&nbsp;일</td>
			</tr>
		</table>

		<div id = "blank">
		
		<table width = "100%" style = "border-width : 0px;">
			<tr style = "border-width : 0px;">
			<td align = 'center' style = "border-width : 0px;">
			<%
			if (sessionOk==null) { %>
		    <script>
 		       alert ("로그인 후 등록 가능");
  		      window.location = 'index.jsp';
 		   </script>
			<%} else {%>
			<input class="regbutton" name="ok" type="button" onclick="javascript:writeCheck();" value="등록" />&nbsp;&nbsp;&nbsp;&nbsp;
			<% } %>
			<input class="regbutton" name="cancel" type="button" onclick = "location.href='index.jsp'" value="취소" />
			</td>
			</tr>
		</table>
		</form>
	
	</div>
	<div id = "blank"></div>
</body>
</html>