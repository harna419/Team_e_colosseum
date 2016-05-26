<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div id="home_wrapper">

<div class="Intro_left">
<font align=center><h1>Colosseum</h1></font>
<%=request.getContextPath() %>

</div> <!-- 마이페이지 들어 올 곳  -->

<div class="circle">
<img src="./imgs/Ellipse 1.svg" height="100%">
</div>

<div class="Intro_menu">

<a href="Menu1.jsp" class="menu_link" >
<span id="menu1" data-color="#f2b701" class="menu_button"  style="background-color: #f2b701;"> 
 <span > 소 개 </span> </span>
</a>

<a href="Menu2.jsp" class="menu_link">
<span id="menu2" data-color="#e57d04" class="menu_button" style="background-color: #e57d04;"> 
<span >회원 가입</span>  </span>
</a>

<a href="Menu3.jsp" class="menu_link">
<span id="menu3" data-color="#dc0030" class="menu_button"  style="background-color: #dc0030;"> 
<span > 퀴 즈 </span> </span>
</a>

<a href="Menu4.jsp" class="menu_link">
<span id="menu4" data-color="#b10058" class="menu_button"  style="background-color: #b10058;"> 
<span > 자유게시판 </span>  </span>
</a>

<a href="Menu5.jsp" class="menu_link">
<span id="menu5" data-color="#7c378a" class="menu_button"  style="background-color: #7c378a;"> 
<span > QnA </span> </span>
</a>

<a href="Menu6.jsp" class="menu_link">
<span id="menu6" data-color="#3465aa" class="menu_button"  style="background-color: #3465aa;"> 
<span >명예의 전당</span>  </span>
</a>

<a href="Menu7.jsp" class="menu_link">
<span id="menu7" data-color="#7cb854" class="menu_button"  style="background-color: #7cb854;"> 
<span > 학습 모드 </span>  </span>
</a>

<a href="Menu8.jsp" class="menu_link">
<span id="menu8" data-color="#09a275" class="menu_button"  style="background-color: #09a275;"> 
<span > 개발진 소개 </span> </span>
</a>

</div>	<!-- Intro_menu end -->

</div>	<!-- home_wrapper end -->