<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"
    import="Member.*"
    import="java.util.*"
    import="java.text.SimpleDateFormat"
    import="java.text.*"
    %>
    
<%
request.setCharacterEncoding("utf-8");
String q_id2=(String)session.getAttribute("q_id");
MemberDao mdao2=MemberDao.getInstance();
MemberDto mdto2=mdao2.getMember(q_id2);
String q_nickname4=mdto2.getQ_nickname();
int q_notice_num3=0;
%>

<%
BoardDao dao2=BoardDao.getInstance();
Vector vec2=dao2.getNoticeList(q_notice_num3);
int totalRecord2=vec2.size();//전체 글 갯수

String keyField2=request.getParameter("keyField");
String keyWord2=request.getParameter("keyWord");
%>
	<script>
	function content2(value){
		document.readForm2.action="Board_Notice_Content.jsp";//글 내용 보기
		document.readForm2.q_num2.value=value;//글번호
		document.readForm2.submit();
	}
	</script>

	<div>	
    	<div align="center" width="60%">
    	<span>
    	
    	<%
    	if(keyField2!=null || keyWord2!=null){ //검색어가 없으면
    	%>
    		<table id=test2 border=1 width="56%" cellpadding=2 cellspacing=0>
    		<thead>
    		<tr align=center bgcolor="#d0d0d0" height="120%">
    		<td width="5%">번호</td>
    		<td width="45%">제목</td>
    		<td width="20%">이름</td>
    		<td wdith="20%">날짜</td>
    		<td width="10%">조회수</td>
    		</tr>
    		</thead>
    		</table>
    	<%
    	}else{//등록한 글이 있으면
    		%>
    		
    		<table id=test2 border=1 width="56%" cellpadding=2 cellspacing=0>
    		<thead>
    		<tr align=center bgcolor="#d0d0d0" height="120%">
    		<td width="5%">번호</td>
    		<td width="45%">제목</td>
    		<td width="20%">이름</td>
    		<td wdith="20%">날짜</td>
    		<td width="10%">조회수</td>
    		</tr>
    		</thead>
    		
    		<div>
    			
    		<%
    		for(int i=0; i<vec2.size();i++){
    			//if(i==3){break;}//for 탈출
    			
    			
    			BoardDto dto2=(BoardDto)vec2.get(i);
    			
    			String q_nickname2=dto2.getQ_nickname();
    			String q_subject2=dto2.getQ_subject();
    			
    			String q_create_time2=dto2.getQ_create_time();
    			String q_modify_time2=dto2.getQ_modify_time();
    			
    			int q_num2=dto2.getQ_num();
    			int q_read_count2=dto2.getQ_read_count();
    			int q_notice_num2=dto2.getQ_notice_num();
    			int q_notice_group3=dto2.getQ_notice_group();
    		
    			%>
    		
    			<tr>
    			<!--  번호를 역순으로, num와 다르다 -->
    			<td align=center>공지</td>
    			<td>
  
    			<a href="javascript:content2('<%=q_num2 %>')"><%=q_subject2 %></a>	
    			</td>
    			
    			<td align=center><%=q_nickname2 %></td>
    			
    			<td align=center><%=q_create_time2 %></td>
    			<td align=center><%=q_read_count2 %></td>
    			</tr>
    			<%
    		}//for
    		%>
    		</div>
    		</table> 		
    		<% }//else %>	
    	</span>
    	</div>
   
    		<%-- readForm --%>
    		<form name="readForm2" method="post">
    			<input type="hidden" name="q_num2" value="">
    			
    		</form>
    	</div>