<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Member.*"%>
    
    <html>
    <head>
    
    </head>
<%
request.setCharacterEncoding("utf-8");
String q_id=request.getParameter("id");
String pwd=request.getParameter("pwd");
System.out.println("로그인id:"+q_id);
System.out.println("로그인pwd:"+pwd);
int count=0;

MemberDao dao=MemberDao.getInstance();//dao 객체얻기
int check=dao.userCheck(q_id, pwd);//da메서드 호출
if(check==1){//로그인 정상
	//session.setAttribute("q_id", q_id);
    response.sendRedirect("Main_template.jsp?q_id="+q_id);
    
}else if(check==0){	
	count++;
	if(count<3){
%>
<script>
  alert("비밀번호가 틀립니다");
  history.back();
</script>
<%	
	}else if(count>=3){
		%>
		<script>
		alert("비밀번호 3회 틀림");
		</script>
		<%
		return;
	}//else if
}else{
%>
<script>
  alert("아이디가 없습니다");
  history.back();
</script>
<%	
}//else
%>

</html>