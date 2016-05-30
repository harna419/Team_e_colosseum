<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
    %>
       
    <%
    request.setCharacterEncoding("utf-8");
    String q_id=request.getParameter("q_id");
    String q_name=request.getParameter("q_name");
    int q_jumin1=Integer.parseInt(request.getParameter("q_jumin1"));
    int q_jumin2=Integer.parseInt(request.getParameter("q_jumin2")); 
    MemberDao dao=MemberDao.getInstance();
    int check = dao.pwdFind(q_id, q_name, q_jumin1, q_jumin2);
	MemberDto dto=new MemberDto();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> --%>
<script type="text/javascript">
function check(){
	if($('#q_pw_reply').val()==''){
		alert("비밀번호 확인 답을 입력 해주세요");
		$('#q_pw_reply').val('').focus();
		return false;
	}
	if($('#q_pw_reply').val()!==$('#q_pw_reply2').val()){
		alert("비밀번호 답이 일치하지 않습니다");
		return false;
	}
}
</script>

<style type="text/css">
#question{font-size:18px;}
</style>
</head>
<body>
<%if(check==1){

	dto=dao.pwdQuestion(q_id);
	String q_pw_question=dto.getQ_pw_question();
	String q_pw_reply2=dto.getQ_pw_reply();
%>
<div> 
<form name="pwdQuestion" action="ResetPwd.jsp" method="post" onsubmit="return check()">
<div align="center">
	<div><p id="question"><%=q_pw_question %></p></div><br>
	<div><p> 답 : <input type="text" name="q_pw_reply" id="q_pw_reply"></p></div>
	<br><br>
	<div><input type="submit" value="확인"><a href="javascript:this.close()"><input type="button" value="닫기"></a></div>
</div>
<input type="hidden" name="q_id" value="<%=q_id%>">
<input type="hidden" name="q_pw_reply2" id="q_pw_reply2" value="<%=q_pw_reply2%>">
</form>
	
</div>
<%}else{%>
<script>
alert("일치하는 정보가 없습니다");
history.back();
</script>

<%}%>
</body>
</html>