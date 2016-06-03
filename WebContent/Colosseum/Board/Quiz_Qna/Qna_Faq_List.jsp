<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Qna.*"
    import="java.util.*"
    import="java.text.ParseException"
    import="java.text.SimpleDateFormat"
    import="java.text.*"
    %>
     
    <%
    request.setCharacterEncoding("utf-8");
    %>
    
    <%
    int nowPage=0;//현재 페이지
    int nowBlock=0;//현재 블럭
    
    int totalRecord=0;//전체 글 갯수
    int numPerPage=0;//페이지당 글 갯수, 1 페이지당 10 개씩
    int totalPage=0;//전체 페이지수
    
    int totalBlock=0;// 전체 블럭수
    int pagePerBlock=0;//블럭당 페이지 수 10개
    int beginPerPage=0;//시작 페이지 ( 페이지의 시작 )    

	int q_group=0;// FAQ 게시판
    %>
    
    
    <%
    QnaDao dao = QnaDao.getInstance();
    Vector vec=dao.getFaqList(q_group);
    totalRecord=vec.size();//총 글 갯수
    numPerPage=10;//페이지당 총 글 갯수, 10개글 출력
    pagePerBlock=10;//블럭당 페이지수, 10페이지를 탄 블럭
    
    if(request.getParameter("page")!=null){
    	nowPage=Integer.parseInt(request.getParameter("page"));//현재 페이지
    }//if
    
    beginPerPage = nowPage * numPerPage ;//시작 페이지 까지
   
    
    totalPage=(int)Math.ceil((double)totalRecord/numPerPage);//ceil=올림값 Math.round()
    totalBlock=(int)Math.ceil((double)totalPage/pagePerBlock);//전체블럭계산
    
    if(request.getParameter("nowBlock")!=null){
    	nowBlock=Integer.parseInt(request.getParameter("nowBlock"));//현재 블럭을 얻는다
    }
    %>
    
<html>
    <head>
    <style type="text/css">
    span#test1{
    position: absolute;
    right:22.25%;
    
    }
    table#test2{
    border:0;
    border-collapse:collapse;
    border-spacing:0;
    empty-cells:show;
    border-color:#ffffff;
    border-bottom:#d0d0d0;
    }
    
    </style>
    
    <script type="text/javascript">
    	function check(){
    	
    		if(document.searchForm.keyWord.value==''){
    			alert("검색어를 입력 하시오");
    			document.searchForm.keyWord.focus();
    			return false;
    		}
    		document.searchForm.submit();
    	}//check() end
    	
    	function list(){
    		document.listForm.action="Qna_Faq_List.jsp";
    		document.listForm.submit();
    	}//list() end
    	
    	function content(valuess){
    		
    		document.readForm.action="Qna_Faq_Content.jsp";//글 내용 보기
    		document.readForm.q_num.value=valuess;//글번호
    		document.readForm.submit();
    	}//read() end
    	
    	
    	
    </script>
    </head>
    
    <body>
 
<div class=container>
  <div class=contentWrap>
    	
    <table align="center" border=0 width=56%>
	    		<tr>
	    		<td><h3>FAQ 임시 게시판</h3></td>
	    		<td align="right">
	  	  			Total : <font color="red"><%=totalRecord %></font>
	    			
	    		</td>
	    		</tr>
    </table>
    	
	    
    	<div align="center" width="60%">
    	<span>
    	
    	<%
    	if(vec.isEmpty()){
    		out.println("등록한 글이 없습니다");
    	}else{//등록한 글이 있으면
    		%>
    		
    		<table id=test2 border=1 width="56%" cellpadding=2 cellspacing=0>
    	
    		<div id="test3">
    		<tr align=center height="120%">
    		<td width="5%"></td>
    		<td width="45%"></td>
    		<td width="20%"></td>
    		<td wdith="20%"></td>
    		<td width="10%"></td>
    		
  			</tr>
    		</div>
   
    		<div>
    		<%
    		for(int i=beginPerPage; i<(beginPerPage + numPerPage);i++){
    			if(i==totalRecord){break;}//for 탈출
    			
    			
    			QnaDto dto=(QnaDto)vec.get(i);
    					
    			
    			String q_subject=dto.getQ_subject();
    			int q_num=dto.getQ_num();    			
    			int q_sort=dto.getQ_sort();
				%>
    		
    			<tr>
    			<!--  번호를 역순으로, num와 다르다 -->
    			<td align=center><%=totalRecord-i %></td>    			

    			
    			<td>  
    			<a href="javascript:content('<%=q_num %>')"><%=q_subject %></a>    			
    			</td>
    			
    			</tr>
    			<%
    		}//for
    		%>
    		</table>
    		</div>
    	
    		
    		<%
    	}//else
    	%>
    	
    	</span>

    	
    	
    	<br>
    	
    	<div align="center">
    	<span>
    	<%
    	if(totalRecord!=0){//글이 존재하면
    		if(nowBlock>0){// 이전 블럭으로 이동
    	%>
    	<a href="Qna_Faq_List.jsp?nowBlock=<%=nowBlock-1%>&
    	page=<%=((nowBlock-1)*pagePerBlock)%>">
    	
    	이전블럭 <%=pagePerBlock %>개
    	</a>
    	
    	<%
    	}//if 이전 블럭 끝
    	//-------------------------페이지 처리
    	for(int i=0; i<pagePerBlock; i++){
    		%>
    		<a href="Qna_Faq_List.jsp?nowBlock=<%=nowBlock%>&page=<%=(nowBlock*pagePerBlock)+i %>">
    		<%=(nowBlock*pagePerBlock)+i+1 %>
    		</a>
    		<%
    		if(((nowBlock*pagePerBlock)+i+1)==totalPage){
    			//마지막 페이지 얻기
    			break;//for 탈출
    		}
    	}//for
    	//---------페이지 처리 끝 --------------
    	//다음블럭
    	if(totalBlock>nowBlock+1){
    		%>
    		<a href="Qna_Faq_List.jsp?nowBlock=<%=nowBlock+1 %>&
    		page=<%=(nowBlock+1)*pagePerBlock %>">
    		
    		다음블럭<%=pagePerBlock %>개
    		</a>
    		
    		<%
    	}
    	
    	}//if 글이 존재하면 끝
    	%>
    	</span>
    	
    	<span id="test1">
    	
    		<a href="Qna_Write.jsp?q_nickname=admin"><input type="button" value="글쓰기"></a>
    	</span>
    	</div>
    	
    	<div>
    		
    
    		<%-- readForm --%>
    		<form name="readForm" method="post">
    			<input type="hidden" name="q_num" value="">
    			<input type="hidden" name="page" value="<%=nowPage%>">

    		</form>
    		
    		<%-- listForm --%>
    		<form name="listForm" method="post">
    			<input type="hidden" name="reload" value="true">
    			<input type="hidden" name="page" value="0">	
    			<input type="hidden" name="nowBlock" value="0">
    	</form>
    	
    	</div>
    	
    	
  </div><!-- contentWrap -->
</div><!-- container -->   	
    </body>     
</html>  