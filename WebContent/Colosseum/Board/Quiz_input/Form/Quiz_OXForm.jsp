<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Quiz_OXForm.jsp --%>

<html>
	<head>
		<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
		function writeSave(){
		
			if($("#OX_subject").val()==''){
				alert("항목 제목을 입력 하시오");
				$("#OX_subject").focus();
				return false;
			}//if subeject
			
			if($("#OX_content").val()==''){
				alert("항목 제목을 입력 하시오");
				$("#OX_content").focus();
				return false;
			}//if subeject
			
			return true;
			
		}//writeSave()
		</script>
	</head>
	
	<body>
		<%-- <form name="Quiz_OXForm" method="post" onsubmit="return Quiz_OXForm">--%>
			<table align="center">
			<tr>
				<td><b>항목 제목</b></td>
				<td>
					<input type="text" name="q_subject" id="OX_subject" size="40" value=" O X 문제">
				</td>	
			</tr>
			
			<tr>
				<td><b>항목 설명</b></td>
				<td>
					<input type="text" name="q_content" id="OX_content" size="40" value="항목에 대한 자세한 설명을 입력하시오">
					<input type="file" name="q_content_img" id="file">
				</td>
			</tr>
			
		
			<tr>
				<td colspan="2" align="center">
					<img src="../../Image/O_Image.jpg" width="200" height="200">
					&nbsp;&nbsp;
					<img src="../../Image/X_Image.jpg" width="200" height="200">
				</td>
			</tr>
			</table>
			<input type="hidden" name="400" value="400">
		<%-- </form>--%>
	
	</body>
</html>