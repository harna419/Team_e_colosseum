<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
  <head>
    <head>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
    $(function(){
    	multiCnt=1;
    	$("#Multi_add").on("click",function(){
    		 multiCnt++;
			 $("<tr><td></td><td><input type='checkbox' name='Multi_option' id='Multi_option"+multiCnt+"'><input type='text' name='q_reply"+multiCnt+"' value='복수 선택형 옵션"+multiCnt+"'></td>"+
			 "<td><input type='file' name='q_reply"+multiCnt+"_img' id='Multi_file"+multiCnt+"'></td></tr>").appendTo("#multi");		 
    	});
    });
    </script>
  </head>
  <body>
    <%-- <form method="post" name="Quiz_MultiForm" id="Quiz_MultiForm">--%>
      <table align="center" id="multi">
        <tr>
          <td>항목 제목</td>
          <td><input type="text" name="q_subject" id="Multi_subject" size="40" value="복수 선택형"></td>
        </tr>
        
        <tr>
          <td>항목 설명</td>
          <td><input type="text" name="q_content" id="Multi_content" size="40" value="항목에 대한 자세한 설명을 입력하시오"></td>
          <td><input type="file" name="q_content_img" id="Multi_file"></td>
        </tr>
        
        <tr>
          <td align="center">답   변</td>
          <td>
            <input type="checkbox" name="Multi_option" id="Multi_option1">
            <input type="text" name="q_reply1" value="복수 선택형 옵션1">
          </td>
          <td><input type="file" name="q_reply1_img" id="Multi_file1"></td>
          <td><input type="button" name="Multi_add" id="Multi_add" value="옵션추가"></td>
        </tr>        
        
      </table>
      <input type="hidden" name="300" value="300">
    <%-- </form>--%>
  </body>
</html>    
