<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Comment.*"
    %>

<%
request.setCharacterEncoding("utf-8");

String q_nickname2 = "이제훈";
%> 

<%
CmtDao dao=CmtDao.getInstance();

int nowPage=Integer.parseInt(request.getParameter("page"));
int q_num=Integer.parseInt(request.getParameter("q_num"));
CmtDto dto=dao.getComment(q_num);//Dao 메서드 호출

%>
<html>
	<body>
		<table width=10% cellspacing=0 cellpadding=3 align=center>
		<tr>
			<td bgcolor=#bbd7ff height=21 align=center>답글</td>
		</tr>
	
		</table>
		<br>
				
		<form name="reForm" method=post action="Comment_ReplyProc.jsp">		
			
			
			<table bgcolor=bbd7ff align=center width=30% border=0>

			<tr>
 
				<td><input type="text" name="q_nickname"></td>
			</tr>

			<tr>

				<td><textarea name=q_comment cols=70 rows=10 ></textarea></td>
			</tr>
			
			<tr>
				<td align=right>
				<input type=submit value=답글등록>
				<input type=reset value=다시쓰기>
				<input type=button value=뒤로 onClick="history.go(-1)">
				
				<input type="hidden" value="<%=q_nickname2%>" name="q_nickname">
				<input type=hidden name=q_ip value="<%=request.getRemoteAddr()%>">
				<input type=hidden name=page value="<%=nowPage %>">
				<input type=hidden name=q_num value="<%=q_num %>">
				</td>
			</tr>
				
			</tr>
		</table>
		</form>
	</body>
</html>