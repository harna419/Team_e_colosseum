<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%--AdminLogin.jsp--%>
<html>
	<head>
		<title>Login</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>--%>
		<script type="text/javascript">
		function findPwd(){
			 
			 url="FindPwd.jsp?check=y";
			 window.open(url,"FindPwd","width=500,height=300,status=yes,scrollbars=yes");
		}//zipCheck() end 

		function findId(){
			
			url="FindId.jsp?check=y";
			window.open(url,"FindId","width=500,height=300,status=yes,scrollbars=yes");
		}
		</script>
	</head>
	<body topmargin="20">
	
		<form method="post" action="LoginProc.jsp">
		<table width="50%" align="center">
		  <tr>
		  	<td width="47%" align="center">ID</td>
		  	<td width="53%"><input type="text" name="q_id" id="q_id"></td>
		  </tr>
		  
		  <tr>
		  	<td width="47%" align="center">PWD</td>
		  	<td width="53%"><input type="password" name="q_pwd" id="q_pwd"></td>
		  </tr>
		  
		  <tr>
		  <td colspan="2" align="center">
	  		<input type="submit" value="로그인">&nbsp;&nbsp;
	  		<input type="button" value="아이디찾기" onclick="findId()">
		 	<input type="button" value="비밀번호찾기" onclick="findPwd()">
		  </td>
		  </tr>
		</table>
		</form>
	</body>
</html>
    