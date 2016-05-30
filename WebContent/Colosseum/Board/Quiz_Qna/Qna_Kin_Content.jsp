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
//System.out.println("q_num:"+q_num);
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
	<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> --%>
	<script>
	
	
	 
	 function updatecheck(q_num){
		
		 movePageUrl("/Board/Quiz_Qna/Qna_Kin_Update.jsp?q_num="+q_num);
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
	 
	 function deleteCheck(q_num){
			alert("zzz"+q_num);
			
		 }//deleteCheck() end 
	 
	</script>
	</head>
	<body>
	<table width="70%" bordercolor="#e5e5e5" border=1 cellspacing=0 cellpadding=3 align=center>
		
			<tr>
			<td align=center width="10%">글번호</td>
			<td><%=q_num %></td>
			
			<td align=center width="15%">등록날짜</td>
			<td><%=q_date %></td>

			</tr>

			<tr>
			<td align=center>작성자</td>
			<td><%=q_nickname %></td>

			<td align="center">조회수</td>
			<td><%=q_count %></td>
			</tr>
			
			
			<tr>
				<td align="center">제목</td>
				<td colspan=3><%=q_subject %></td>
			</tr>
			
			<tr>
				<td colspan=4><br>
				<% 
					q_content=q_content.replace("\n", "<br>");
				%> 
				<%= q_content %>
				</td>
			</tr>			 
			
			<tr>
			<td align="right" colspan="4">
				<input onClick="updatecheck(<%=q_num%>)" type="button" value="수정">
				<%--<a href="Qna_Update.jsp?page=<%=nowPage %>&q_num=<%=q_num %>"><input type="button" value="수정"></a> --%>
				<%
				if(q_nickname.equals(q_nickname2)){
				%>
				<input type="button" value="삭제" onclick="deleteCheck(<%=q_num%>)">
				<%
				}
				%>
				<%--<a href="Qna_Kin_List.jsp"><input type="button" value="리스트"></a> --%>
				
		</td>
		
		</tr>
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
	
	</body>
</html>
