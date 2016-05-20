<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
   	String q_nickname=request.getParameter("q_nickname");
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>
function check(){
	if(document.postForm.q_subject.value==''){
		alert("글제목 입력 하시오");
		document.postForm.q_subject.focus();
		return;
	}
	
	if(document.postForm.q_content.value==''){
		alert("글내용을 입력 하시오");
		document.postForm.q_content.focus();
		return;
	}
	
	switch(document.postForm.q_notice_group.value){
	case "0": case "1": case "2": case "3":
		document.postForm.action="Board_Notice_WriteProc.jsp";
		document.postForm.submit;
		break;
	case "4": case "5":
		document.postForm.action="Board_WriteProc.jsp";
		document.postForm.submit;
	
	}

	document.postForm.submit();
}
</script>
</head>
<body>

	<table width="80%" cellspacing="0" cellpadding="3" align="center">
		<tr>
		<td height="15" align="center">
		<b><font size=5>글쓰기</font></b>
		</td>
		</tr>
		
		<br>
		<form name="postForm" method="post" action="Board_WriteProc.jsp">
			<table bordercolor="#aad5d9" width="50%" cellpacing="0" cellpadding="3" align="center">
			<tr>
			<td align="center">
			
			<!-- 이름 -->
			<table border="0" width="100%" align="center">
			<tr>
				<td width="10%">이름</td>
				<td width="90%"><input type="text" name="q_nickname" size=10 value="<%=q_nickname%>"></td>
			</tr>
			
			<tr>
				<td>Subject</td>
				<td>
				<%
				if(q_nickname.equals("admin")){//관리자가 접근 할 수 있는 카테고리
				%>	
				<select name="q_notice_group">
					<optgroup label="notice">
						<option value="0">전체공지</option>
	    				<option value="1">게시판공지</option>
	    				<option value="2">자유게시판</option>
	    				<option value="3">질문게시판</option>
	    			</optgroup>
	    			<optgroup label="nomal">
	    				<option value="4">자유게시판</option>
	    				<option value="5">질문게시판</option>
	    			</optgroup>
	    		</select>
				<%
				}else{ //일반 유저가 접근 할 수 있는 카테고리
				%>
				<select name="q_notice_group">
	    			<option value="4">자유게시판</option>
	    			<option value="5">질문게시판</option>
	    		</select>
	
	    		
	    		<%}//else %>
		   		 <input type="text" name="q_subject" size=30>
	    		</td>
	    		
			</tr>
			
			<tr>
				<td>Content</td>
				<td><textarea name="q_content" rows="10" cols="50"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2"><hr size=1>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="글등록" onClick="check()">
				<input type="reset" value="다시쓰기">
				<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
				</td>
			</tr>
			
			</table>
			
			</form>
	</table>

</body>
</html>