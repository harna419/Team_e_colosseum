<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"
    import="Member.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");
%>

<%
BoardDao dao=BoardDao.getInstance();//dao 객체생성

int q_num=Integer.parseInt(request.getParameter("q_num2"));
String q_id=(String)session.getAttribute("q_id");
MemberDao mdao=MemberDao.getInstance();
MemberDto mdto=mdao.getMember(q_id);
String q_nickname2=mdto.getQ_nickname();

BoardDto dto=dao.getNotice(q_num); 
dao.upNoticeCount(q_num); //조회수

String q_nickname=dto.getQ_nickname();
String q_subject=dto.getQ_subject();
String q_content=dto.getQ_content();
String q_create_time=dto.getQ_create_time();
String q_modify_time=dto.getQ_modify_time(); 
int q_notice_num=dto.getQ_notice_num();
int q_read_count=dto.getQ_read_count();
int q_notice_group=dto.getQ_notice_group();
%>

<html>
	<head>
	<script>
	function boardlist(){
		document.listForm.action="Board_List.jsp";
		document.listForm.submit();
	}
	
	function deleteCheck(){ //삭제 할 떄 확인 창이 뜨게 합니다
		if (window.confirm("공지 사항을 정말로 삭제하시겠습니까?")){
			  alert("삭제되었습니다.");
			  location.href="Board_Notice_Delete.jsp?q_num=<%=q_num %>";
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
				<% q_content=q_content.replace("\n", "<br>"); %> 
				<%= q_content %>
				</td>
			</tr>
			
			<tr>
			<td align="right" colspan="4">	
				<a href="Board_Notice_Update.jsp?q_num=<%=q_num %>"><input type="button" value="수정"></a>
				<%
				if(q_nickname.equals("admin")){
				%>
				<input type="button" value="삭제" onclick="deleteCheck()">
				<%
				}
				%>
				<a href="javascript:boardlist()"><input type="button" value="리스트"></a>
		</td>
		
		</tr>
	<form name="listForm" method="post">
		<input type="hidden" name="q_num" value="<%=q_num %>">
		<input type="hidden" name="q_notice_group" value="<%=q_notice_group %>">
	</form>
	</body>
</html>
