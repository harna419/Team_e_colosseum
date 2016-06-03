<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Quiz_OXForm.jsp --%>

<%
request.setCharacterEncoding("utf-8");
%>

<html>
	<head>
		<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
		
		function writeSave(){
		
			if($("#Table_subject").val()==''){
				alert("항목 제목을 입력 하시오");
				$("#Table_subject").focus();
				return false;
			}//if subeject
			
			if($("#Table_content").val()==''){
				alert("항목 제목을 입력 하시오");
				$("#Table_content").focus();
				return false;
			}//if subeject
			
			return true;
		}//writeSave()
		
		$(function(){
			rowvalue=1;//로우 값
			colvalue=2;//컬럼 값
			$td_count = $("#col td").length;
			
			<%--
			$("#rowadd").on("click",function(){
				rowvalue++;
				$("<tr align='center'><td><input type='text' name='row"+rowvalue+"' id='row"+rowvalue+"' size='10' value='로우이름"+rowvalue+"'></td><td></td>"+
				"<td><input type='radio' name='Table_row"+rowvalue+"'></td>"+
				"</tr>")
				.appendTo("#row");
			});
			--%>
			$("#rowadd").on("click",function(){
				rowvalue++;
				$("<tr align='center' id='colcount"+rowvalue+"'><td><input type='text' name='row"+rowvalue+"' id='row"+rowvalue+"' size='10' value='로우이름"+rowvalue+"'></td><td></td></tr>")
				.appendTo("#row");
			});
			
			$("#rowadd").on("click",function(){
				for(i=1;i<=colvalue;i++){
				$("<td><input type='radio' name='Table_row"+rowvalue+"'></td>")
				.appendTo("#colcount"+rowvalue);
				}
				
			});
			
			$("#coladd").on("click",function(){
				colvalue++;
				$("<td><input type='text' name='col"+colvalue+"' id='col"+colvalue+"' size='10' value='컬럼이름"+colvalue+"'></td>")
				.appendTo("#col");
			});
			
			$("#coladd").on("click",function(){
				for(i=1;i<=rowvalue;i++){
				$("<td><input type='radio' name='Table_row"+i+"'</td>")
				.appendTo("#colcount"+i);
				}
			});
			
			
			
			$("#check").on("click",function(){
				var $td_count = $("#col td").length;
				
			});
			
			
		});
		</script>
	</head>
	
	<body>
		<%-- <form name="Quiz_TableForm" method="post">--%>
			<table align="center">
			<tr>
				<td><b>항목 제목</b></td>
				<td>
					<input type="text" name="q_subject" id="Table_subject" size="40" value="표 형 문제">
				</td>
				<%--
				<td>
					 <input type="button" name="check" id="check" value="개수구하기">
				</td>
				--%>
			</tr>
			
			<tr>
				<td><b>항목 설명</b></td>
				<td>
					<input type="text" name="q_content" id="Table_content" size="40" value="항목에 대한 자세한 설명을 입력하시오">
					<input type="file" name="q_content_img" id="Table_file">
				</td>
			</tr>
			</table>
			<table align="center" id="row">
			<%--컬럼--%>
			<tr id="col">
				<td>
				</td>
				
				<td>
					<input type="button" id="coladd" value="컬럼추가">
				</td>
				
				<td>
					<input type="text" name="col1" id="col1" size="10" value="컬럼이름1">
				</td>
				
				<td>
					<input type="text" name="col2" id="col2" size="10" value="컬럼이름2">
				</td>		
			</tr>
	
			<%--로우--%>
			<tr>
				<td>
					<input type="button" id="rowadd" value="로우추가">
				</td>
			</tr>

			<tr align="center" id="colcount1">
				<td>
					<input type="text" name="row1" id="row1" size="10" value="로우이름1">
				</td>
				
				<td></td>
				
				<td>
					<input type="radio" name="Table_row1">
				</td>
				
				<td>
					<input type="radio" name="Table_row1">
				</td>
				
			</tr>	
			</table>
			<input type="hidden" name="500" value="500">
		<%-- </form>--%>					
	</body>
</html>