<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"%>

<%
request.setCharacterEncoding("utf-8");
 
String q_id=(String)session.getAttribute("q_id");
MemberDao dao=MemberDao.getInstance();//dao 객체얻기
MemberDto dto=dao.getMember(q_id);//dao 메서드 호출
%> 
<html>
	<head>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	function checkIt(){
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
		
		if($('#q_pwd').val()!=('#q_pwd2').val()){
			alert("암호가 일치하지 않습니다");
			$('#q_pwd').val('').focus();
			return false;
		}
	}//checkIt() end 
	</script>
	</head>
	<body>
	<form method="post" name="userForm" action="ModifyPro.jsp" onSubmit="return checkIt()">
	<table width="600" border=1 cellspacing=0 cellpadding=3 align=center>
		<tr>
			<td colspan="2" height="39" align=center>
			<h2><b><br>회원정보수정</b></h2>
			</td>
		</tr>
		
		<tr>
			<td colspan=2 align=center>
			회원정보를 수정합니다
			</td>
		</tr>
		
		<tr>
			<td>사용자ID</td>
			<td><%=dto.getQ_id() %></td>
		</tr>
		
		<tr>
			<td>닉네임</td>
			<td width=400>
			<%
			String im=dto.getQ_nickname();
			if(im==null){
				im="";
			}
			%>
				<input type="text" name="q_nickname" value="<%=im %>">
		
			</td>
		</tr>
		
		
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="q_pwd" size="10">
			</td>
		</tr>
		
		<tr>
			<td>비밀번호 확인</td>
			<td>
				<input type="password" name="q_pwd2" size="10">
			</td>
		</tr>
		
		<tr>
			<td width=200><b>개인정보 입력</b></td>
			<td width=400>&nbsp;</td>
		</tr>
		
		<tr>
			<td>사용자 이름</td>
			<td>
				<input type="text" name="q_name" size="15" value="<%=dto.getQ_name() %>">
			</td>
		</tr>
		
		<tr>
			<td>주민등록번호</td>
			<td>
				<%=dto.getQ_jumin1() %>-<%=dto.getQ_jumin2() %>
			</td>
		</tr>
		<!-- 비밀번호 찾기 질문 -->
		<tr>
			<td width=200>비밀번호 퀴즈</td>
			
			<td width=400>
			<%
			im=dto.getQ_pw_question();
			if(im==null){
				im="";
			}
			%>
				<input type="text" name="q_pw_question" value="<%=im %>">
			</td>
		</tr>
		
		<!-- 비밀번호 퀴즈 답 -->
		<tr>
			<td width=200>비밀번호 퀴즈 답</td>
			<td width=400>
			<%
			im=dto.getQ_pw_reply();
			if(im==null){
				im="";
			}	
			
			%>
				<input type="text" name="q_pw_reply" value="<%=im %>">	
			</td>
		</tr>
		
		
		<!-- 성별 -->
		
		<tr>
			<td width=200>주소</td>
			<td width=400>
			<%
			im=dto.getQ_sex();
			if(im==null){
				im="";
			}
			%>
				<input type="radio" id="q_sex" name="q_sex" value="<%=im%>">남자 &nbsp;&nbsp;&nbsp;
				<input type="radio" id="q_sex" name="q_sex" value="<%=im%>">여자
			</td>
		</tr>
	
		
		<tr>
			<td colspan=2 align=center>
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="javascript:location='Main_template.jsp'">
			</td>
		</tr>

	</table>
	</form>
	</body>
	
</html>