<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
    %>
loginPro.jsp
<%
request.setCharacterEncoding("utf-8");

String q_id=request.getParameter("q_id");
String q_pwd=request.getParameter("q_pwd");
 
MemberDao dao=MemberDao.getInstance();//dao 객체얻기
int check=dao.userCheck(q_id, q_pwd);//dao 메서드 호출
 
if(check==1){//로그인 정상
	session.setAttribute("q_id",q_id);
	response.sendRedirect("Main_template.jsp");
}else if(check==0){
	%>
	<script>
	alert("비밀번호가 다릅니다");
	history.back();
	</script>
	<%
}else{%>
	<script>
	alert("아이디가 맞지 않습니다");
	history.back();
	</script>	
	<%
}//else end
%>