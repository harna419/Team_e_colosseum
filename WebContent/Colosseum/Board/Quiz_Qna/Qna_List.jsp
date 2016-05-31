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
    vec=dao.getQnaList(keyField, keyWord);//dao메서드 호출
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
        
.container{
	position: absolute;
	width: 100%;
	height: 100%;
	margin: 0px; padding: 0px;
    font-family:'돋움',Dotum;
    color: #666;
    font-size: 12px;
    line-height: 1.4;
}
.content{	
	position: absolute;
	width: 60%;
	height: 100%;
	left: 15%	
}
.content h3.title {
	position: absolute;
	top: 10%;	
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
.boardList{
	border-top: 1px solid #e5e5e5;
	position:absolute;
	top: 14.8%;
	padding: 0;
	margin: 0;
	border: 0;
	width: 100%;
	height: 43%;
}
.boardList table{
	width: 100%;
	height: 60%;
}
table{	
	table-layout:static;
	border: 0;
	border-collapse: collapse;
	border-spacing: 0;
}
thead{
	vertical-align: middle;
	border-color: inherit;
}
.boardList thead th{
	height: 36px;
    text-align: center;
    vertical-align: middle;
    color: #444;
    font-size: 12px;
    font-family:'맑은고딕';
    font-weight: bold;
    background-color: #e5e5e5; 
}
tbody{
	vertical-align: middle;
	border-color: inherit;
}
.boardList tbody td{
	height: 36px;
    text-align: center;
    vertical-align: middle;
    border-bottom: 1px solid #d9d9d9;
    font-size: 12px;
    font-family: '맑은고딕';
    color: #666;
    line-height: 1.4;
}
.boardList tbody td.title{
    text-align: left;
}

.paging{	
    clear: both;
    text-align: center;
    position: absolute;
    width: 100%;
    height: 5%;
    top: 61.5%;	
    z-index: 1;
}
.paging a{
    display: inline-block;
    color: #767676;
    line-height: 15px;
    min-width: 14px;
    font-family: Verdana;
    vertical-align: middle;
}
a, a:link, a:active, a:visited {
	text-decoration: none;
	color: #666;
}
.paging a:hover,
.paging a.selected{
	color: #111;
	font-weight: bold;
	text-decoration: none;
}
.boardBtn{	
	position: absolute;
	width: 100%;
	line-height: 10%;
	top: 83%;
	text-align:right;    
}
.searchForm{	
	position: absolute;
	width: 100%;
	height: 3%;
	top: 70%;	
    text-align: center;
}
.searchForm select{
	vertical-align: middle;
	height: 23px;
	line-height: 23px;
	white-space: nowrap;
	border: 1px solid #ccc;
	font-family: '돋움', '굴림';
	font-size : 12px;
}
option{
	white-space: pre;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}
.searchForm .keyWord{
	vertical-align: middle;
    border: 1px solid #d9d9d9;
    height: 24px;
    line-height: 24px;
    width: 5%;
    padding: 0 5px;
}
.searchForm .keyWord input{
	height: 23px;
	border: 1px solid #d9d9d9;
	font-family: '돋움', '굴림';
	font-size: 12px;
}
.searchForm .btSearch{
    vertical-align: middle;
    display: inline-block;
    width: 42px;
    height: 23px;
    padding-top: 1px;
    line-height: 23px;
    text-align: center;
    font-weight: bold;
    font-size: 12px;
    color: #fff;
    text-decoration: none;
    background-color: #767676;
}

</style>
    
    <script type="text/javascript">
    	function check(){
    		
    		if(document.searchForm.keyWord.value==''){
    			alert("검색어를 입력 하시오");
    			document.searchForm.keyWord.focus();
    			return false;
    		}
    		var kWord=document.searchForm.keyWord.value;
    		var kField=document.searchForm.keyField.value;	    		
    		movePageUrl('./Board/Quiz_Qna/Qna_List.jsp?keyWord='+kWord+'&keyField='+kField);
    		
    		//document.searchForm.submit();
    	}//check() end
    	
    	function list(){
    		//document.listForm.action="./Board/Quiz_Qna/Qna_List.jsp.jsp";
    		//document.listForm.submit();
    		//movePageUrl('./Board/Quiz_Qna/Qna_List.jsp');
    	}//list() end
    	
    	function content(q_num){
    		
    		//document.readForm.action="Qna_Content.jsp";//글 내용 보기
    		//document.readForm.q_num.value=valuess;//글번호
    		//document.readForm.submit();
    		movePageUrl('./Board/Quiz_Qna/Qna_Content.jsp?q_num='+q_num);
    		
    	}//read() end
    	
    	function clicked(nickname){
	    	
	    	
	    	movePageUrl('./Board/Quiz_Qna/Qna_Write.jsp?q_nickname='+nickname);
	    	
	    }
    	
    </script>
    
    <link rel="stylesheet" type="text/css" href="Qna_css.css">
    
    </head>
    
	<body>
 

  <div class=container>
  <div class=content>
    <h3 class="title">Q & A 게시판</h3>
	  <div class="boardList" align="center" width="60%">
    	
    	<%
    	if(vec.isEmpty()){
    		out.println("등록한 글이 없습니다");
    	}else{//등록한 글이 있으면
    		%>
    		
    	<table>    	
    		<thead>
    		<tr>
    		<th width="10%">번호</td>
    		<th width="44%">제목</td>
    		<th width="16%">아이디</td>
    		<th wdith="15%">작성일</td>
    		<th width="15%">조회수</td>
    		
  			</tr>
    		</thead>
   
    		<tbody>
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
	    			<td class="no"><%=totalRecord-i %></td>    			
	   			
	    			<td class="title">  
	    			<a href="javascript:content('<%=q_num %>')"><%=q_subject %></a>
	    			<%
					if(hour<24){//new
					%>
					<img src = "imgs/ico_new.gif" width="10" height="10">
					<%
					}
					%>
	    			</td>
	    			
	    			<td><%=q_nickname %></td>    			
	    			<td><%=q_date %></td>
	    			<td><%=q_count %></td>
    			</tr>
    			<%
    		}//for
    		%>
    		</tbody>
    	</table>
	  </div><!-- boardList -->    	
    		
    		<%
    	}//else
    	%>    	
    	
    	<br>
    	
    	<div class="paging">
    	<span>
    	<%
    	if(totalRecord!=0){//글이 존재하면
    		if(nowBlock>0){// 이전 블럭으로 이동
    	%>
    	<a href="Qna_List.jsp?nowBlock=<%=nowBlock-1%>&
    	page=<%=((nowBlock-1)*pagePerBlock)%>&
    	keyField=<%=keyField %>&
    	keyWord=<%=keyWord %>">
    	
    	<img src="imgs/btn_pre.png">&nbsp;&nbsp;
    	</a>
    	
    	<%
    	}//if 이전 블럭 끝
    	//-------------------------페이지 처리
    	for(int i=0; i<pagePerBlock; i++){
    		%>
    		<a href="Qna_List.jsp?nowBlock=<%=nowBlock%>&page=<%=(nowBlock*pagePerBlock)+i %>">
    		<%=(nowBlock*pagePerBlock)+i+1 %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    		<a href="Qna_List.jsp?nowBlock=<%=nowBlock+1 %>&
    		page=<%=(nowBlock+1)*pagePerBlock %>&
    		keyField=<%=keyField %>&
    		keyWord=<%=keyWord %>">
    		
    		&nbsp;&nbsp;<img src="imgs/btn_next.png">
    		</a>
    		
    		<%
    	}
    	
    	}//if 글이 존재하면 끝
    	%>
    	</span>
    	
    	<div class=boardBtn>    	
    		<%--<a href="Qna_Write.jsp?q_nickname=<%=nickname%>"><img src="imgs/boardBtn01.png"></a> --%>
    		<img src="imgs/boardBtn01.png" onclick="javascript:clicked('<%=nickname%>')">
    	</div><!-- boardBtn -->
    	
    	</div><!-- paging -->
    	
    	<div class="searchForm">
    		<form name="searchForm" method="post" action="Qna_List.jsp">
    		<table width="55%" border=0 align=center cellpadding=1 cellspacing=0>
	    		<tr>
		    		<td align=center valign=bottom>
		    		<select name="keyField">
		    			<option value="q_subject">제목</option>
		    			<option value="q_nickname">이름</option>
		    			<option value="q_content">글내용</option>
		    		</select>
		    		
		    		<input type="text" id="keyWord" name="keyWord" size=30>
		    		<input type="hidden" name="page" value="0">
		    		<input type="button" id="btnSearch" class="btSearch" value="검색" onClick="check()">
		    		<%--<a href="#Search" id="btnSearch" class="btSearch" onClick="check()">검색</a> --%>
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
    	
    	</div><!-- searchForm -->
  </div><!-- content -->  	
  </div><!-- container -->  	

	</body>
</html>