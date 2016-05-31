<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="quiz_colosseum.*" %>

<%--Quiz_list.jsp --%>

<%
request.setCharacterEncoding("utf-8");
%>

<%!
List quizList;
%>
<html>
	<head>
		<link href="style.css" rel="stylesheet" type="text/css">		
		
		<%-- <center><a href="../Colosseum/Board/Quiz_input/Quiz_RegisterForm.jsp"><button>퀴즈등록</button></a></center>--%>
		
		<script type="text/javascript">
		 
		 function clicked(q_dep_num,q_dep_step){
			 
	         //alert("클릭함")
	         movePageUrl('/Colosseum/Board/Quiz_view/Quiz_Study_View.jsp?q_dep_num='+q_dep_num+'&q_dep_step='+q_dep_step,$('#main').css("backgroundColor"),"#4E94D4");
	         
	      }
		 
		 function addbutton(){
			 //alert("문제추가")
			 movePageUrl('../Colosseum/Board/Quiz_input/Quiz_RegisterForm.jsp',$('#main').css("backgroundColor"),"#4E94D4");
		 }
		 
		</script>
		
<style type="text/css">
   
.container{
	position: absolute;
	width: 100%;
	height: 100%;
}
.contentWrap{
	
	position: absolute;
	width: 80%;
	height: 100%;
	left: 6.5%;		
}
.contentWrap h3{
	font-weight: bold;    
    font-size: 20px; 
    font-family: "맑은 고딕";
    color: #fff;   
    letter-spacing: 0;
}
.contentWrap h3.title {
	position: absolute;
	top: 6.5%;	
	width: 100%;
	height: 26px;
	padding: 0;    
    line-height: 18px;
    border-bottom: 3px solid #fff;
}

#quiz_list{
	
	position: absolute;
	top: 16%;	
	width: 100%;
}
.regist{
	border:0;
 	background: #ffffff;
    color: #4E94D4;
    cursor: pointer;
    float: left;
    margin-top: 10%;
    font-family: "museo-sans",sans-serif;
    font-size: 13px;
    font-weight: bold;
    letter-spacing: 1px;
    text-transform: uppercase;
    opacity: 1;
    width: 80px;
    padding: 5px 10px;
}
.regist:hover{
	background: #8DEEEF;
}
.list_title{
	text-align: center;
	font-family: '맑은 고딕';
	color: #fff;
	font-size: 15px;
    font-weight: bold;
    letter-spacing: 1px;
}
img{
	cursor: pointer;
}
img:hover{
border: 3px solid #fff;
}

</style>
	</head>
	
	<body>
	
<div class="container">
	<div class="contentWrap">
	<h3 class="title"> QUIZ LIST </h3>
	
	<input type="button" class="regist" value="REGIST" onclick="addbutton()">
	<%
	quiz_colosseum.Quiz_ListMgr quiz = Quiz_ListMgr.getInstance();//dao 객체 얻기
	quizList = quiz.getQuizList();//dao 메서드 호출
	%>
	
	<%
		if(quizList.isEmpty()){
	%>
		<br><br><br><br><br><br><br>
		<center><h1 style=color:#FFC6C6>등록된 문제가 없습니다.</h1></center>
	<%
		}else{
			
			//등록된 문제가 있으면
	%>
		<table id="quiz_list" border=0 cellpadding=10 cellspacing=8 align=center>
			<tr>
			<%	for(int i=0; i<quizList.size(); i++){
				
				if(i%4==0){
					out.println("</tr><tr>");
				}//if
				
				Quiz_ListBean bean=(Quiz_ListBean)quizList.get(i);//list에서 bean을 꺼내고
				
				%>
				<td>
					<table border=0 align="center">
						<tr>
							<td align="center"><%-- --%>
								<%-- <a href="Quiz_Study_View.jsp?q_dep_num=<%=bean.getQ_dep_num()%>&q_dep_step=<%=bean.getQ_dep_step() %>">--%>
									<img onclick="javascript:clicked(<%=bean.getQ_dep_num()%>,<%=bean.getQ_dep_step()%>)" src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_title_img() %>" id="q_dep_num<%=bean.getQ_dep_num()%>" width="300" height="250">
									
								<%-- </a>--%>
							</td>
						</tr>
						<tr>
							<td>
								<p class="list_title"><%=bean.getQ_title() %></p>
								
							</td>
							
						</tr>
							
					</table>
				</td>
				<%
			}//for
			%>
			</tr>
		</table>
	<%
		}//else
	%>
	</div><!-- contentWrap -->
</div><!-- container -->
	</body>	
</html>
