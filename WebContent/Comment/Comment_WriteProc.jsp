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
   
    <jsp:useBean id="dao" class="Comment.CmtDao"/>
    
    <%
    dao.insertComment(dto);//dao 메서드 호출
    response.sendRedirect("Comment_List.jsp");
    //데이터 입력하고 실행한 후
    //DB에서 select * from guest; 해보기 
    %>