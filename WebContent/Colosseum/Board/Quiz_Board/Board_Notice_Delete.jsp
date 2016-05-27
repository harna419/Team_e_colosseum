<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"
    %>
    
<%
BoardDao dao=BoardDao.getInstance(); //dao 객체생성
int q_num=Integer.parseInt(request.getParameter("q_num")); 
dao.deleteNotice(q_num);//dao 메소드 호출 
response.sendRedirect("Board_List.jsp");
%>