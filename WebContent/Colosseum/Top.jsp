<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String q_id="admin";
String q_name="관리자";
String q_user_num="01";
String q_nickname="관리자";

session.setAttribute("q_id", q_id);
session.setAttribute("q_name", q_name);
session.setAttribute("q_user_num", q_user_num);
session.setAttribute("q_nickname", q_nickname);

%>
<form action="" method="post" name="form">
<center>
<input type="text" name="id" align="right" placeholder="id 입력 하는 곳">&nbsp;&nbsp;&nbsp;
<input type="text" name="id" align="right" placeholder="pwd 입력 하는 곳">
</center>
</form>