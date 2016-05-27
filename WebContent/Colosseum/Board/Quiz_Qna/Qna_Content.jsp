<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Qna.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");
%>

<%
QnaDao dao=QnaDao.getInstance();

int q_num=Integer.parseInt(request.getParameter("q_num"));

//int nowPage=Integer.parseInt(request.getParameter("page"));
//String keyField=request.getParameter("keyField");
//String keyWord=request.getParameter("keyWord");

int nowPage=0;
String keyField="";
String keyWord="";

QnaDto dto=dao.getQna(q_num); 
dao.upCount(q_num);

String q_nickname=dto.getQ_nickname();
String q_subject=dto.getQ_subject();
String q_content=dto.getQ_content();
String q_date=dto.getQ_date();
int q_count=dto.getQ_count();

String q_nickname2="test"; //나중에 세션에서 받아 온 닉네임 or 아이디로 변경

%>

<html>
	<head>
	<style type="text/css">

.container{
	position: absolute;
	width: 100%;
	height: 100%;
}
.content{
	position: absolute;
	width: 50%;
	height: 100%;
	left: 25%
}
.content h3.title {
	position: absolute;
	top: 5%;
	width: 100%;
	height: 26px;
	padding: 0;    
    line-height: 18px;
    border-bottom: 3px solid #252525;
}
.content h3{
	font-weight: bold;    
    font-size: 17px; 
    font-family: 맑은 고딕;
    color: 1d1d1d;   
    letter-spacing: 0;
}
.contentWrap{
	
	position: absolute;
	width: 100%;
	height: 100%;
	top: 9.8%;
	border-top: 1px solid #ccc;
}
.contentWrap .title_con{
	
	font-weight: bold;
	font-size: 20px;
	font-family: '맑은고딕';
	color: #333;
	line-height: 26px;
	letter-spacing: -1px;
	margin: 0;
	padding: 5px 0 10px 20px;
	border: 1px solid #d8d8d8;
	border-top: 0;
}
.contentWrap .ContentInfo {
	
    height: 12px;
    line-height: 12px;
    margin: 0;
    padding: 17px 20px;
    border: 1px solid #d8d8d8;
    border-top: 0;
}
.contentWrap .ContentInfo .info_write {
	
    float: left;
    font-family: '맑은 고딕';
    font-size: 12px;
    color: #666;
    vertical-align: middle;
    margin: 0 auto;
}
.contentWrap .ContentInfo .info_count {
	
    float: right;
    font-family: '맑은 고딕';
    font-size: 12px;
    color: #666;
    margin: 0 auto;
}

.ContentView {
    border-bottom: 2px solid #444;    
    border: 1px solid #d8d8d8;
    border-top: 0;
    padding-bottom: 0;
}
.contentWrap .ContentView .area_con {
    min-height: 100px;
    padding: 20px 20px 0;
    border-top: 0;
    margin-bottom: 40px;
    color: #666;
    font-family: '맑은 고딕','Malgun Gothic';
    font-size: 12px;
    line-height: 1.4px;
}
.contentWrap .btn_con {

    height: 28px;
    margin-top: 12px;
    margin-bottom: 30px;
    padding-top: 12px; 
}
.btn_con .btn_vim{
	float: left;
	margin: 0 auto;
}
.btn_con .btn_list{
	float: right;
	margin: 0 auto;
}
	</style>
	
	<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> --%>
	<script>
	
	function deleteCheck(){//삭제 버튼 클릭시 선택창이 뜨게 합니다
		if (window.confirm("정말로 삭제하시겠습니까?")){
			  alert("삭제되었습니다.");
			  location.href="Board/Quiz_Qna/Qna_Delete.jsp?page=1&q_num=<%=q_num %>";
			  }else{
			  alert("취소되었습니다.");
			  }
	 }//deleteCheck end 
	 
	 function updateCheck(q_num){
		 
		 movePageUrl("Board/Quiz_Qna/Qna_Update.jsp?&q_num="+q_num);
		 
	 }
	 <%--
	 $(function(){
		//alert("ddd")
		 $("<div></div>").load("Comment_List.jsp?<%=q_num%>").appendTo("body");
		
		$(this).on('click','#test',function(){
			alert('test');
			
			var test111=$(this).attr('q_num');
			$('#comentForm').val(t);
			$('#comentForm').submit();
		
		});
		
		
	 });--%>
	 
	</script>
	
	<link rel="stylesheet" type="text/css" href="Qna_css.css">
	
	</head>
	<body>
  <div class="container">
  <div class="content">
    <h3 class="title">Q & A 게시판</h3>
    
    <div class="contentWrap">

			<p class="title_con"><%=q_subject %></p>
			
			<div class="ContentInfo">
				<p class="info_write">
					<strong><%=q_nickname %></strong>&nbsp;
					<span class="date"><%=q_date %></span>
				</p>
			
				<p class="info_count">
					<span class="view"><img src="imgs/view.png">&nbsp;<%=q_count %></span>&nbsp;&nbsp;&nbsp;
					<span class="comment"><img src="imgs/cmt.png">&nbsp;0</span>				
				</p>			
			</div>
			
			<div id="BoardView" class="ContentView">
				<div class="area_con"><%= q_content %></div>
			</div>
				
			<div class="btn_con">
				
				<%
				if(q_nickname.equals(q_nickname2)){
				%>
				<img src="imgs/change.png" onclick="updateCheck(<%=q_num %>)" class="btn_vim">
				<img src="imgs/del.png" onclick="deleteCheck()" class="btn_vim">
				<%
				}else{
				%>
				<a href="Board/Quiz_Qna/Qna_Write.jsp?q_nickname=<%=q_nickname2%>"><img src="imgs/btn_vim1.png" class="btn_vim"></a>
				<%	
				}
				%>
				<a href="Board/Quiz_Qna/Qna_List.jsp"><img src="imgs/btn_vim2.png" class="btn_list"></a>

			</div><!-- btn_con -->
	<%
	if(keyWord==null||keyWord.equals("")){
	%>
	<form name="listForm" method="post">
		<input type="hidden" name="q_num" value="<%=q_num %>">
		<input type="hidden" name="page" value="<%=nowPage %>">
	</form>
	
	<%
	}else{
	%>
	
	<form name="listForm" method="post">
		<input type="hidden" name="q_num" value="<%=q_num %>">
		<input type="hidden" name="page" value="<%=page %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
	</form>
	<%
	}
	%> 	
	
	<%--<%@ include file="Comment_List.jsp"%>--%>
	</div><!-- contentWrap -->
</div><!-- content -->
</div><!-- container -->
	</body>
</html>
