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
    
    String keyField="";//키 필드
    String keyWord="";//검색 단어
    
    Vector vec=null;
    String nickname="test";
    %>
    <%
    String im=request.getParameter("keyWord");

    if(request.getParameter("keyWord")!=null){//검색어가 있으면
    
    	keyWord=request.getParameter("keyWord");
    	keyField=request.getParameter("keyField");
    }
    
    if(request.getParameter("reload")!=null){
    	if(request.getParameter("reload").equals("true")){
    		keyWord="";
    		keyField="";
    		
    	}//if
    }//if
    %>
    
    
    <%
    QnaDao dao = QnaDao.getInstance();
    vec=dao.getKinList(keyField, keyWord);//dao메서드 호출
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
    		alert("test");
    		if(document.searchForm.keyWord.value==''){
    			alert("검색어를 입력 하시오");
    			document.searchForm.keyWord.focus();
    			return false;
    		}
    		document.searchForm.submit();
    	}//check() end
    	
    	function list(){
    		document.listForm.action="Qna_Kin_List.jsp";
    		document.listForm.submit();
    	}//list() end
    	
    	function content(valuess){
    		
    		document.readForm.action="Qna_Kin_Content.jsp";//글 내용 보기
    		document.readForm.q_num.value=valuess;//글번호
    		document.readForm.submit();
    	}//read() end
    	
    	
    	
    </script>
    </head>
    
    <body>
 
    <div>
    	<div>
    		<table align="center" border=0 width=56%>
	    		<tr>
	    		<td><h3>묻고 답하기</h3></td>
	    		<td align="right">
	  	  			Total : <font color="red"><%=totalRecord %></font>
	    			
	    		</td>
	    		</tr>
    		</table>
    	</div> 
    	
	    
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
    					
    			String q_nickname=dto.getQ_nickname();
    			String q_subject=dto.getQ_subject();    			
    			String q_date=dto.getQ_date();    			
    			 
    			int q_num=dto.getQ_num();
    			int q_count=dto.getQ_count();
    			
    			int q_group=dto.getQ_group();
    			int q_sort=dto.getQ_sort();
    			 
    			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    			
    			Date regdate= df.parse(q_date);
    			
    			Calendar now = Calendar.getInstance();     			
    		    Calendar cal = Calendar.getInstance();
    		    cal.setTime(regdate);
    		    
    		    long dateTime1 = now.getTimeInMillis();
    		    long dateTime2 = cal.getTimeInMillis();
    		   
    		    long result = (dateTime1 - dateTime2)/1000;

    		    int hour = (int) Math.round((double)(result / 3600));    		    
    		   
    		    
    			%>
    		
    			<tr>
    			<!--  번호를 역순으로, num와 다르다 -->
    			<td align=center><%=totalRecord-i %></td>

    			
    			<td>  
    			<a href="javascript:content('<%=q_num %>')"><%=q_subject %></a>
    			<%
				if(hour<24){//new
				%>
				<img src = "../imgs/ico_new.gif" width="10" height="10">
				<%
				}
				%>
    			</td>
    			
    			<td align=center><%=q_nickname %></td>    			
    			<td align=center><%=q_date %></td>
    			<td align=center><%=q_count %></td>
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
    	</div>
    	
    	<div></div>
    	<br>
    	
    	<div align="center">
    	<span>
    	<%
    	if(totalRecord!=0){//글이 존재하면
    		if(nowBlock>0){// 이전 블럭으로 이동
    	%>
    	<a href="Qna_Kin_List.jsp?nowBlock=<%=nowBlock-1%>&
    	page=<%=((nowBlock-1)*pagePerBlock)%>&
    	keyField=<%=keyField %>&
    	keyWord=<%=keyWord %>">
    	
    	이전블럭 <%=pagePerBlock %>개
    	</a>
    	
    	<%
    	}//if 이전 블럭 끝
    	//-------------------------페이지 처리
    	for(int i=0; i<pagePerBlock; i++){
    		%>
    		<a href="Qna_Kin_List.jsp?nowBlock=<%=nowBlock%>&page=<%=(nowBlock*pagePerBlock)+i %>">
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
    		<a href="Qna_Kin_List.jsp?nowBlock=<%=nowBlock+1 %>&
    		page=<%=(nowBlock+1)*pagePerBlock %>&
    		keyField=<%=keyField %>&
    		keyWord=<%=keyWord %>">
    		
    		다음블럭<%=pagePerBlock %>개
    		</a>
    		
    		<%
    	}
    	
    	}//if 글이 존재하면 끝
    	%>
    	</span>
    	
    	<span id="test1">
    	
    		<a href="Qna_Write.jsp?q_nickname=<%=nickname%>"><input type="button" value="글쓰기"></a>
    	</span>
    	</div>
    	<div>
    		<form name="searchForm" method="post" action="Qna_Kin_List.jsp">
    		<table width="55%" border=0 align=center cellpadding=1 cellspacing=0>
    		<tr>
    		<td align=center valign=bottom>
    		<select name="keyField">
    			<option value="q_subject">제목</option>
    			<option value="q_nickname">이름</option>
    			<option value="q_content">글내용</option>
    		</select>
    		
    		<input type="text" name="keyWord" size=16>
    		<input type="hidden" name="page" value="0">
    		<input type="button" value="검색" onClick="check()">
    		</td>
    		</tr>    			
    		</table>
    		</form>
    		
    
    		<%-- readForm --%>
    		<form name="readForm" method="post">
    			<input type="hidden" name="q_num" value="">
    			<input type="hidden" name="page" value="<%=nowPage%>">
    			<input type="hidden" name="keyField" value="<%=keyField%>">
    			<input type="hidden" name="keyWord" value="<%=keyWord%>">
    			<input type="hidden" name="q_nickname" value="<%=nickname%>">
    		</form>
    		
    		<%-- listForm --%>
    		<form name="listForm" method="post">
    			<input type="hidden" name="reload" value="true">
    			<input type="hidden" name="page" value="0">	
    			<input type="hidden" name="nowBlock" value="0">
    	</form>
    	
    	</div>
    	</body>
    
    
    </html>