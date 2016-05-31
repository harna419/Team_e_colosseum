<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
	import="Member.*"
	import="Message.*"
	import="quiz_colosseum.*"
	import="java.text.SimpleDateFormat"
	import="java.util.Calendar"
    %>
 
<%
request.setCharacterEncoding("utf-8");
 
String q_id=(String)session.getAttribute("mem_id");
//String q_id="admin@admin.com";
MemberDao dao=MemberDao.getInstance();//dao 객체얻기
MemberDto dto=dao.getMember(q_id);//dao 메서드 호출
Vector vec=null;
String q_nickname_receive=dto.getQ_nickname();
MessageDao dao2=MessageDao.getInstance();

vec=dao2.getMessageList(q_nickname_receive);

Quiz_ScoreMgr quizMgr=Quiz_ScoreMgr.getInstance();
Quiz_ScoreBean quizBean=quizMgr.quizScoreCount(q_id);



int yescount=quizBean.getYescount();
int nocount=quizBean.getNocount(); 
int totalgame=yescount+nocount;
double per=(double)yescount/totalgame*100;
double percentage = Double.parseDouble(String.format("%.1f",per));
String q_nickname=dto.getQ_nickname();


%> 
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage</title>
<style type="text/css">
* { margin:100; padding:0;}
ul,li { list-style:none;  width:80%; align:center;}
a { text-decoration:none; color:#000; }
.tab { border:1px solid #ddd; border-left:none; background:#fff; overflow:hidden;}
.tab li { float:left; width:33.3%; border-left:1px solid #ddd; text-align:center; box-sizing:border-box; }
.tab li { display:inline-block; padding:10px; cursor:pointer; }
.tab li.on { background-color:#eee; color:#A50000; }
.tab_con { clear:both; margin-top:5px; border:1px solid #ddd;  width:80%;}
.tab_con div { display:none; height:600px; background:#fff; line-height:50px; text-align:left;}
th { background-color: #eee; display: table-cell; vertical-align: inherit; }

</style>
<%-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>--%>
<script type="text/javascript">
$(function () {	
	tab('#tab',0);	
	//$('#modify').css('width',700);

  $("#selectAll").click(function(){
      //클릭되었으면
      if($("#selectAll").prop("checked")){
          $("input[name=select]").prop("checked",true);
          //클릭이 안되있으면
      }else{
          $("input[name=select]").prop("checked",false);
      }
  })
     
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

function MyGame(){
	 
	 url="Member/Member_Mygame.jsp?check=y";
	 window.open(url,"Mygame","width=500,height=300,status=yes,scrollbars=yes");
}

function PlayGame(){
	 
	 url="Member/Member_Playgame.jsp?check=y";
	 window.open(url,"playgame","width=500,height=300,status=yes,scrollbars=yes");
}
function Favorite(){
	url="Member/Member_Favorite_game.jsp?check=y";
	window.open(url,"Favorite","width=500,height=300,status=yes,scrollbars=yes");
}

function content(value){
	url="../MyPage/Message_Content.jsp?q_num="+value;
	window.open(url,"Message_Content","width=500,height=300,status=yes,scrollbars=yes");
}

function delMsg() {
	  alert("삭제삭제");
	  var chkList = document.getElementsByName('select');
	  var arr = new Array();	
	  var cnt = 0;
	  for ( var i = chkList.length - 1; 0 <= i; i--) {
	   if (chkList[i].checked) {
	    arr[cnt] = chkList[i].value;
	    cnt++;
	   }
	  }
	  if (arr.length != 0) {
	   document.msglist.submit();
	  } else {
	   alert('삭제할 쪽지를 선택하세요.');
	   return;
	  }
}
</script>
 
</head>
<body>
<ul class="tab" id="tab">
    <li>정보수정</li>
    <li>쪽지함</li>
    <li>전적확인</li>	
</ul>
 
<div class="tab_con" id="tab_con">
    <div><form method="post" name="userForm" action="ModifyProc.jsp" onSubmit="return checkIt()">
	<strong style="font-size:15px;">내 정보 조회 및 수정</strong>
	<table id="modify" border=1 cellspacing=0 cellpadding=3 align=center width="80%" style="line-height:3; border:1px solid #aaa; border-collapse:collapse;">
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
				입력 : <input type="password" id="q_pwd" name="q_pwd" size="10"> 확인: <input type="password" id="q_pwd2" name="q_pwd2" size="10"> 
			
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
			<th width=200>성별</th>
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
	</form></div>
	
		
    <div align="center">
    
    <form name="msglist" method="post" action="Member_MsgDelete.jsp" id="msgList">
    <input type="button" value="삭제" onclick="delMsg()"> <input type="button" value="답장" onclick="">
    
	<%
    	if(vec.isEmpty()){
    		out.println("쪽지가 없습니다");
    	}else{//등록한 글이 있으면
    		%>
    		<table name="message_list" width="100%">
    		<tr align="center">
    		<th width="5%"><input type="checkbox" id="selectAll"></th><th width="20%">보낸사람</th><th width="60%">내용</th><th width="15%">날짜</th>
    		</tr>
    		
    		<div>
        		<%
        		for(int i=0; i<vec.size();i++){
        			if(i==vec.size()){break;}//for 탈출		
        			
        			MessageDto dto2=(MessageDto)vec.get(i);
        			int q_num=dto2.getQ_num();		

        			String q_nickname_receive1=dto2.getQ_nickname_receive();
        			String q_nickname_send=dto2.getQ_nickname_send();
        			String q_msg_content=dto2.getQ_msg_content();
        			Date q_send_time=dto2.getQ_send_time();
        			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        			
        			String sendtime=sdf.format(q_send_time);
        			
        		%>
        		
        			<tr>
        			<td align="center"><input type="checkbox" name="select" value="<%=q_num%>"></td>
        			<td align=center><%=q_nickname_send %></td>
        			
        			<td>
        			<a href="javascript:content('<%=q_num %>')"><%=q_msg_content %></a>
        			
        			
        			<td align=center><%=sendtime %></td>

        			</tr>
        			
        			<form name="readForm" method="post">
		 			<input type="hidden" name="q_num" value="">
		 			<input type="hidden" name="q_nickname_send" value="<%=q_nickname_send %>">
		    		</form>
        			
        			<% }//for %>
        		</table> 	
	<%}//else %>
	</form>
    </div>
    
    <div>
   
    	<table align="center">
    		<tr>
    		<td><img src="../Colosseum/imgs/a2.jpg" width="200px" height="200px" style="position:relative"></td>
    		<td>
				<p> ID : <%=q_id %></p>
				<p> NickName : <%=q_nickname %></p>
			</td>
    		</tr>
    		
    		<tr>
    		<td colspan=2>
    		<p>내가 등록한 게임 :최근 등록한 게임 하나만
			<input type="button" value="상세보기" onclick="MyGame()"><br>
			
			즐겨찾기 한 게임 : 최근 즐찾한 게임 하나만
			<input type="button" value="상세보기" onclick="Favorite()"><br>
			
			최근 플레이한 게임 : 최근 플레이한 게임 하나만
			<input type="button" value="상세보기" onclick="PlayGame()"></p>
    		</td>
    		</tr>
    		
    		<tr>
    		<td colspan=2>
    		<p>플레이 한 퀴즈 total : <%=totalgame %> 개 <br>
			정답 : <%=yescount %> 개 <br>
			오답 : <%=nocount %> 개 <br>
			정답률 : <progress value="<%= percentage%>" max="100"></progress> <%= percentage%> % </p>
			
			
    		</td>
    		</tr>
    	</table>
    </div> 
</div>
 
</body>
</html>