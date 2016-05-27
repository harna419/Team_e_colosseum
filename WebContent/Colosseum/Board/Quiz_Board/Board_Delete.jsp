<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"
    %>
    
<%
BoardDao dao=BoardDao.getInstance();
int q_num=Integer.parseInt(request.getParameter("q_num"));
int nowPage=Integer.parseInt(request.getParameter("page"));

dao.deleteBoard(q_num);
response.sendRedirect("../../Main_template.jsp?afternum=4");
%> 