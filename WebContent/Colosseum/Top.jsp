<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Member.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MemberDao dao=MemberDao.getInstance();
%>
<%
String q_id="admin";
String q_pwd="admin";


dao.userCheck(q_id,q_pwd);

MemberDto dto=new MemberDto();

String q_name=dto.getQ_name();
String q_nickname=dto.getQ_nickname();


session.setAttribute("q_id", q_id);
session.setAttribute("q_name", q_name);
session.setAttribute("q_nickname", q_nickname);

%>

<form action="" method="post" name="form">
	<center>
		<input type="hidden" name="id" align="right" placeholder="id 입력 하는 곳">&nbsp;&nbsp;&nbsp;
		<input type="hidden" name="id" align="right" placeholder="pwd 입력 하는 곳">
	</center>
</form>