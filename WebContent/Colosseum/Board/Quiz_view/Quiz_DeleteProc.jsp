<%@page import="quiz_colosseum.Quiz_RegisterMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
request.setCharacterEncoding("utf-8");
int q_dep_num=Integer.parseInt(request.getParameter("q_dep_num"));


Quiz_RegisterMgr dao=Quiz_RegisterMgr.getInstance();//dao객체얻기
int check=dao.quiz_del(q_dep_num);//dao메서드 호출
%>
<script>
function ret(){
	 alert("되돌아가기")
	 history.go(-3);
	//movePageUrl('/Colosseum/Board/Quiz_view/Quiz_list.jsp');
}
</script> 
<%--
if(check==1){//삭제완료
	response.sendRedirect("Quiz_list.jsp");
}
--%>
<html>
  <head>
  
  </head>
  <body onload="ret()">
  
  </body>
</html>

