<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
  <head>
  
  </head>  
  <body>
  
  <h2><center>쪽지함</center></h2>
  <table>
  <tr align="right">
    <td><input type="button" value="쪽지쓰기"></td>
  </tr>  
  </table>
  <form method="post" name="Msg_ViewForm" id="Msg_ViewForm">    
    <table align="center">      
      <tr>
        <td><input type="checkbox" name="Msg_check" id="Msg_check"></td>
        <td>보낸사람</td>
        <td>내용</td>
        <td>시간</td>
      </tr>
    <%--  
      <%
      if(rs.next()){
      %>
      <tr>
        <td><input type="checkbox" name="Msg_check" id="Msg_check"></td>
        <td><%=rs.getName() %></td>
        <td><%=rs.getContent() %></td>
        <td><%=rs.getTime() %></td>
      </tr>
      <%	  
      }
      %>
      --%>
    </table>
  </form>
  </body>
</html>    
