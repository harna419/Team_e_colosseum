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
System.out.println(pageFile);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 프레임</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="Main_frame.js"></script>
<script>
function move(afternum){
	if(afternum==1){ //콜로세움이란?
		
	}
	if(afternum==2){ //회원가입
		
	}
	if(afternum==3){//문제게시판
		movePageUrl("Board/Quiz_view/Quiz_list.jsp")
	}
	if(afternum==4){//자유게시판
		movePageUrl("Board/Quiz_Board/Board_List.jsp")
	}
	if(afternum==5){//QNA
		movePageUrl("Board/Quiz_Qna/Qna_Main.jsp?qnanum=1")
	}
	if(afternum==6){//명예의전당
		movePageUrl("Menu6.jsp")
	}
	if(afternum==7){//학습모드
		movePageUrl("Menu7.jsp")
	}
	if(afternum==8){//개발진 소개
		movePageUrl("Menu8.jsp")
	}
}//move()
</script>

<style type="text/css">
html body{height: 100%; margin: 0px;padding: 0px;}
#Intro_menu{}
#main{width:100%; height:100%; position:absolute; left: 0%; background-color: #3D68A6;}
#top{position: absolute; top:0%; background-color: yellow;  right:0%; width: 90%; height: 10%; background-color: #3D68A6;}
#content_block{
overflow-y:scroll;  /*넘어가는 부분은 스크롤 처리*/
position: absolute;width:90%;height: 90%;top:10%; right:0%; background-color: #f2b701; }
=======
#top{position: absolute; top:0%; background-color: yellow; right:0%; width: 90%; height: 10%; background-color: #3D68A6;}

#content_block{position: absolute;width:90%;height: 90%;top:10%; right:0%; background-color: #3D68A6; }
>>>>>>> eec87ae3f62b47e6970c2afb5fa945ba0ef5213c
#back_intro{
position: fixed;
top: 1%;
right: 7%;

  	float:left;
    /*overflow:hidden;  this is important 이 부분이 넘치는 부분을 생략해준다.*/
    height:150px;
    width:150px;
}


.menu_button>span{
position:absolute;
top:50%;
right:5%;

margin-right: 10px;
padding-right: 10px;

color: #fff;
display: block;
font-family: '맑은 고딕';
font-size: 30px;
font-weight: bold;
letter-spacing: 1px;
line-height: 30px;
margin-top: -12px;

text-align: right;
text-transform: uppercase;
vertical-align: middle;
width: 100%;

}


#home_wrapper{width:100%; height:100%; z-index:1; position:absolute; right: 100%;}
.Intro_left{position:absolute; height:100%; left:0px; width:60%; background-color: #ffffff; z-index: 3; margin-right: 0px;]}
.circle{position: absolute; left: 60%; z-index:3; height:100%;}
.Intro_menu{position: absolute; height:100%; right:0px; width:60%; z-index: 2}
.menu_button{ display:block; width:100%; position: relative; height: 50px; } 

#menu1{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}


#menu2{ 
background-image: url('./imgs/opti1-02.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}

#menu3{ 
background-image: url('./imgs/opti1-03.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}

#menu4{ 
background-image: url('./imgs/opti1-04.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu5{ 
background-image: url('./imgs/opti1-05.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu6{ 
background-image: url('./imgs/opti1-06.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu7{ 
background-image: url('./imgs/opti1-07.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu8{ 
background-image: url('./imgs/opti1-08.svg');
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
<div id="top"><jsp:include page="Top.jsp"/></div>
<div id="content_block">
	<jsp:include page='<%=pageFile %>'/>
</div>


<div id="back_intro">
<br>
<%--<font size="5">마이페이지</font> --%>
<img src="./imgs/colosseum_logo_20160527.png" width="250" height="60" >
</div>
</div><!-- main page end-->

<form method="post" id="hiddenForm" name="hiddenForm" action="Main_template.jsp">
<input type="hidden" id="pageUrl" name="pageUrl" value="">
<input type="hidden" id="nowColor" name="nowColor" value="<%=nowColor %>">
<input type="hidden" id="nextColor" name="nextColor" value="<%=nextColor %>">


</form>

</body>
</html>