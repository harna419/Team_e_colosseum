<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
    import="java.util.*"
    %>
<% 
request.setCharacterEncoding("utf-8");
String q_name=request.getParameter("q_name");
int q_jumin1=Integer.parseInt(request.getParameter("q_jumin1"));
int q_jumin2=Integer.parseInt(request.getParameter("q_jumin2"));
MemberDao dao=MemberDao.getInstance();
String q_id = dao.showId(q_name, q_jumin1, q_jumin2);
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<div>
	<%if(q_id==null || q_id==""){%>
	<script>
	alert("존재하지 않는 정보입니다");
	history.back();
	</script>
	<%	}else{%>
	<div align="center"><p><%=q_name%> 회원님의 아이디는:<br><%=q_id %>입니다</p></div>
	<%}%>
	
	<div align="center"><a href="javascript:this.close()"><input type="button" value="닫기"></a></div>
</div>

</body>
</html>