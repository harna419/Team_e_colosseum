<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*" 
    import="quiz_colosseum.*" %>
<%-- Quiz_RegisterProc.jsp --%>
<%
request.setCharacterEncoding("utf-8");
Quiz_RegisterMgr quizMgr=Quiz_RegisterMgr.getInstance();//dao객체얻기

boolean result=false;

result=quizMgr.Quiz_insert(request);//dao메서드 호출
response.sendRedirect("../../Main_template.jsp?afternum=3");
%>
 
<html>
  <head>
  
  </head>
  <body>
  
  </body>
</html>
