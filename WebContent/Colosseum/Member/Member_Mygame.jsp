<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="quiz_colosseum.*"
    import="java.util.*"
    %>
    
<%
request.setCharacterEncoding("utf-8"); 
Quiz_ScoreMgr quiz=Quiz_ScoreMgr.getInstance();
String q_id=(String)session.getAttribute("mem_id");
List quizMyList;
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
	<h2>내가 등록한 문제</h2>
	</div>
	
	<div>
	<table>
		<tr>
		<th>제목<th><th>내용</th>
		</tr>
	<%
	quizMyList = quiz.getMyQuizList(q_id);
	if(quizMyList.isEmpty()){
	%>
	<tr>
		<th><h1 style=color:#666>등록된 문제가 없습니다.</h1></th>
		</tr>
	<%
	}else{
	%>
	<div>
	<%
	for(int i=0; i<quizMyList.size(); i++){
		Quiz_ScoreBean bean=(Quiz_ScoreBean)quizMyList.get(i);
		%>
		
		<tr>
		<td align="center"><%=bean.getQ_title() %></td>
		<td align="center"><%=bean.getQ_subject() %></td>
		</tr>
	<%
	}//for
	%>
		<%  
	}//else
	%>
	</table>
	</div>
	</div>

</div>
</body>
</html>