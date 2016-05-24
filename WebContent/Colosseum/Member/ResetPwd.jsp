<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
    %>
    
<%
request.setCharacterEncoding("utf-8");
String q_pw_reply=request.getParameter("q_pw_reply");
String q_id=request.getParameter("q_id");
MemberDao dao=MemberDao.getInstance();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function check(){
	if($('#q_pwd').val()!=$('#q_pwd2').val()){
		alert("비밀번호 확인이 일치하지 않습니다");
		$('#q_pwd2').val('').focus();
		return false;
	}
}
</script>
</head>
<body>
<div align="center">
<form name="resetPwd" action="ResetPwdProc.jsp" method="post" onsubmit="return check()">
	<div><p>변경 할 비밀번호 : <input type="password" name="q_pwd" id="q_pwd"></p></div>
	<div><p>비밀번호 확인 : <input type="password" name="q_pwd2" id="q_pwd2"></p></div>
	<input type="hidden" value="<%=q_id %>" name="q_id">
	<div><input type="submit" value="확인">&nbsp;&nbsp;<a href="javascript:this.close()"><input type="button" value="닫기"></a></div>
</form>
</div>
</body>
</html>