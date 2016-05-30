<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Message.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
  String[] selects = request.getParameterValues("select");
 	MessageDao dao=MessageDao.getInstance();
 	
  int checklen = selects.length;
  
  try {
   for(int i=0; i<checklen; i++) {
	   int q_num=Integer.parseInt(selects[i]);
	 	dao.deleteMessage(q_num);
   }
  }
  catch(Exception ex) {
   out.println("exception occured");
  }
 %>
</body>
</html>