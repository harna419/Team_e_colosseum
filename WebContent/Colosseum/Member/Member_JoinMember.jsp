<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>--%>

</head>
<body>

<form method="post" name="userForm" action="JoinMemberPro.jsp" onSubmit="return checkIt()">
<table width="650" border="1" cellpadding="3" cellspacing="0">
	
	<tr>
	<td colspan="2" height="30" align="center">	
	<h1><b><br>가입하기</b></h1><br>
	간단하게 가입 합시다.<br>
	이메일로 간단하게 콜로세움을 이용하세요!
	</td>
	</tr>	
	
	<tr>
	<td width="200" ><b>로그인 정보 입력</b></td>
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
		
		<input type="button"  value="가입 안함" onclick="window.location='Main_template.jsp'">
		
		
		</td>
		</tr>

	</table>

</form>
</body>
</html>