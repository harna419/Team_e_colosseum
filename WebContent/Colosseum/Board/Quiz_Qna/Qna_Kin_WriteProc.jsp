<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Qna.*"%>
    
<%
 request.setCharacterEncoding("utf-8");
%>
 
<jsp:useBean id="dto" class="Qna.QnaDto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>


<%

//dto.setIp(request.getRemoteAddr()); //ip setter 작업

QnaDao dao = QnaDao.getInstance(); //dao객체 얻기
dao.insertQna(dto); //dao 메서드 호출
response.sendRedirect("Qna_Kin_List.jsp"); //list.jsp 이동

%>

    