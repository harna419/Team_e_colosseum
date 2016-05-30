<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script type="text/javascript">
function login(){
	alert("로그인")
	if($("#id").val()==""){
		alert("ID를 입력해주세요");
		$('#id').val('').focus();
		return false;
	}
	if($("#pwd").val()==""){
		alert("비밀번호를 입력해주세요");
		$('#pwd').val('').focus();
		return false;
	}
	var id=document.loginForm.id.value;
	var pwd=document.loginForm.pwd.value;
	movePageUrl("login.jsp?id="+id+"&pwd="+pwd ,$('#main').css("backgroundColor"), "#3D68A6");
}

function logout(){
	alert('로그아웃')
	movePageUrl("logout.jsp",$('#main').css("backgroundColor"), "#3D68A6");
}
</script>
</head>
<body>

<%
String q_id=(String)session.getAttribute("q_id");
//String q_id=null;
if(q_id==null || q_id.equals("") || q_id.length()<=0){
	%>
	<h1>로그인하시겠어요?</h1>
	<form name="loginForm" id="loginForm">
	  <input type="text" name="id" id="id" value=""><br>
	  <input type="password" name="pwd" id="pwd" value=""><br>
	  <input type="button" onclick="login()" value="로그인">
	  <input type="button" value="회원가입">
	</form>
	<%
}else{
	%>
	<h1>로그아웃하시겠어요?</h1>
	<button onclick="logout()">네</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button>아니오</button>
	<%
}
%>
</body>
</html>