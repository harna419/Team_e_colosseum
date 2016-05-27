<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Message.*"%>
  
<jsp:useBean id="mdto" class="Message.MessageDto"/>
  
<%
request.setCharacterEncoding("utf-8");
MessageDao mdao=MessageDao.getInstance();//dao객체얻기
String nickname_send=request.getParameter("nickname_send");
String nickname_receive=request.getParameter("nickname_receive");
String msg_content=request.getParameter("msg_content");

mdto.setQ_nickname_send(nickname_send);
mdto.setQ_nickname_receive(nickname_receive);
mdto.setQ_msg_content(msg_content);

mdao.insertMessage(mdto);
%>