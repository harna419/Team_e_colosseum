<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
	import="Member.*"
    %>

<%
request.setCharacterEncoding("utf-8");
String q_id="123";
//String q_id=(String)session.getAttribute("q_id");
MemberDao dao=MemberDao.getInstance();//dao 객체얻기
MemberDto dto=dao.getMember(q_id);//dao 메서드 호출
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage</title>
<style type="text/css">
* { margin:100; padding:0;}
ul,li { list-style:none;  width:37%;}
a { text-decoration:none; color:#000; }
.tab { border:1px solid #ddd; border-left:none; background:#fff; overflow:hidden;}
.tab li { float:left; width:33.3%; border-left:1px solid #ddd; text-align:center; box-sizing:border-box; }
.tab li { display:inline-block; padding:10px; cursor:pointer; }
.tab li.on { background-color:#eee; color:#A50000; }
.tab_con { clear:both; margin-top:5px; border:1px solid #ddd;  width:37%;}
.tab_con div { display:none; height:600px; background:#fff; line-height:50px; text-align:left;}
th { background-color: #eee; display: table-cell; vertical-align: inherit; }

</style>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
$(function () {	
	tab('#tab',0);	
	$('#modify').css('width',700);
});

function tab(e, num){
    var num = num || 0;
    var menu = $(e).children();
    var con = $(e+'_con').children();
    var select = $(menu).eq(num);
    var i = num;

    select.addClass('on');
    con.eq(num).show();

    menu.click(function(){
        if(select!==null){
            select.removeClass("on");
            con.eq(i).hide();
        }

        select = $(this);	
        i = $(this).index();

        select.addClass('on');
        con.eq(i).show();
    });
}

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
<ul class="tab" id="tab">
    <li>정보수정</li>
    <li>B</li>
    <li>C</li>	
</ul>

<div class="tab_con" id="tab_con">
    <div><form method="post" name="userForm" action="ModifyProc.jsp" onSubmit="return checkIt()">
	<strong style="font-size:15px;">내 정보 조회 및 수정</strong>
	<table id="modify" border=1 cellspacing=0 cellpadding=3 align=center style="line-height:3; border:1px solid #aaa; border-collapse:collapse;">
		<tr>
			<th>사용자ID</th>
			<td><%=dto.getQ_id() %></td>
		</tr>
		
		<tr>
			<th>닉네임</th>
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
			<th>비밀번호</th>
			<td>
				입력 : <input type="password" id="q_pwd" name="q_pwd" size="10"> 확인입력 : <input type="password" id="q_pwd2" name="q_pwd2" size="10"> 
			</td>
		</tr>
		
		<tr>
			<th>사용자 이름</th>
			<td>
				<input type="text" name="q_name" size="15" value="<%=dto.getQ_name() %>">
			</td>
		</tr>
		
		<tr>
			<th>주민등록번호</th>
			<td>
				<%=dto.getQ_jumin1() %>-<%=dto.getQ_jumin2() %>
			</td>
		</tr>
		<!-- 비밀번호 찾기 질문 -->
		<tr>
			<th width=200>비밀번호 퀴즈</th>
			
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
			<th width=200>비밀번호 퀴즈 답</th>
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
			<th width=200>주소</th>
			<td width=400>
			<%
			im=dto.getQ_sex();
			if(im==null){
				im="";
			}
			%>
				<input type="radio" id="q_sex" name="q_sex" value="<%=im%>">남자
				<input type="radio" id="q_sex" name="q_sex" value="<%=im%>">여자
			</td>
		</tr>
	
		
		<tr>
			<td colspan=2 align=center>
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="javascript:location='../Main_template.jsp'">
			</td>
		</tr>

	</table>
	<br>
	<span><input type="button" value="비밀번호 변경" onclick=""></span>
	</form></div>	
    <div>2nd Contents</div>
    <div>3rd Contents</div>
</div>

</body>
</html>