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
<%--<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>--%>
<%--<script src="//code.jquery.com/jquery-1.11.0.min.js"></script> --%>
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
	
	switch(document.postForm.q_group.value){
	case "0":  
		document.postForm.action="Board/Quiz_Qna/Qna_Faq_WriteProc.jsp";
		document.postForm.submit;
		break;
	case "1": 
		document.postForm.action="./Board/Quiz_Qna/Qna_WriteProc.jsp";
		document.postForm.submit;
		break;
	case "2":
		document.postForm.action="./Board/Quiz_Qna/Qna_Kin_WriteProc.jsp";
		document.postForm.submit;
	
	}

	document.postForm.submit();
}
</script>

<script>
$(function(){
	 $('#q_sort').hide();
});


function sort(){
	//alert($('#q_group').val());
	
	if($('#q_group').val()==0)
	{		
		//alert("1")
		
		$('#q_sort').append("<option class='op' value='0'>회원관련</option>");
		$('#q_sort').append("<option class='op' value='1'>SITE관련</option>");
		$('#q_sort').append("<option class='op' value='2'>기타관련</option>");
					
		$('#q_sort').show();	
	}else if($('#q_group').val()==1){
		$('.op').remove();		
		$('#q_sort').append("<option class='op' value='3'>회원관련</option>");
		$('#q_sort').append("<option class='op' value='4'>기타관련</option>");
		$('#q_sort').show();
	}else if($('#q_group').val()==2){
		$('.op').remove();
		$('#q_sort').append("<option class='op' value='5'>Quiz관련</option>");
		$('#q_sort').append("<option class='op' value='6'>기타관련</option>");
		$('#q_sort').show();
	}
	
	
}//sort() end

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
		<form name="postForm" method="post" action="./Qna/Qna_WriteProc.jsp">
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
				<td>제목</td>
				<td><input type="text" name="q_subject" size=30></td>
	    		
			</tr>
			
			<tr>
				<td>분류</td>
				<td>
				
				<%
				if(q_nickname.equals("admin")){
				%>
				
				<select id=q_group name="q_group" onchange=javascript:sort()>
					<optgroup label="admin">
						<option selected>선택</option>
						<option value="0">FAQ</option>
	    				<option value="1">Q & A</option>
	    				<option value="2">지식in</option>
	    				
	    			</optgroup>
	    		
	    		</select>
	    	
	    		<select id="q_sort" name="q_sort">
	     <!-- 
	    			<option value="0">회원관련</option>
	    			<option value="1">SITE관련</option>
	    			<option value="2">기타관련</option>	    		
	    		-->
	    		</select>
	    		
				<%
				}else{
				%>
				<select id=q_group name="q_group" onchange=javascript:sort()>
					<option selected>선택</option>
	    			<option value="1">Q & A</option>
	    			<option value="2">지식in</option>
	    		</select>
	    		
	    		<select id="q_sort" name="q_sort">
	     <!-- 
	    			<option value="0">회원관련</option>
	    			<option value="1">SITE관련</option>
	    			<option value="2">기타관련</option>	    		
	    		-->
	    		</select>
	
	    		
	    		<%
	    		}//else 
	    		%>
	    		</td>
	    	</tr>
		   		 
			
			<tr>
				<td>내용</td>
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
				</form>
			</table>
				
	</table>

</body>
</html>