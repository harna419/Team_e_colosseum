<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Comment.*"
    %>

<%
CmtDao dao=CmtDao.getInstance();

int nowPage=Integer.parseInt(request.getParameter("page"));
int q_num=Integer.parseInt(request.getParameter("q_num"));

dao.deleteComment(q_num);
response.sendRedirect("Comment_List.jsp?page="+nowPage);
	
	%>