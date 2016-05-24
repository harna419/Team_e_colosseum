<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="quiz_colosseum.*" 
    import="java.util.*" 
    import="java.text.*"
%>

<%!
List quizScore;
Vector quizView;
%>
<%

request.setCharacterEncoding("UTF-8");

Quiz_StudyMgr studyMgr=Quiz_StudyMgr.getInstance();//dao객체얻기

out.println("q_dep_num:"+session.getAttribute("q_dep_num"));
int q_dep_num=(Integer)session.getAttribute("q_dep_num");
int q_dep_step=Integer.parseInt(request.getParameter("q_dep_step"));
out.println("q_dep_step:"+q_dep_step);

studyMgr.quiz_ResultHistory(request,q_dep_num,q_dep_step);//메서드 호출
quizView = studyMgr.quizView(q_dep_num);//메서드 호출
//--------------------------------------------------------------------
Quiz_ScoreMgr scoreMgr = Quiz_ScoreMgr.getInstance();//dao객체얻기
quizScore = scoreMgr.quizScore(q_dep_num);// 메서드 호출


%>
<html>
<head><center><h1>문제결과</h1></center></head>
	<body align="center">
	<%
	

	for(int i=0;i<quizScore.size();i++){
		
		Quiz_ScoreBean bean=(Quiz_ScoreBean)quizScore.get(i);
		//Quiz_StudyBean view=(Quiz_StudyBean)quizView.get(i);
	%>
	<div>
	제목 : <%=bean.getQ_title() %><br>
	
		 <%
		 	if("Y".equals(bean.getQ_quiz_type())){
		%>
			정답 :  <%--  <%=view.getQ_real_reply1() %>--%>
			<br>
			나의 답 : <%=bean.getQ_custom_reply1()%>
		 
		 <%
			}else{
		%>
			정답 : <%--  <%=view.getQ_real_reply1() %>--%>
			<br>
			나의 답 : <%=bean.getQ_custom_reply1()%>
		<%
			}
		 %>
		 
	
		
	</div>
	
	
		<%--
		<br>
		<%=bean.getQ_subject() %>
		<br>
		<%=bean.getQ_content() %>
		<br>
		<%=bean.getQ_quiz_type() %>	
		 --%>
	<%		
	}//for
	 %>
	
	</body>
</html>
