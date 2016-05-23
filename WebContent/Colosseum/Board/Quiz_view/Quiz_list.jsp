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
		<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="script.js">
		</script>
		<center><h1>퀴즈리스트</h1></center>
		<a href="../Quiz_input/Quiz_RegisterForm.jsp"><button>퀴즈등록</button></a>
	</head>
	
	<body bgcolor="white" topmargin="30">
	
	<%
	quiz_colosseum.Quiz_ListMgr quiz = Quiz_ListMgr.getInstance();//dao 객체 얻기
	quizList = quiz.getQuizList();//dao 메서드 호출
	%>
	
	<%
		if(quizList.isEmpty()){
	%>
		<br><br><br><br><br><br><br>
		<center><h1>등록된 문제가 없습니다.</h1></center>
	<%
		}else{
			
			//등록된 문제가 있으면
	%>
		<table border=0 width=80 cellpadding=2 cellspacing=0 align=center>
			<tr>
			<%	for(int i=0; i<quizList.size(); i++){
				
				if(i%3==0){
					out.println("</tr><tr>");
				}//if
				
				Quiz_ListBean bean=(Quiz_ListBean)quizList.get(i);//list에서 bean을 꺼내고
				
				%>
				<td>
					<table border=0 align="center">
						<tr>
							<td align="center"><%-- --%>
								<a href="Quiz_Study_View.jsp?q_dep_num=<%=bean.getQ_dep_num()%>&q_dep_step=<%=bean.getQ_dep_step() %>">
									<img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_title_img() %>" width="250" height="200">
								</a>
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
