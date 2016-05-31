<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>-->

<script>
	var Id_Check=-1;
	var Nickname_Check=-1;
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
		
		if($('#pwd').val()==""){
			alert("비밀번호를 입력 해주세요");
			$('#pwd').val('').focus();
			return false;
		}
		
		if($('#pwd2').val()==""){
			alert("비밀번호를 확인 해주세요");
			$('#pwd2').val('').focus();
			return false;
		}
		
		if($('#pwd').val() != $('#pwd2').val()){
			alert("비밀번호가 확인이 일치하지 않습니다");
			$('#pwd2').val('').focus();
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
		
		if(Nickname_Check!=1){
			alert("닉네임 중복확인 해주세요");
			return false;
		}
		
		alert("가입이 완료 되었습니다");
	}//checkIt end
	
	function ConfirmID(formID){
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
					//alert(data.check); 
					
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
	
	function ConfirmNickname(formNickname){
		if($('#q_nickname').val()==''){
			alert("닉네임을 입력하세요");
			$('#q_nickname').focus();
		}else{
			//alert("닉네임 중복체크 확인");
			
			$.ajax({
				type:'POST',
				url:'./Member/Member_confirmNickname.jsp',
				data : "q_nickname="+$('#q_nickname').val(),
				dataType:'JSON',
				cache:false,
				async:true,
				success:function(data){
					//alert(data.check); 
					
					if(data.check==1){
						alert("사용중인 닉네임");
						$('#q_nickname').val('').focus();
					}else{
						alert("사용가능한 닉네임");
						Nickname_Check=1;
					}//else
						
				}//success
			});
		
		}//else
	}//ConfirmNickname
</script>
<style type="text/css">
   
.container{
	position: absolute;
	width: 100%;
	height: 100%;
}
.contentWrap{
	
	position: absolute;
	width: 80%;
	height: 100%;
	left: 6.5%;		
}
.contentWrap h3{
	font-weight: bold;    
    font-size: 20px; 
    font-family: "museo-sans",sans-serif;
    color: #fff;   
    letter-spacing: 0;
}
.contentWrap h3.title {
	position: absolute;
	top: 6.5%;	
	width: 100%;
	height: 26px;
	padding: 0;    
    line-height: 18px;
    border-bottom: 3px solid #fff;
}
.board{

	position: absolute;
	top: 15%;	
	width: 100%;
}

td{
	font-family: '맑은 고딕';
	color: #fff;
	font-size: 15px;
	font-weight: bold;
    letter-spacing: 1px;
}
input{
	border: 0;
	font-size: 13px;
    margin-bottom: 20px;
    padding: 5px 10px;
}

</style>
</head>
<body>
<div class="container">
<div class="contentWrap">
	<h3 class="title"> JOIN </h3>

<form method="post" name="userForm" action="./Member/Member_JoinMemberPro.jsp" onSubmit="return checkIt()">
<table class="board" width="650" cellpadding="3" cellspacing="0">
	


	<tr>
	<td width="200"><Strong>로그인 정보 입력</Strong></td>
	<td width="400" >&nbsp;</td>
	</tr>
	
	<tr>
	<td width="200"></td>
	<td width="400">
		E-mail
		<tr>
		<td></td>
		<td>
		<input type="text" name="q_id" size="30" id="q_id">
		<input type="button" value="중복체크" onClick="ConfirmID()">
		</td></tr>
	<%--</tr>	 --%>
	
	<tr>
	<td width="200"></td>
	<td width="400">
		닉네임
		<tr>
		<td></td>
		<td>
		<input id="q_nickname" type="text" name="q_nickname" size="30">
		<input type="button" value="중복체크" onClick="ConfirmNickname()">
		</td></tr>
	<%--</tr>	 --%>
	
	<tr>
	<td width="200"></td>
	<td width="400">
		비밀번호
		<tr>
		<td></td>
		<td>
		<input id="pwd" type="password" name="q_pwd" size="30">
		</td></tr>
	<%--</tr>	 --%>	
		
	<tr>
	<td width="200"></td>
	<td width="400">
		비밀번호 확인
		<tr>
		<td></td>
		<td>
	<input id="pwd2" type="password" name="q_pwd2" size="30">
		</td></tr>
	<%--</tr>	 --%>
	
	<tr>
	<td width="200" ><strong>개인정보 입력</strong></td>
	<td width="400" >&nbsp;</td>
	</tr>
		
		
	<tr>
	<td ></td>
	<td>
	사용자 이름
	<tr>
		<td></td>
		<td>
	<input id="q_name" type="text" name="q_name" size="30">
	</td>
	</tr>

		<tr>
		<td></td>
		<td>
		주민번호
		<tr>
		<td></td>
		<td>
		<input id="q_jumin1" type="text" name="q_jumin1" size="30" onkeyup="if(this.value.length==6) userForm.q_jumin2.focus();"> -<br><br>
		<input id="q_jumin2" type="text" name="q_jumin2" size="30" onkeyup="if(this.value.length==7) userForm.q_pw_question.focus();">
		<!-- -비밀번호 찾기시 사용 됨- 유효성 체크 -->
		</td>
		</tr>
	
		<tr>
		<td width="200"><strong>비밀번호 찾기</strong></td>
		<td width="400">
		사용할 퀴즈 입력
		<tr>
		<td></td>
		<td>
		<input type="text" id="q_pw_question" name="q_pw_question" size="30">
		</td>
		</tr>
		
		<tr>
		<td width="200"></td>
		<td width="400">
		퀴즈 정답 입력
		<tr>
		<td></td>
		<td>
		<input type="text" id="q_pw_reply" name="q_pw_reply" size="30">
		</td>
		</tr>
		
		<tr>
		<td><b>성별</b></td>
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
</div><!-- contentWrap -->
</div><!-- container -->
</body>
</html>