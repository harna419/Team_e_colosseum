<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Qna.*"
    %>
    
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="Qna.QnaDto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
QnaDao dao=QnaDao.getInstance();

//nt nowPage=Integer.parseInt(request.getParameter("page"));
int q_num=Integer.parseInt(request.getParameter("q_num"));
 
dao.updateQna(dto); 
response.sendRedirect("../../Main_template.jsp?afternum=10");
%>
