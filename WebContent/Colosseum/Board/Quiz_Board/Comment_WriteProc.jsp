<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Comment.*"
    %>
<%
System.out.println("Coment_!!");

request.setCharacterEncoding("utf-8");
int q_zone=Integer.parseInt(request.getParameter("q_zone"));

System.out.println("q_zone 리퀘스트"+q_zone);


%>
 
 	 <jsp:useBean id="cdto" class="Comment.CmtDto">
 	 <jsp:setProperty name="cdto" property="*"/>
 	 <jsp:setProperty name="cdto" property="q_zone" value="<%=q_zone%>"/>
 	 </jsp:useBean>

    
    
    <%
    //cdto.setQ_zone(q_zone);
    System.out.println("55q_zone"+cdto.getQ_zone());
    CmtDao cdao=CmtDao.getInstance();
    cdao.insertComment(cdto);//dao 메서드 호출
    //response.sendRedirect("Board_Content.jsp");
    //response.sendRedirect("Board_Content.jsp?q_zone="+q_zone);
    //데이터 입력하고 실행한 후
    //DB에서 select * from guest; 해보기 
    %>