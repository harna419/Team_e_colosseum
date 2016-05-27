<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Qna.*"
    import="java.util.*"
    import="java.text.*"
    %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Qna_Main</title>
<style type="text/css">

html body{height: 100%; margin: 0px;padding: 0px;}
.container {
    position:absolute;
    width: 100%;
    height: 100%;
}
.content{
	position: absolute;
	width: 70%;
	height: 100%;
	left: 10%	
}
h3 {
	width: 100%;
	position:absolute;
	padding: 0;
    height: 26px;
    line-height: 18px;
    border-bottom: 3px solid #252525;
    font-weight:bold;    
    font-size: 17px; 
    font-family:맑은 고딕;
    color:1d1d1d;   
    letter-spacing: 0;
}

table{
	width: 100%;
	table-layout:static;
	font-size: 17px;
	font-weight:bold;
	font-family: Dotum;
}

.menu{	
	width:100%;
	height:20%;
	position:absolute;
	top:10%;
	
}

.boxCon{
	width:100%;
	height:15%;
	position:absolute;
	top:30%;
	
}

#faq{
	width:100%;
	height:25%;
	position:absolute;
	top:45%;
	
}

<!-- 구분 -->

img {
    vertical-align: middle;
    /*position:absolute;
    top:30%;
    left:25%*/
}

center{
	display:block;
	text-align: -webkit-center;
}

.boxCon #btn{
	top: 30%;
	left: 25%;
	width: 100%;
	height: 50%;
	position:absolute;
	
	vertical-align: middle;
}
#faq{
	margin: 0 auto;
}
#faq_box{
	margin-left: 23%;
    width: 100%;
    height: 100%;
}


</style>
</head>
<body>
	<div class="container">
	<div class="content">
		 
		<h3 class="title">질문 게시판</h3>
		
		<div class="menu">		
		
			<center><img src="imgs/qnamenubar.png" align="middle"></center>
			
		</div>

	<div class="boxCon">
	
		<div id="btn">
			<a href="Qna_List.jsp"><img src="imgs/qna.png"></a>
			<a href="Qna_Kin_List.jsp"><img src="imgs/kin.png"></a>
			<a href="../Board/Board_List.jsp"><img src="imgs/free.png"></a>
		</div>
	
	</div>

	<div id="faq">
		<div id="faq_box"><jsp:include page="Qna_Faq.jsp"/></div>
	</div>

	
	</div><!-- content -->
	</div><!-- container -->
</body>
</html>