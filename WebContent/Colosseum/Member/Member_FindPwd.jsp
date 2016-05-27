<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
    %>
    
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function checkIt(){
	if($('#q_id').val()==''){
		alert("아이디를 입력 해주세요");
		$('#q_id').focus();
		return false;
	}
	if($('#q_name').val()==''){
		alert("이름을 입력 해주세요");
		$('#q_name').focus();
		return false;
	}
	if($('#q_jumin1').val()==''){
		alert("주민 번호를 입력 해주세요");
		$('#q_jumin1').val('').focus();
		return false;
	}
	if($('#q_jumin2').val()==''){
		alert("주민번호 뒷자리를 입력 해주세요");
		$('#q_jumin2').val('').focus();
		return false;
	}
}
</script>
</head>
<body>
	<div>
		<form name="pwdCheck" action="PwdQuestion.jsp" method="post" onsubmit="return checkIt()">
		<table align="center">
			<tr>
			<td>ID :</td> <td><input type="text" name="q_id" id="q_id" placeholder="아이디를 입력 해주세요"></td>
			</tr>
			<tr>
			<td>NAME :</td> <td><input type="text" name="q_name" id="q_name" placeholder="이름을 입력 해주세요"></td>
			</tr>
			<tr>
			<td>BIRTH :</td> <td><input type="text" name="q_jumin1" id="q_jumin1" placeholder="주민번호 앞자리">-
			<input type="password" name="q_jumin2" id="q_jumin2" placeholder="주민번호 뒷자리"></td>
			</tr>
			<br><br>
			<tr>
			<td colspan=2 align="center">
			<input type="submit" value="확인">
			<a href="javascript:this.close()"><input type="button" value="닫기"></a>
			</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>