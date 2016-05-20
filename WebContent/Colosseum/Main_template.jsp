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
	nowColor="#f2b701";
}

if(nextColor == null){
	nextColor="#f2b701";
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

<style type="text/css">
html body{height: 100%; margin: 0px;padding: 0px;}
#Intro_menu{}
#main{width:100%; height:100%; position:absolute; left: 0%; background-color: #f2b701;}
#top{position: absolute; top:0%; background-color: yellow;  right:0%; width: 90%; height: 10%; background-color: #f2b701;}
#content_block{position: absolute;width:90%;height: 90%;top:10%; right:0%; background-color: #f2b701; }
#back_intro{
position: absolute;
top: 0%;
right: 5%;

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
font-size: 50px;
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
.Intro_left{position:absolute; height:100%; left:0px; width:40%; background-color: #ffffff; z-index: 3;margin-right: 0px;]}
.circle{position: absolute; left: 40%; z-index:3; height:100%;}
.Intro_menu{position: absolute; height:100%; right:0px; width:60%; z-index: 2}
.menu_button{ display:block; width:100%; position: relative; height: 50px; }

#menu1{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}


#menu2{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}

#menu3{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}

#menu4{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu5{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu6{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu7{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu8{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;


</style>

</head>
<body>
<div id="Intro_menu"><jsp:include page='home_wrap.jsp'/></div>
<div id="main"> <!-- main page-->
<div id="top"><jsp:include page='Top.jsp'/></div>
<div id="content_block"><jsp:include page='<%=pageFile %>'/></div>

<div id="back_intro">
<font size="5">마이페이지</font>
<img src="./imgs/test.png">
</div>
</div><!-- main page end-->

<form method="post" id="hiddenForm" name="hiddenForm" action="Main_template.jsp">
<input type="hidden" id="pageUrl" name="pageUrl" value="">
<input type="hidden" id="nowColor" name="nowColor" value="<%=nowColor %>">
<input type="hidden" id="nextColor" name="nextColor" value="<%=nextColor %>">


</form>

</body>
</html>