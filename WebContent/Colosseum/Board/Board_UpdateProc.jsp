<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"
    %>
    
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="Board.BoardDto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
BoardDao dao=BoardDao.getInstance();

int nowPage=Integer.parseInt(request.getParameter("page"));
int q_num=Integer.parseInt(request.getParameter("q_num"));

dao.updateBoard(dto); 
response.sendRedirect("Board_List.jsp?page="+nowPage);
%>
