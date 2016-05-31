<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
//top.jsp 를 첫번째 메뉴로 바꿀려고 수정중.
/*
String q_id="admin";
String q_name="admin";
String q_user_num="01";
String q_nickname="admin";

session.setAttribute("q_id", q_id);
session.setAttribute("q_name", q_name);
session.setAttribute("q_user_num", q_user_num);
session.setAttribute("q_nickname", q_nickname);
*/
//String q_id=request.getParameter("id");

%>



<div id="home_wrapper">

<div class="Intro_left" data-mcs-theme="dark">
<font align=center><h1>Colosseum</h1></font>
<%--<%=request.getContextPath() 
<%@ include file="./Member/Member_MyPage.jsp" %>--%>
<%

if(session.getAttribute("mem_id")==null || session.getAttribute("mem_id").equals("")){
	%>
	<h1>로그인후 이용하세요</h1>
	
	<%
}else{
%>
<jsp:include page="./Member/Member_MyPage.jsp"/>
 <%}%>
</div> <!-- 마이페이지 들어 올 곳  -->


<div class="circle">
<img src="./imgs/Ellipse 1.svg" height="100%">
</div>

<div class="Intro_menu">

<a href="Menu1.jsp" class="menu_link" >
<span id="menu1" data-color="#FFFFFF" class="menu_button"  style="background-color: #FFFFFF;"> 
 <span > LOGIN/OUT </span> </span>
</a>

<a href="Menu2.jsp" class="menu_link">
<span id="menu2" data-color="#2c93f3" class="menu_button" style="background-color: #2c93f3;"> 
<span > WHO WE ARE </span>  </span>
</a>

<a href="Menu3.jsp" class="menu_link">
<span id="menu3" data-color="#015db2" class="menu_button"  style="background-color: #015db2;"> 
<span > JOIN US </span> </span>
</a>

<a href="Menu4.jsp" class="menu_link">
<span id="menu4" data-color="#4E94D4" class="menu_button"  style="background-color: #4E94D4;"> 
<span > QUIZ </span>  </span>
</a>

<a href="Menu5.jsp" class="menu_link">
<span id="menu5" data-color="#3465AA" class="menu_button"  style="background-color:#3465AA;"> 
<span > GROUP </span> </span>
</a>

<a href="Menu6.jsp" class="menu_link">
<span id="menu6" data-color="#015db2" class="menu_button"  style="background-color: #015db2;"> 
<span > THE HALL OF FAME </span>  </span>
</a>

<a href="Menu7.jsp" class="menu_link">
<span id="menu7" data-color="#2c93f3" class="menu_button"  style="background-color: #2c93f3;"> 
<span > LEARNING </span>  </span>
</a>

<a href="Menu8.jsp" class="menu_link">
<span id="menu8" data-color="#FFFFFF" class="menu_button"  style="background-color: #FFFFFF;"> 
<span > BULLETIN BOARD </span> </span>
</a>

</div>	<!-- Intro_menu end -->

</div>	<!-- home_wrapper end -->
