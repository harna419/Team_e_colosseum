<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	function begin(){
		$('#q_pwd').focus();// 페이지 실행과 동시에 포커스 설정
	}
	function checkIt(){
		if($('#q_pwd').val()==''){
			alert("패스워드를 입력하시오");
			$('#q_pwd').val('').focus();
			return false;
		}
	}//checkIt() end
</script>
</head>

<body onLoad="begin()">
	<form method="post" name="delForm" action="DeletePro.jsp" onSubmit="return checkIt()">
	
	<table cellspacing=0 cellpadding=3 width=260 border=1 align=center>
	<tr height=30>
		<td colpsan=2 valign=middle>
			<font size="+2"><b>회원탈퇴</b></font>
		</td>
	</tr>
	
	<tr height=30>
		<td width=110 align=center>
		비밀번호
		</td>
		<td width=150>
			<input type="password" name="q_pwd" id="q_pwd" size=15>
		</td>
	</tr>
	
	<tr height=30>
		<td colspan=2 align="center" valign="middle">
			<input type="submit" value="회원탈퇴">
			<input type="button" value="취소" onclick="javascript:window.location='Main_template.jsp'">
		</td>
	</tr>
	</table>
</body>
</html>