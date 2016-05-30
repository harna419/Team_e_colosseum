<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="quiz_colosseum.*"
    import="java.util.*"
    %>
    
<%
request.setCharacterEncoding("utf-8"); 
Quiz_ScoreMgr quiz=Quiz_ScoreMgr.getInstance();
String q_id="admin";
List quizPlayList;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div> 
	<h2>내가 플레이한 문제</h2>
	</div>
	
	<div>
	<span>제목</span><span>문제</span>
	<%
	quizPlayList = quiz.quizPlaygame(q_id);
	if(quizPlayList.isEmpty()){
	%>
	<br><br><br><br><br><br><br>
		<center><h1 style=color:#FFC6C6>등록된 문제가 없습니다.</h1></center>
	<%
	}else{
	%>
	<div>
	<%
	for(int i=0; i<quizPlayList.size(); i++){
		Quiz_ScoreBean bean=(Quiz_ScoreBean)quizPlayList.get(i);
		%>
		
		<div>
		
		<span><%=bean.getQ_title() %></span>
		<span> <%=bean.getQ_subject() %></span>
		</div>
	<%
	}//for
	%>
		<%  
	}//else
	%>
	</div>
	</div>

</div>
</body>
</html>