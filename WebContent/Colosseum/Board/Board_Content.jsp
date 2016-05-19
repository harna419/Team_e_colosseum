<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"
    import="java.util.*"
%>
<%
request.setCharacterEncoding("utf-8");
 
BoardDao dao=BoardDao.getInstance(); //dao 메소드 호출
  
int q_num=Integer.parseInt(request.getParameter("q_num"));
int nowPage=Integer.parseInt(request.getParameter("page"));
String keyField=request.getParameter("keyField");
String keyWord=request.getParameter("keyWord");

BoardDto dto=dao.getBoard(q_num); 
dao.upCount(q_num);

String q_nickname=dto.getQ_nickname();
String q_subject=dto.getQ_subject();  
String q_content=dto.getQ_content();
String q_create_time=dto.getQ_create_time();
String q_modify_time= dto.getQ_modify_time();    
int q_notice_num=dto.getQ_notice_num();
int q_read_count=dto.getQ_read_count();

String q_nickname2="test"; //나중에 세션에서 받아 온 닉네임 or 아이디로 변경
%>

<html>
	<head>
	<script>
		function deleteCheck(){ //삭제 버튼 클릭시 선택창이 뜨게 합니다
			if (window.confirm("정말로 삭제하시겠습니까?")){
				  alert("삭제되었습니다.");
				  location.href="Board_Delete.jsp?page=<%=nowPage %>&q_num=<%=q_num %>";
				  }else{
				  alert("취소되었습니다.");
				  }
		 }//zipCheck() end 
	</script>
	</head>
	
	<body>
	<table width="70%" bordercolor="#09778e" border=1 cellspacing=0 cellpadding=3 align=center>
		
			<tr>
				<td align=center width="10%">글번호</td>
				<td><%=q_num %></td>	
				<td align=center width="15%">등록날짜</td>
				<td><%=q_create_time %></td>
			</tr>

			<tr>
				<td align=center>작성자</td>
				<td><%=q_nickname %></td>
				<td align="center">조회수</td>
				<td><%=q_read_count %></td>
			</tr>
			
			<tr>
				<td align="center">제목</td>
				<td colspan=3><%=q_subject %></td>
			</tr>
			
			<tr>
				<td colspan=4><br>
				<% q_content=q_content.replace("\n", "<br>");%> 
				<%= q_content %>
				</td>
			</tr>
			
			<tr>
				<td align="right" colspan="4">
					<a href="Reply.jsp?page=<%=nowPage %>&q_num=<%=q_num %>"><input type="button" value="댓글쓰기"></a>
					<a href="Board_Update.jsp?page=<%=nowPage %>&q_num=<%=q_num %>"><input type="button" value="수정"></a>
					<!-- 닉네임이 admin일 경우 삭제버튼 생성 -->
					<% if(q_nickname.equals(q_nickname2) || q_nickname.equals("admin") ){ %>
					<input type="button" value="삭제" onclick="deleteCheck()">
					<%}%>
					<a href="Board_List.jsp"><input type="button" value="리스트"></a>
				</td>
			</tr>
	<%
	if(keyWord==null||keyWord.equals("")){ //검색어가 없으면
	%>
	<form name="listForm" method="post">
		<input type="hidden" name="q_num" value="<%=q_num %>">
		<input type="hidden" name="page" value="<%=nowPage %>">
	</form>
	
	<%}else{//검색어가 있으면 %> 
	
	<form name="listForm" method="post">
		<input type="hidden" name="q_num" value="<%=q_num %>">
		<input type="hidden" name="page" value="<%=page %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
	</form>
	
	<%}%>
	</body>
</html>
