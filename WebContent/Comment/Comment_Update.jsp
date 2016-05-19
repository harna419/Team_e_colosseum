<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Comment.*"
    %>

<%
request.setCharacterEncoding("utf-8");
//String q_name = (String) session.getAttribute("q_name");//id 이름에 있는 값 얻기

String q_nickname2 = "이제훈";
%>

	<%
	
	CmtDao dao = CmtDao.getInstance();
	
	int nowPage=Integer.parseInt(request.getParameter("page"));
	int q_num=Integer.parseInt(request.getParameter("q_num"));
	
	CmtDto dto=dao.getComment(q_num);//dao 메서드 호출
	
	String q_comment=dto.getQ_comment();
	String q_modify_time=dto.getQ_modify_time();


	%>
<html>
	<head>
	  <script>
	  	function check(){
	  		
	  			alert("수정?");
	
	  		document.editForm.submit();//서버로 전송
	  	}//check() end
	  </script>
	</head>
	<body>
		<table width=10% cellspacing=0 cellpadding=3 align=center>
			<tr>
			<td bgcolor="#cebee1" height=21 align=center>
			<font size=4>글 수정하기</font>
			</td>
			</tr>
		</table>
		
		<form name="editForm" method="post" action="Comment_UpdateProc.jsp">
			<table width="70%" cellspacing="0" cellpadding=7  align=center>
			<tr>
			<td align=center>
			
			<table bgcolor=cebee1 align=center width=30% border=1 cellspacing=2 cellpadding=4>
		
			
			<tr>
				
				<td><%=q_nickname2 %></td>
			</tr>
			
			<tr>
				
				<td><textarea name=q_comment cols=70 rows=10><%=q_comment %></textarea></td>
			</tr>	
				
			<tr>
				<td align=center>
				 <input type="button" value="수정" onclick="check()">
				 <input type="reset" value="취소">
				 
				 <input type="hidden" name="q_num" value="<%=q_num%>">
				 <input type="hidden" name="page" value="<%=nowPage %>">
				</td>
			</tr>
				
			</table>
		</td>
		</tr>	
		</table>
	</form>
	</body>
</html>