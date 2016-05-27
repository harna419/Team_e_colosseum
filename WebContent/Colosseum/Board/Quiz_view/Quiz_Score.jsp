<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="quiz_colosseum.*" 
    import="java.util.*" 
    import="java.text.*"
%>

<%
request.setCharacterEncoding("UTF-8");
%>

<html>
	<head>
		<link href="style.css" rel="stylesheet" type="text/css">
		<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> --%>
		<script type="text/javascript" src="script.js">
		</script>
	</head>
	<body>
		<form>
			<table border="1">
			<tr>
				<td align="center"><img src="" width="100" height="100"></td>
				<td>I  D : <input type="text" name="id" id="id" value="임시아이디"><br>
					닉네임 : <input type="text" name="닉네임" id="닉네임" value="임시닉네임">
				</td>
			</tr>
			<tr>
				<td>등록한 게임
					<select>
							<option>-----선택하세요-----</option>
							<option value="sss">sss</option>			
							<option value="ddd">ddd</option>
							<option value="fff">fff</option>
					</select>
				</td>
				<td>
				상세보기
				</td>
			</tr>
			<tr>
				<td>즐겨찾기
					<select>
							<option>-----선택하세요-----</option>
							<option value="sss">sss</option>			
							<option value="ddd">ddd</option>
							<option value="fff">fff</option>
					</select>
				</td>
				<td>
				상세보기
				</td>
			</tr>
			<tr>
				<td>최근 게임
					<select>
							<option>-----선택하세요-----</option>
							<option value="sss">sss</option>			
							<option value="ddd">ddd</option>
							<option value="fff">fff</option>
					</select>
				</td>
				<td>
				상세보기
				</td>
			</tr>
			<tr>
				<td colspan="2">
					play 한  game 개수 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					 정답률 
				</td>
			</tr>
			
			
			</table>	
		</form>
	
	</body>
</html>




