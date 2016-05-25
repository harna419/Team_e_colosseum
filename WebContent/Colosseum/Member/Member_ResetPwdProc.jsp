<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
    %> 
<%
request.setCharacterEncoding("utf-8");
%>    
<jsp:useBean id="dto" class="Member.MemberDto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%
String q_id=request.getParameter("q_id");
String q_pwd=request.getParameter("q_pwd");
MemberDao dao=MemberDao.getInstance();
dao.updatePwd(dto);
%>
<div align="center">
변경이 완료 되었습니다<br>
<div align="center"><a href="javascript:this.close()"><input type="button" value="닫기"></a></div>
</div>