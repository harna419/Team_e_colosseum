<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"
    import="java.util.*"
    import="java.text.SimpleDateFormat"
    import="java.text.*"
    %>
    
<%
request.setCharacterEncoding("utf-8");
String nickname2="admin";
int q_notice_group2=1;
//requestGetparametaertqa ("게시판 그룹 넘버"); 그룹넘버가 현재 페이지에서 사용가능.
//그 그룹 넘버를 dao.getNotice(test); 매개변수에다가 넣어준다.
//그러면 해당 게시판에 해당하는 공지사항 글만 3번 반복 할 것이다.
%>

<%
BoardDao dao2=BoardDao.getInstance();
Vector vec3=dao2.getNoticeList(0);
Vector vec2=dao2.getNoticeList(q_notice_group2);
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
	
	<style type="text/css">
		#btable{
		    border:0;
		    border-collapse:collapse;
		    border-spacing:0;
		    empty-cells:show;
		    border-color:#f6f6f6;
		    border-bottom:#d0d0d0;
		    background-color:#f6f6f6;
		    }
		#btr{
			border-color:#f6f6f6;
			border-top:3px solid black;
			height:20%;
			}
	</style>

	<div>	
    	<div align="center" width="60%">
    	<span>
    	
    	<%
    	if(vec3.isEmpty()){
    		out.println("등록한 글이 없습니다");
  
    	}else{//등록한 글이 있으면
    		%>
    		
    		<table id=btable border=1 width="56%" cellpadding=2 cellspacing=0>
    		<thead>
    		<tr id=btr align=center bgcolor="#d0d0d0" height="120%">
    		<td width="5%">번호</td>
    		<td width="45%">제목</td>
    		<td width="20%">이름</td>
    		<td wdith="20%">날짜</td>
    		<td width="10%">조회수</td>
    		</tr>
    		</thead>
    		
    		<div>
    		<%
    		for(int i=0; i<vec3.size();i++){
    			//if(i==3){break;}//for 탈출
    			
    			
    			BoardDto dto3=(BoardDto)vec3.get(i);
    			
    			String q_nickname3=dto3.getQ_nickname();
    			String q_subject3=dto3.getQ_subject();
    			
    			String q_create_time3=dto3.getQ_create_time();
    			String q_modify_time3=dto3.getQ_modify_time(); 
    			
    			int q_num3=dto3.getQ_num();
    			int q_read_count3=dto3.getQ_read_count();
    			int q_notice_num3=dto3.getQ_notice_num();
    			int q_notice_group4=dto3.getQ_notice_group();

    			%>
    			
    			<tr>
    			<!--  번호를 역순으로, num와 다르다 -->
    			<td align=center>전체</td>
    			<td>
  
    			<a href="javascript:content2('<%=q_num3 %>')"><%=q_subject3 %></a>	
    			</td>
    			
    			<td align=center><%=q_nickname3 %></td>
    			
    			<td align=center><%=q_create_time3 %></td>
    			<td align=center><%=q_read_count3 %></td>
    			</tr>

    		<%} %>
    			
    		<%
    		for(int j=0; j<vec2.size();j++){
    			if(j==2){break;}//for 탈출
    			
    			
    			BoardDto dto2=(BoardDto)vec2.get(j);
    			
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