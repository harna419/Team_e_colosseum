<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
%>
<%
request.setCharacterEncoding("utf-8");
String q_nickname=request.getParameter("q_nickname");
Member.MemberDao dao=Member.MemberDao.getInstance();
int check=dao.confirmNickname(q_nickname); 
     
%>
<<<<<<< HEAD
{ "check":<%=check %> }  
=======
{ "check":<%=check %> } 
>>>>>>> 9bce832a020f6c601063fea683469e30de59c057
