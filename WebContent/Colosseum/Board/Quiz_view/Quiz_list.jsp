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
		<center><h1>퀴즈리스트</h1></center>
		<center><a href="../Quiz_input/Quiz_RegisterForm.jsp"><button>퀴즈등록</button></a></center>
<<<<<<< HEAD
		<script type="text/javascript">
		 
		 function clicked(q_dep_num,q_dep_step){
			 
	         alert("클릭함")
	         movePageUrl('/Colosseum/Board/Quiz_view/Quiz_Study_View.jsp?q_dep_num='+q_dep_num+'&q_dep_step='+q_dep_step);
	         
	      }
		 
		</script>
=======
		<script>
		function clicked(q_dep_num,q_dep_step){
			alert("클릭함")
			movePageUrl('/Colosseum/Board/Quiz_view/Quiz_Study_View.jsp?q_dep_num='+q_dep_num+'&q_dep_step='+q_dep_step);
		}
		</script>
	
>>>>>>> 173e0ea87c9519d17b0f08d1ecd45b363b173e54
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
<<<<<<< HEAD
								<%-- <a href="Quiz_Study_View.jsp?q_dep_num=<%=bean.getQ_dep_num()%>&q_dep_step=<%=bean.getQ_dep_step() %>">--%>
									<img onclick="javascript:clicked(<%=bean.getQ_dep_num()%>,<%=bean.getQ_dep_step()%>)" src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_title_img() %>" id="q_dep_num<%=bean.getQ_dep_num()%>" width="250" height="200">
								<%-- </a>--%>
=======
								
								<%-- <a href="Main_template.jsp?page=../Colosseum/Board/Quiz_view/Form/Quiz_Study_View.jsp?q_dep_num=<%=bean.getQ_dep_num()%>&q_dep_step=<%=bean.getQ_dep_step() %>">--%>									
<<<<<<< HEAD
								<img onclick="javascript:clicked(<%=bean.getQ_dep_num()%>,<%=bean.getQ_dep_step()%>)" src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_title_img() %>" id="q_dep_num<%=bean.getQ_dep_num()%>" width="250" height="200">	
														
=======
								<img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_title_img() %>" id="q_dep_num<%=bean.getQ_dep_num()%>" width="250" height="200">									
>>>>>>> 0379f4350fa97d465bb654819ebd2df67ad02ae1
								<%-- </a>--%>
								
>>>>>>> 173e0ea87c9519d17b0f08d1ecd45b363b173e54
							</td>
						</tr>
						<tr>
							<td>
								<center><%=bean.getQ_title() %></center>
							</td>
							<input type="hidden" id="quiz_study_value" value="/Colosseum/Board/Quiz_view/Quiz_Study_View.jsp?q_dep_num=<%=bean.getQ_dep_num()%>&q_dep_step=<%=bean.getQ_dep_step() %>">
<<<<<<< HEAD
							<input type="hidden" id="quiz_study_num" value="<%=bean.getQ_dep_num()%>">
=======
							<input type="hidden" id="quiz_study_num" value="<%=bean.getQ_dep_num() %>">
>>>>>>> 0379f4350fa97d465bb654819ebd2df67ad02ae1
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
