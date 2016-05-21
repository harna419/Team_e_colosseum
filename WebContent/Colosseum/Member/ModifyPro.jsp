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

<html>
<body>
	<%
	String q_id=(String)session.getAttribute("q_id");
	dto.setQ_id(q_id);// 모델빈에 setter
	
	MemberDao dao=MemberDao.getInstance();// dao 객체얻기
	dao.updateMember(dto);// dao 메서드 호출	
	%>
	
	<table>
	<tr>
		<td height="39" align=center><font size="+2">
		<b>회원정보가 수정되었습니다</b>		
		</font></td>
	</tr>
	
	<tr>
		<td align=center>
		<form>
			<input type="button" value="메인으로" onclick="window.location='Main_template.jsp'">
		</form>
		
		5초후에 메인으로 이동합니다.
		<meta http-equiv="Refresh" content="3;url=Main_template.jsp">
		</td>
	</tr>
	</table>
</body>
</html>
