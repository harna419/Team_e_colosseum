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
	movePageUrl("login.jsp?id="+id+"&pwd="+pwd,$('#main').css('backgroundColor'), '#3D68A6');
}

function logout(){
	alert('로그아웃')
	movePageUrl("logout.jsp",$('#main').css("backgroundColor"), "#3D68A6");
}

function findPwd(){
	 
	 url="Member/Member_FindPwd.jsp?check=y";
	 window.open(url,"FindPwd","width=500,height=300,status=yes,scrollbars=yes");
}//zipCheck() end 

function findId(){
	
	url="Member/Member_FindId.jsp?check=y";
	window.open(url,"FindId","width=500,height=300,status=yes,scrollbars=yes");
}

</script>
<style type="text/css">
.log{
margin-left:20%;
margin-top:10%;
align:center;
color:gray;
}

</style>
</head>
<body>

<%
String q_id=(String)session.getAttribute("mem_id");
//String q_id=null;
if(q_id==null || q_id.equals("") || q_id.length()<=0){
	%>
	<div class="log">
	<h1>로그인하시겠어요?</h1>
	<form name="loginForm" id="loginForm">
	<br>
	 ID:  &nbsp;&nbsp;<input type="text" name="id" id="id" value=""><br>
	 PWD: <input type="password" name="pwd" id="pwd" value=""><br>
	  <br><br>
	  <input type="button" onclick="login()" value="로그인">
	  <input type="button" value="아이디찾기" onclick="findId()">
   	<input type="button" value="비밀번호찾기" onclick="findPwd()">

	</form>
	</div>
	<%
}else{
	%>
	<div class="log">
	<h1>로그아웃하시겠어요?</h1>
	<button onclick="logout()">네</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button>아니오</button>
	</div>
	<%
}
%>
</body>
</html>