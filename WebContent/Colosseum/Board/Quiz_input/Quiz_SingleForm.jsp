<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
  <head>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
    $(function(){
    	singleCnt=1;
    	$("#Single_add").on("click",function(){
    		singleCnt++;
			 $("<tr><td></td><td><input type='radio' name='Single_option' id='Single_option"+singleCnt+"'><input type='text' name='q_reply"+singleCnt+"' value='단일 선택형 옵션"+singleCnt+"'></td>"+
			 "<td><input type='file' name='q_reply"+singleCnt+"_img' id='Single_file"+singleCnt+"'></td></tr>").appendTo("#single");		 
    	});
    });
    </script>
  </head>
  <body>
    <%-- <form method="post" name="Quiz_SingleForm" id="Quiz_SingleForm">--%>
      <table align="center" id="single">
        <tr>
          <td>항목 제목</td>
          <td><input type="text" name="q_subject" id="Single_subject" size="40" value="단일 선택형"></td>
        </tr>
        
        <tr>
          <td>항목 설명</td>
          <td><input type="text" name="q_content" id="Single_content" size="40" value="항목에 대한 자세한 설명을 입력하시오"></td>
          <td><input type="file" name="q_content_img" id="Single_file"></td>
        </tr>
        
        <tr>
          <td align="center">답   변</td>
          <td>
            <input type="radio" name="Single_option" id="Single_option1">
            <input type="text" name="q_reply1" value="단일 선택형 옵션1">
          </td>
          <td><input type="file" name="q_reply1_img" id="Single_file1"></td>
          <td><input type="button" name="Single_add" id="Single_add" value="옵션추가"></td>          
        </tr>
        <input type="hidden" id="bbb"name="200">
      </table>
    <%-- </form>--%>
  </body>
</html>    
