<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
    %>
<html>
 
<%
request.setCharacterEncoding("utf-8");
%>
<%

String q_id=(String)session.getAttribute("q_id");
String q_pwd=request.getParameter("q_pwd");

MemberDao dao=MemberDao.getInstance();//dao 객체 얻기
int check=dao.deleteMember(q_id, q_pwd);//dao 메서드 호출
 
if(check==1){//삭제 완료
	session.invalidate();//세션 무효화
	%>
	<body>
	<form method="post" action="Intro_re.jsp" name="userInput">
	<table width=270 border=0 cellspacing=0 cellpadding=5 align=center>
		
		<tr>
			<td height="39" align="center">
				<font size="+2"><b>회원정보가 삭제되었습니다</b></font>
			</td>
		</tr>
		
		<tr>
			<td align=center>
			<p>안녕히 가세요</p>
			<meta http-equiv="Refresh" content="3;url=Intro_re.jsp">
			</td>
		</tr>
		
		<tr>
			<td align=center>
				<input type="submit" value="확인">
			</td>
		</tr>
		
	</table>	
	</form>
	<%
}else if(check==-1){//비번 틀림
	%>
	<script>
	alert("비밀번호가 틀립니다");
	history.back();
	</script>
	<%
}else if(check==0){
	%><script>
	alert("존재하지 않음");
	history.back();
	</script>
	<%
}
%>
</html>