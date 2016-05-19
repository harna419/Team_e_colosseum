<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Comment.*"
    %>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="Comment.CmtDto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
CmtDao dao=CmtDao.getInstance();

int nowPage=Integer.parseInt(request.getParameter("page"));
int q_num=Integer.parseInt(request.getParameter("q_num"));

dao.updateComment(dto); 
response.sendRedirect("Comment_List.jsp?page="+nowPage);
 
%>