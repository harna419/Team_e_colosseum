<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Comment.*"
    %>
    ReplyProc.jsp
    <%
    request.setCharacterEncoding("utf-8");
    %>
    
    <jsp:useBean id="bb" class="Comment.CmtDto"/>
    	<jsp:setProperty name="bb" property="*"/>
    <jsp:useBean id="dao" class="Comment.CmtDao"/>
    
    <%
    int nowPage=Integer.parseInt(request.getParameter("page"));
    int q_num=Integer.parseInt(request.getParameter("q_num"));
    String q_nickname=request.getParameter("q_nickname");
 
    CmtDto dto=dao.getComment(q_num);//Dao 메서드 호출
    int q_comment_pos=dto.getQ_comment_pos();//글 위치를 얻고
    int q_comment_depth=dto.getQ_comment_depth();//글 깊이를 얻고
    
    bb.setQ_comment_pos(q_comment_pos);//모델빈에 setter 작업
    bb.setQ_comment_depth(q_comment_depth);
    
    dao.replyPos(bb);//dao 메서드 호출, pos(글위치 확보)
    dao.replyComment(bb);//dao 메서드 호출, 답글쓰기
    
    response.sendRedirect("Comment_List.jsp?page="+nowPage);
    
    %>
