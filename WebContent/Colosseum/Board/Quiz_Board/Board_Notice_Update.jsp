<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"
    %>
<%
request.setCharacterEncoding("utf-8");
%>

<%
BoardDao dao = BoardDao.getInstance();
int q_num=Integer.parseInt(request.getParameter("q_num"));

BoardDto dto=dao.getNotice(q_num);

String q_subject=dto.getQ_subject();
String q_content=dto.getQ_content();
%>

<html>
	<head>
	
	</head>
	
	<body>
		<div><h3>글수정하기</h3></div>
		
		<form name="editForm" method="post" action="Board_Notice_UpdateProc.jsp">
			<table width="70%" cellspacing="0" cellpadding=7>
				<tr>
				<td align=center>
				<table border=0>
			
					
					<tr>
					<td>제목</td>
					<td>
					<input type="text" name="q_subject" value="<%=q_subject %>" size="50">
					</td>
					</tr>
					
					<tr>
					<td>내용</td>
					<td>
					<textarea name="q_content" rows="10" cols="50"><%=q_content %></textarea>
					</td>
					</tr>
					
					<tr>
					<td colspan=2>
						<input type="submit" value="수정">
						<input type="button" value="뒤로" onclick="history.go(-1)">
						
						<input type="hidden" name="q_num" value="<%=q_num %>">
				
					</td>
					</tr>
					
					<tr>
					<td colspan=2>
					<hr>
					</td>
					</tr>
					
				</table>
				</td>
				</tr>
				</table>
		</form>
	</body>
</html>