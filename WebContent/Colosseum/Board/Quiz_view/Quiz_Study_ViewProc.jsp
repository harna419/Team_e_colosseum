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

//out.println("q_dep_num:"+session.getAttribute("q_dep_num"));
int q_dep_num=(Integer)session.getAttribute("q_dep_num");
int q_dep_step=Integer.parseInt(request.getParameter("q_dep_step"));
//out.println("q_dep_step:"+q_dep_step);

studyMgr.quiz_ResultHistory(request,q_dep_num,q_dep_step);//메서드 호출
quizView = studyMgr.quizView(q_dep_num);//메서드 호출
//--------------------------------------------------------------------
Quiz_ScoreMgr scoreMgr = Quiz_ScoreMgr.getInstance();//dao객체얻기
quizScore = scoreMgr.quizScore(q_dep_num);// 메서드 호출

%>
<html>
<head><center><h1>결과</h1></center></head>
	<body align="left">
		
		<%--
		// 가끔씩 JSP error 페이지 발생함(퀴즈 history 후에 발생함)
		<%
		Quiz_ScoreBean titlebean=(Quiz_ScoreBean)quizScore.get(0);
		%>
		
		<div><center><h2><%= titlebean.getQ_title() %></h2></center></div> --%>
	
	<%
	int quiz_Yes=0;
	int quiz_No=0;
	for(int i=0;i<quizScore.size();i++){
		
		Quiz_ScoreBean bean=(Quiz_ScoreBean)quizScore.get(i);
		Quiz_StudyBean view=(Quiz_StudyBean)quizView.get(i);
		
	%>	
		<div>
			<ul type="1">
			 	<%
			 	if("Y".equals(bean.getQ_quiz_type())){
			 	%>
			 	<br>정답 입니다.<br>
			 	<li><%= i+1%> 번 문제 : <%=view.getQ_subject() %></li>		 	
			 			 	
				<li>정답     : <%=view.getQ_real_reply1() %></li>
				<li>나의 답 : <%=bean.getQ_custom_reply1()%></li>
				<li>설명     : <%=bean.getQ_content()%></li>
			 <%
			 	quiz_Yes++;
			 }else{%>
			 	<br>오답 입니다.<br>
			 	<li><%= i+1%> 번 문제 : <%=view.getQ_subject() %></li>		 	
			 			 	
				<li>정답     : <%=view.getQ_real_reply1() %></li>
				<li>나의 답 : <%=bean.getQ_custom_reply1()%></li>
				<li>설명     : <%=bean.getQ_content()%></li>
			<%
			quiz_No++;
				}
			 %>
			 
			</ul>
		</div>
	<hr size='1' color='blue'>
	<%		
	}//for
	 %>
	 
	 전체 : <%=quizScore.size() %> / 정답 : <%=quiz_Yes %> / 오답 : <%=quiz_No %>
	 <br>
	 <input type="button" onclick="document.location.href='Quiz_list.jsp'" value="확인완료">
	</body>
</html>
