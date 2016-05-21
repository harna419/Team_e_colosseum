<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
%>
<%
request.setCharacterEncoding("utf-8");
String q_id=request.getParameter("q_id");
Member.MemberDao dao=Member.MemberDao.getInstance();
int check=dao.confirmId(q_id); 

%>
{ "check":<%=check %> }