<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int q_dep_num=Integer.parseInt(request.getParameter("q_dep_num"));
int q_dep_step=Integer.parseInt(request.getParameter("q_dep_step"));

//out.println("q_dep_num:"+q_dep_num+"q_dep_step:"+q_dep_step);

%>
<html>
  <head>
    <title>삭제하기</title>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
      function deleteSave(){
    	  //if($("#pwd").val()==""){
    		  //alert("비밀번호를 입력하시오");
    		  //$("#pwd").val('').focus();//입력한 값을 지우고, 포커스 설정
    		  //return false;
    	  //}//if
    	  alert("삭제")
      }//deleteSave()
      
      function back(){
    	  history.go(-1)
      }
    </script>
  </head>
  <body>
    <form name="delForm" method="post" action="Board/Quiz_view/Quiz_DeleteProc.jsp?q_dep_num=<%=q_dep_num%>&q_dep_step=<%=q_dep_step%>" onSubmit="return deleteSave()">
      <table border="1" align="center" cellspacing="0" cellpadding="5" width="360">
      <tr height="30">
        <td align="center">
          <b>비밀번호를 입력하시오</b>
        </td>
      </tr>
      
      <tr height="30">
        <td align="center">비밀번호:
          <input type="password" name="passwd" id="pwd" size="8">
          <input type="hidden" name="num" value="<%=q_dep_num %>">
        </td>
      </tr>
      
      <tr height="30">
        <td align="center">
          <input type="submit" value="글삭제">
          <input type="button" value="뒤로가기" onclick="back()">
        </td>
      </tr>
    </table> 
    </form>
  </body>
</html>
    