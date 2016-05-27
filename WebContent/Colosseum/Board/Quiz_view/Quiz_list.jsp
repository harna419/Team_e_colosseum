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
		<center><h1 style=color:#FFC6C6>퀴즈리스트</h1></center>
		<%-- <center><a href="../Colosseum/Board/Quiz_input/Quiz_RegisterForm.jsp"><button>퀴즈등록</button></a></center>--%>
		
		<script type="text/javascript">
		 
		 function clicked(q_dep_num,q_dep_step){
			 
	         alert("클릭함")
	         movePageUrl('/Colosseum/Board/Quiz_view/Quiz_Study_View.jsp?q_dep_num='+q_dep_num+'&q_dep_step='+q_dep_step);
	         
	      }
		 
		 function addbutton(){
			 alert("문제추가")
			 movePageUrl('../Colosseum/Board/Quiz_input/Quiz_RegisterForm.jsp');
		 }
		 
		</script>
	</head>
	
	<body align="center" bgcolor="white" topmargin="30">
	<input type="button" value="퀴즈등록" onclick="addbutton()">
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
		<table border=0 width=80 cellpadding=10 cellspacing=8 align=center>
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
								<center><%=bean.getQ_title() %></center>
								
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
	</body>
</html>
