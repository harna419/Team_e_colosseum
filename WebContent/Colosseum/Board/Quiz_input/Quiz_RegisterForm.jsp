<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	%>
<%
request.setCharacterEncoding("utf-8");
%>

<html>
	<head>
		<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="single_add.js"></script>
		<script type="text/javascript" src="multi_add.js"></script>
		<script type="text/javascript">
		totalCnt=0;//문제 개수
		
		function add(){
			
			m=document.Quiz_RegisterForm.quiz.options.selectedIndex;//선택된 인덱스 번호			
			m2=document.Quiz_RegisterForm.quiz.options[m].value;//선택된 인덱스의 value 값
			
			totalCnt++;//문제 추가
			
			document.Quiz_RegisterForm.count.value=totalCnt;

			//alert(m2);
			
			if(m2=="100"){//주관식
						
				$("<table align='center' id='"+totalCnt+"'>"
				+"<tr><td>항목 제목</td>"+
				"<td><input type='text' name='q_subject"+totalCnt+"' id='Word_subject"+totalCnt+"' size='40' value=''></td>"
				+"</tr>"
				+"<tr><td>항목 설명</td>"
				+"<td><input type='text' name='q_content"+totalCnt+"' id='Word_content"+totalCnt+"' size='40' value=''></td>"
				+"<td><input type='file' name='q_content_img"+totalCnt+"' id='Word_file"+totalCnt+"'></td>"
				+"</tr>"
				+"<tr><td>답변</td><td><input type='text' name='q_real_reply"+totalCnt+"1' size='40 value=''></td>"
				+"</tr>"
				+"</table>"
				+"<input type='hidden' name='q_quiz_type"+totalCnt+"' value='100'>'").appendTo("#Quiz_RegisterForm");
				
				$("<hr size='1' color='blue'>").appendTo("#Quiz_RegisterForm");
				

			}else if(m2=="200"){//객관식단일
			
				$("<table align='center' id='single"+totalCnt+"'>"
				+"<tr><td>항목 제목</td>"
				+"<td><input type='text' name='q_subject"+totalCnt+"' id='Single_subject"+totalCnt+"' size='40' value=''></td>"
				+"</tr>"
				+"<tr><td>항목 설명</td>"
				+"<td><input type='text' name='q_content"+totalCnt+"' id='Single_content"+totalCnt+"' size='40' value=''></td>"
				+"<td><input type='file' name='q_content_img"+totalCnt+"' id='Single_file"+totalCnt+"'></td>"
				+"</tr>"
				+"<tr><td align='center'>답   변</td>"
				+"<td><input type='radio' name='q_real_reply"+totalCnt+"1' id='Single_option1' value='1'>"
				+"<input type='text' name='q_reply"+totalCnt+"1'></td>"
				+"<td><input type='file' name='q_reply"+totalCnt+"_img1' id='Single_file1'></td>"
				+"<td><input type='button' name='Single_add' id='Single_add' onclick='single_add"+totalCnt+"()' value='항목추가'></td>"
				+"</tr><input type='hidden' name='q_quiz_type"+totalCnt+"' value='200'>"
				+"</table>'").appendTo("#Quiz_RegisterForm");
				
				$("<hr size='1' color='blue'>").appendTo("#Quiz_RegisterForm");
			/*
				$("input Single_option"+totalCnt).attr("q_reply"+totalCnt+"1'",val());
				
				if($("input:checked + #Single_option1").val()==1){
					$("input:checked + #Single_option1").val("O")
					$("input:not(:checked) + #Single_option1").val("")
					
				}else if($("input:checked + #Single_option1").val()==2){
					$("input:checked + #Single_option1").val("O")
					$("input:not(:checked) + #Single_option1").val("")
					
				}else if($("input:checked + #Single_option1").val()==3){
					$("input:checked + #Single_option1").val("O")
					$("input:not(:checked) + #Single_option1").val("")
					
				}else if($("input:checked + #Single_option1").val()==4){
					$("input:checked + #Single_option1").val("O")
					$("input:not(:checked) + #Single_option1").val("")
				}
				*/
				
				
			}else if(m2=="300"){//객관식복수
				//alert("300");
				//$("<table align='center' id='multi"+a+"'><tr><td>항목 제목</td><td><input type='text' name='q_subject' id='Multi_subject' size='40' value=''></td></tr><tr><td>항목 설명</td><td><input type='text' name='q_content' id='Multi_content' size='40' value=''></td><td><input type='file' name='q_content_img' id='Multi_file'></td></tr><tr><td align='center'>답   변</td><td><input type='checkbox' name='Multi_option' id='Multi_option1'><input type='text' name='q_reply1' value=''></td><td><input type='file' name='q_reply1_img' id='Multi_file1'></td><td><input type='button' name='Multi_add' id='Multi_add' value='옵션추가'></td></tr></table><input type='hidden' name='300' value='300'>'").appendTo("#Quiz_RegisterForm");
				$("<table align='center' id='multi"+a+"'>"
				+"<tr><td>항목 제목</td>"
				+"<td><input type='text' name='q_subject"+a+"' id='Word_subject"+a+"' size='40' value=''></td>"
				+"</tr>"
				+"<tr><td>항목 설명</td>"
				+"<td><input type='text' name='q_content"+a+"' id='Single_content"+a+"' size='40' value=''></td>"
				+"<td><input type='file' name='q_content_img"+a+"' id='Single_file"+a+"'></td>"
				+"</tr>"
				+"<tr><td align='center'>답   변</td>"
				+"<td><input type='checkbox' name='Multi_option"+a+"' id='Multi_option1'>"
				+"<input type='text' name='q_reply1' value=''></td>"
				+"<td><input type='file' name='q_reply1_img' id='Multi_file1'></td>"
				+"<td><input type='button' name='Multi_add' id='Multi_add' onclick='multi_add"+a+"()' value='옵션추가'></td>"
				+"</tr>"
				+"<input type='hidden' id='ccc' name='300' value='300'>"
				+"</table>").appendTo("#Quiz_RegisterForm")
				
				$("<hr size='1' color='blue'>").appendTo("#Quiz_RegisterForm")
			}else if(m2=="400"){//OX 문제
				//alert("400");
				$("<form method='post' name='Quiz_OXForm"+a+"' id='Quiz_OXForm"+a+"' action='Quiz_RegisterProc.jsp'><div id='"+a+"' enctype='multipart/form-data'></div></form>").appendTo("body").load('Quiz_OXForm.jsp');
				$("<hr size='1' color='blue'>").appendTo("body")
			}else if(m2=="500"){//표형 문제
				//alert("500");
				$("<form method='post' name='Quiz_TableForm"+a+"' id='Quiz_TableForm"+a+"' action='Quiz_RegisterProc.jsp'><div id='"+a+"' enctype='multipart/form-data'></div></form>").appendTo("body").load('Quiz_TableForm.jsp');
				$("<hr size='1' color='blue'>").appendTo("body")
				
			}//else if
		}//function add() end
		
		
		</script>
		
	</head>
	<body id="body">
	<form name="Quiz_RegisterForm" id="Quiz_RegisterForm" method="post" action="Quiz_RegisterProc.jsp" enctype="multipart/form-data">
		<table align="center">
		<tr>
			<td><input type="text" name="q_title" id="subject" value="제목입력폼" size=50></td>
			<td><input type="file" name="q_title_img" id="file" value="첨부버튼"></td>
		</tr>
		</table>
		<table align="center" id="quizform">
		<tr>
			<td>
				<select name="quiz" id="quiz">
				<option value="100" selected>주관식</option>
				<option value="200">객관식단일</option>
				<option value="300">객관식복수</option>
				<option value="400">OX 문제</option>
				<option value="500">표형 문제</option>
				</select>
			</td>
			<!-- <td><input type='button' name='Single_add' id='Single_add' value='옵션추가'></td> -->
		
		</table>
		
		<center>
			<input type="submit" value="저장">
			<input type="button" onclick="add()" value="추가">
			<input type="reset" value="취소">
			<input type="button" name="check" id="check" value="개수구하기">
			<input type="text" name="count" value="0">
		</center>
		

		
			
	</form>
	</body>
	
	
</html>
	
	