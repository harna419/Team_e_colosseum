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
<span id="menu1" data-color="#3D68A6" class="menu_button"  style="background-color: #3D68A6;"> 
 <span > 소 개 </span> </span>
</a>

<a href="Menu2.jsp" class="menu_link">
<span id="menu2" data-color="#6F95CF" class="menu_button" style="background-color: #6F95CF;"> 
<span > 개발진 소개 </span>  </span>
</a>

<a href="Menu3.jsp" class="menu_link">
<span id="menu3" data-color=#7EB5D7 class="menu_button"  style="background-color: #7EB5D7  ;"> 
<span > 회원가입 </span> </span>
</a>

<a href="Menu4.jsp" class="menu_link">
<span id="menu4" data-color="#B2E2F0" class="menu_button"  style="background-color: #B2E2F0;"> 
<span > 퀴 즈 </span>  </span>
</a>

<a href="Menu5.jsp" class="menu_link">
<span id="menu5" data-color=#EFF0E7 class="menu_button"  style="background-color: #EFF0E7;"> 
<span > 게시판 </span> </span>
</a>

<a href="Menu6.jsp" class="menu_link">
<span id="menu6" data-color="#CBCAD4" class="menu_button"  style="background-color: #CBCAD4;"> 
<span >명예의 전당</span>  </span>
</a>

<a href="Menu7.jsp" class="menu_link">
<span id="menu7" data-color="#EECFD4" class="menu_button"  style="background-color: #EECFD4;"> 
<span > 학습 모드 </span>  </span>
</a>

<a href="Menu8.jsp" class="menu_link">
<span id="menu8" data-color="#C2AAC5" class="menu_button"  style="background-color: #C2AAC5;"> 
<span > ?_? </span> </span>
</a>

</div>	<!-- Intro_menu end -->

</div>	<!-- home_wrapper end -->