<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> --%>
<style type="text/css">
td{
 color:#FFDC7E
}
</style>
<script>
	var Id_Check=-1;
	function checkIt(){
		
		if($("#q_id").val()==""){
			alert("ID를 입력해주세요");
			$('#q_id').val('').focus();
			return false;
		}
		
		if($('#q_nickname').val()==""){
			alert("닉네임을 입력 해주세요");
			$('#q_nickname').val('').focus();
			return false;
		}
		
		if($('#q_pwd').val()==""){
			alert("비밀번호를 입력 해주세요");
			$('#q_pwd').val('').focus();
			return false;
		}
		
		if($('#q_pwd2').val()==""){
			alert("비밀번호를 확인 해주세요");
			$('#q_pwd2').val('').focus();
			return false;
		}
		
		if($('#q_pwd').val() != $('#q_pwd2').val()){
			alert("비밀번호가 확인이 일치하지 않습니다");
			$('#q_pwd2').val('').focus();
			return false;
		}
		
		if($('#q_name').val()==""){
			alert("이름을 입력 해주세요");
			$('#q_name').val('').focus();
			return false;
		}
		
		if($('#q_jumin1').val()=="" || $('#q_jumin2').val()==""){
			alert("주민번호를 입력 해주세요");
			$('#q_jumin1').val('').focus();
			return false; 
		}
		
		if($('#q_pw_question').val()==""){
			alert("비밀번호 찾기 질문을 입력 해주세요");
			$('#q_pw_question').val('').focus();
			return false;
		}
		if($('#q_pw_reply').val()==""){
			alert("비밀번호 찾기 답변을 입력 해주세요");
			$('#q_pw_reply').val('').focus();
			return false;
		}
		
		if(Id_Check!=1){
			alert("아이디 중복 확인 해주세요");
			return false;
		}
		
		alert("가입이 완료 되었습니다");
	}//checkIt end
	
	function openConfirmID(formID){
		if($('#q_id').val()==''){
			alert("id를 입력하세요");
			$('#q_id').focus();
		}else{
			// alert("아이디 중복체크 확인");
			
			$.ajax({
				type:'POST',
				url:'./Member/Member_confirmId.jsp',
				data : "q_id="+$('#q_id').val(),
				dataType:'JSON',
				cache:false,
				async:true,
				success:function(data){
					alert(data.check); 
					
					if(data.check==1){
						alert("사용중인 ID");
						$('#q_id').val('').focus();
					}else{
						alert("사용가능한 아이디");
						Id_Check=1;
					}//else
						
				}//success
			});
		
		}//else
	}//openConfirmId
</script>
</head>
<body>

<form method="post" name="userForm" action="./Member/Member_JoinMemberPro.jsp" onSubmit="return checkIt()">
<table width="650" cellpadding="3" cellspacing="0">
	
	<tr>
	<td colspan="2" height="30" align="center">	
	<h1 style=color:#FFDC7E><b><br>가입하기</b></h1><br>
	
	<p style=color:#FFDC7E>간단하게 가입 합시다.<br>
	이메일로 간단하게 콜로세움을 이용하세요!</p>
	</td>
	</tr>	
	
	<tr>
	<td width="200"><b>로그인 정보 입력</b></td>
	<td width="400" >&nbsp;</td>
	</tr>
	
	<tr>
	<td width="200">E-mail 입력</td>
	<td width="400">
		<input type="text" name="q_id" size="10" id="q_id">
		<input type="button" value="중복체크" onClick="openConfirmID()">
	</td>
	</tr>	
	
	<tr>
	<td width="200">닉네임</td>
	<td width="400">
		<input id="q_nickname" type="text" name="q_nickname" size="15">
	</td>
	</tr>
	
	<tr>
	<td width="200">비밀번호</td>
	<td width="400">
		<input id="q_pwd" type="password" name="q_pwd" size="15">
	</td>
	</tr>	
		
	<tr>
	<td width="200">비밀번호 확인</td>
	<td width="400">
	<input id="q_pwd2" type="password" name="q_pwd2" size="15">
	</td>
	</tr>
	
	<tr>
	<td width="200" ><b>개인정보 입력</b></td>
	<td width="400" >&nbsp;</td>
	</tr>
		
		
	<tr>
	<td >사용자 이름</td>
	<td >
	<input id="q_name" type="text" name="q_name" size="15">
	</td>
	</tr>

		<tr>
		<td>주민 등록 번호<br></td>
		<td>
		<input id="q_jumin1" type="text" name="q_jumin1" size="6" onkeyup="if(this.value.length==6) userForm.jumin2.focus();">-
		<input id="q_jumin2" type="text" name="q_jumin2" size="7" onkeyup="if(this.value.length==7) userForm.qz_pw_question.focus();">
		<!-- -비밀번호 찾기시 사용 됨- 유효성 체크 -->
		</td>
		</tr>
	
		<tr>
		<td width="200">비밀번호 찾기:<br>
		 사용할 퀴즈 입력</td>
		<td width="400">
		<input type="text" id="q_pw_question" name="q_pw_question" size="40">
		</td>
		</tr>
		
		<tr>
		<td width="200">퀴즈의 답 입력하기</td>
		<td width="400">
		<input type="text" id="q_pw_reply" name="q_pw_reply" size="30">
		</td>
		</tr>
		
		<tr>
		<td>성별</td>
		<td>
		<input type="radio" id="q_sex" name="q_sex" value="M">남자 &nbsp;&nbsp;&nbsp;
		<input type="radio" id="q_sex" name="q_sex" value="W">여자
		</td>
		</tr>

		<tr>
		<td colspan="2" align="center" >
		<input type="submit" value="회원가입">
		<input type="reset" value="다시 쓰기">
		
		<input type="button"  value="가입 안함" onclick="window.location='./Main_template.jsp'">
		
		
		</td>
		</tr>

	</table>

</form>
</body>
</html>