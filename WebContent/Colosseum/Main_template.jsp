<%@page import="org.apache.catalina.ant.ReloadTask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("utf-8");
String pageFile=request.getParameter("pageUrl");
String nowColor=request.getParameter("nowColor");
String nextColor=request.getParameter("nextColor");

System.out.println("nowColor: "+nowColor);
System.out.println("nextColor: "+nextColor);

if(pageFile == null){
	pageFile="testmain.jsp";
}

if(nowColor == null){
	nowColor="#3D68A6";
}

if(nextColor == null){
	nextColor="#3D68A6";
}
System.out.println("pageFile:"+pageFile);


String mem_id=(String)session.getAttribute("mem_id");
System.out.println("세션id:"+mem_id);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 프레임</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> <!--JQuery-->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> <!-- 제이쿼리 UI -->
<script type="text/javascript" src="Main_frame.js"></script> <!-- 메인 프레임 스크립트 -->
<script src="/path/to/jquery.mCustomScrollbar.concat.min.js"></script> <!-- 커스텀 스크롤바 -->

<link rel="stylesheet" href="/path/to/jquery.mCustomScrollbar.css" />

<script>
function move(afternum){
	if(afternum==1){ //LOGIN/OUT
		
	}
	if(afternum==2){ //개발진소개
		
	}
	if(afternum==3){//회원가입
		movePageUrl("")
	}
	if(afternum==4){//문제게시판
		movePageUrl("Board/Quiz_view/Quiz_list.jsp",$('#main').css("backgroundColor"),"#4E94D4")
	}
	if(afternum==5){//GROUP
		movePageUrl("")
	}
	if(afternum==6){//명예의전당
		movePageUrl("Menu6.jsp")
	}
	if(afternum==7){//학습모드
		movePageUrl("Menu7.jsp")
	}
	if(afternum==8){//게시판
		movePageUrl("Board/Quiz_Qna/Qna_Main.jsp?qnanum=1")
	}
	if(afternum==9){
		movePageUrl("Board/Quiz_Board/Board_List.jsp");
	}
	if(afternum==10){
		movePageUrl("Board/Quiz_Qna/Qna_List.jsp");
	}
}//move()
</script>

<style type="text/css">
html body{height: 100%; margin: 0px;padding: 0px; }

#main{width:100%; height:100%; position:absolute; left: 0%; background-color: #3D68A6;}

/*#top{position: absolute; top:0%; background-color: yellow; right:0%; width: 90%; height: 10%; background-color: #3D68A6;}
*/

#content_block{
overflow-y:scroll;  /*넘어가는 부분은 스크롤 처리*/
position: absolute;width:90%;height: 100%;top:0%; left:10%; background-color: #3D68A6; }

#back_intro{
position: fixed;
top: 2%;
right: 9%;

  	float:left;
    /*overflow:hidden;  this is important 이 부분이 넘치는 부분을 생략해준다.*/
    height:150px;
    width:150px;
    z-index: 3;
}


.menu_button>span{
position:absolute;
top:50%;
right:5%;

margin-right: 10px;
padding-right: 10px;

color: #fff;
display: block;
font-family: "museo-sans",sans-serif;
font-size: 14px;
font-weight: bold;
letter-spacing: 1px;
line-height: 30px;
margin-top: -12px;

text-align: right;
text-transform: uppercase;
width: 100%;

}


#home_wrapper{width:100%; height:100%; z-index:4; position:absolute; right: 100%;}
.Intro_left{
overflow-y:scroll;


position:absolute; height:100%; left:0px; width:60%; background-color: #ffffff; z-index: 3; margin-right: 0px;]}
.circle{position: absolute; left: 60%; z-index:3; height:100%;}
.Intro_menu{position: absolute; height:100%; right:0px; width:60%; z-index: 2}
.menu_button{ display:block; width:100%; position: relative; height: 50px; } 


<%--로그인/로그아웃 --%>
#menu1{
background-image: url('./imgs/01_login.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}

<%--소개--%>
#menu2{ 
background-image: url('./imgs/07.whoweare.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}
<%--회원가입 --%>
#menu3{ 
background-image: url('./imgs/02.Joinus.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}
<%--퀴즈--%>
#menu4{ 
background-image: url('./imgs/03.Quiz.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}
<%--그룹--%>
#menu5{ 
background-image: url('./imgs/08.group.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}
<%--명예의전당--%>
#menu6{ 
background-image: url('./imgs/05.TheFallofFame.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}
<%--학습모드--%>
#menu7{ 
background-image: url('./imgs/06.Learning.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}
<%--게시판 --%>
#menu8{ 
background-image: url('./imgs/04.Board.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#whitebox{
position: absolute;
top: 0%;
left: 10%;
display: block;
background-color: white;
width: 70%;
height:100%;

}

</style>

</head>

<body onLoad="move(<%=request.getParameter("afternum")%>)">

<div id="Intro_menu"><jsp:include page='./home_wrap.jsp'/></div>
<div id="main" > <!-- main page-->
<!--<div id="top"><jsp:include page="Top.jsp"/> top 부분 제거 합니다.</div>-->
<div id="content_block">
	<jsp:include page='<%=pageFile %>'/>
</div>


<div id="back_intro">
<br>
<%--<font size="5">마이페이지</font> --%>
<img src="./imgs/colosseum_logo_20160530.png" width="250" height="60" >
</div>
</div><!-- main page end-->

<form method="post" id="hiddenForm" name="hiddenForm" action="Main_template.jsp">
<input type="hidden" id="pageUrl" name="pageUrl" value="">
<input type="hidden" id="nowColor" name="nowColor" value="<%=nowColor %>">
<input type="hidden" id="nextColor" name="nextColor" value="<%=nextColor %>">


</form>

</body>
</html>