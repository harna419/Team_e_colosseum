<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Logout.jsp --%>
<%
session.invalidate();
%>    
<html>
<head>
<script>
function logout(){
  alert("로그아웃 되었습니다.");
  movePageUrl("./Board/Quiz_view/Quiz_list.jsp",$('#main').css("backgroundColor"), "#7EB5D7");
  }
  
  logout()
</script>

</head>
</html>
