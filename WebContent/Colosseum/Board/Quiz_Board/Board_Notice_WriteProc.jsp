<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"%>
    
<%
 request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="Board.BoardDto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>


<% 
//dto.setIp(request.getRemoteAddr()); //ip setter 작업

BoardDao dao = BoardDao.getInstance(); //dao객체 얻기
dao.insertBoard(dto); //dao 메서드 호출
response.sendRedirect("../../Main_template.jsp?afternum=9");
%>
