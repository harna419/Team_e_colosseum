<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="quiz_colosseum.*" 
    import="java.util.*" 
    import="java.text.*"
%>
ㅁㄴㅇㅁㄴㅇ
<%--
<%!
List studyList;
%>
<%
request.setCharacterEncoding("UTF-8");

Quiz_StudyMgr studyMgr=Quiz_StudyMgr.getInstance();//dao객체얻기

//out.println("session 전 :"+request.getParameter("q_dep_num"));

//int q_dep_num=Integer.parseInt(request.getParameter("q_dep_num"));

out.println("q_dep_num:"+session.getAttribute("q_dep_num"));
int q_dep_num=(Integer)session.getAttribute("q_dep_num");

String q_real_reply1=request.getParameter("q_real_reply1");
String q_real_reply2=request.getParameter("q_real_reply2");
String q_real_reply3=request.getParameter("q_real_reply3");
String q_real_reply4=request.getParameter("q_real_reply4");
String q_real_reply5=request.getParameter("q_real_reply5");
String q_real_reply6=request.getParameter("q_real_reply6");
String q_real_reply7=request.getParameter("q_real_reply7");
String q_real_reply8=request.getParameter("q_real_reply8");
String q_real_reply9=request.getParameter("q_real_reply9");
String q_real_reply10=request.getParameter("q_real_reply10");

studyList=studyMgr.quizScroe(q_dep_num);

out.println("studyList.size():"+studyList.size());

%>
<%
for(int i=0;i<studyList.size();i++){
	Quiz_StudyBean bean=(Quiz_StudyBean)studyList.get(i);
	
	%>
	<%=bean.getQ_title() %>
	<br>
	<%=bean.getQ_real_reply1() %>
	<br>
	<%=q_real_reply1 %>
	
	<%
}

%>


<html>
	<head>
		<title>문제답변</title>
		<script>
		</script>
	</head>
	
	<body>
	
	</body>
</html>

 --%>



