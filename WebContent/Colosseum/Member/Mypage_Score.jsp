<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Member.*"
    import="quiz_colosseum.*"
    %>
<%
request.setCharacterEncoding("utf-8");
MemberDao mdao=MemberDao.getInstance();
String q_id=(String)session.getAttribute("q_id");
MemberDto mdto=mdao.getMember(q_id);//dao 메서드 호출
String q_nickname=mdto.getQ_nickname();

Quiz_ScoreMgr quizMgr=Quiz_ScoreMgr.getInstance();
Quiz_ScoreBean quizBean=quizMgr.quizScoreCount(q_id);
int totalgame=quizBean.getTotalcount();
System.out.println(totalgame);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage score</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script type="text/javascript">
var total_time = 5000;
var current_time = 0;
var refresh_interval = 100;
var timer;
 
function refresh_bar() {
  if(current_time > total_time) {
	 
    clearInterval( timer );
    current_time = total_time;
  }
  percentage = 100 * current_time / total_time;
  $( "#progressbar1" ).progressbar({ value: current_time })
    .children('span.caption').html(percentage.toFixed(1) + ' %');
  current_time += refresh_interval;
}

$(function() {
  $( "#progressbar1" ).progressbar({ max: total_time });
  //refresh_bar();
  timer = setInterval( refresh_bar, refresh_interval );
});
</script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<style type="text/css">
#info{
	float:left;
	width:580px;
	padding:5px;
	 
}
#profile{
	float:left;
	width:200px;
	heigh:150px;
}
.rank{
	clear:both;
}

#progressbar1 {
  height: 23px;
  width: 400px;
  
}
#progressbar1 .ui-progressbar-value {
  margin-top: -23px;
}
#progressbar1 span.caption {
  display: block;
  text-align: center;
  background-color:pink;
}

hr{
	margin-left:0;
}
}

</style>
</head>
<body>
<div>
	<div id="profile"><img src="../imgs/a2.jpg" width="170px" height="200px"></div>
	<div id="info">
	<ul>
		<li>ID : <%=q_id %></li>
		<li>NickName : <%=q_nickname %></li>
		<li>My Group :</li>
	</ul>
	</div>
	<div class="rank"></div>
	<div class="rank">
		<div id="article">
		<br>
		<p>내가 등록한 게임 :
		<div>
			<%
			for(int i=0;i<5;i++){
				
			}
			%>
		</div>
		
		<input type="button" value="상세보기" onclick=""></p>
		
		<p>즐겨찾기 한 게임 :
		

		<input type="button" value="상세보기" onclick=""></p>
		
		<p>최근 플레이한 게임 :
		

		<input type="button" value="상세보기" onclick=""></p>
		</div>
	</div>
	
	<div>
	<p>플레이 한 퀴즈 total : </p>
	<p>정답률 : </p>
	
	<div id="progressbar1"><span class="caption"></span></div>
	 
	</div>
</div>
</body>
</html>