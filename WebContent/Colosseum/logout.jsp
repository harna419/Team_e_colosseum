<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Logout.jsp --%>
<%
session.invalidate();
%>    
<html>
<head>
<script>
location.href="Main_template.jsp"
</script>

</head>
</html>
