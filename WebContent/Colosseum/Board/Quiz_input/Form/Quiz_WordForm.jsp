<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

</head>
  <body>
    <%-- <form method='post' name='Quiz_WordForm"+a+"' id='Quiz_WordForm"+a+"'>--%>
      <table align="center">
        
        <tr>
          <td>항목 제목</td>
          <td><input type="text" name="q_subject" id="Word_subject" size="40" value="주관식 제목 입력 폼"></td>          
        </tr>
        
        <tr>
          <td>항목 설명</td>
          <td><input type="text" name="q_content" id="Word_content" size="40" value="항목에 대한 자세한 설명을 입력하시오"></td>
          <td><input type="file" name="q_content_img" id="Word_file"></td>
        </tr>
        
        <tr>
          <td>답변</td>
          <td><input type="text" name="q_real_reply1" id="Word_answer" size="40" value="답변을 입력하시오"></td>          
        </tr>
      </table>
      <input type="hidden" id="aaa" name="100">
    <%-- </form>--%>
  </body>
</html>