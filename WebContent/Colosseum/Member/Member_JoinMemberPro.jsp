<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
    import="java.sql.Timestamp"
    %>
    
<%
request.setCharacterEncoding("utf-8");
 %>
<jsp:useBean id="dto" class="Member.MemberDto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%
dto.setQ_create_time(new Timestamp(System.currentTimeMillis())); 
MemberDao dao=MemberDao.getInstance();
dao.insertMember(dto);

response.sendRedirect("../Main_template.jsp");
%>