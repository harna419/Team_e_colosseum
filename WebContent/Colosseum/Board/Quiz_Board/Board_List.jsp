<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"
    import="Member.*"
    import="java.util.*"
    import="java.text.ParseException"
    import="java.text.SimpleDateFormat"
    import="java.text.*"
%>
   
<%
    request.setCharacterEncoding("utf-8");

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

    String q_id=(String)session.getAttribute("mem_id");
    MemberDao mdao=MemberDao.getInstance();
    MemberDto mdto=mdao.getMember(q_id);
    String nickname=mdto.getQ_nickname();
%>
<%
    String im=request.getParameter("keyWord");

    if(request.getParameter("keyWord")!=null){//검색어가 있으면
    	keyWord=request.getParameter("keyWord");
    	keyField=request.getParameter("keyField");
    }//if
    
    if(request.getParameter("reload")!=null){
    	if(request.getParameter("reload").equals("true")){
    		keyWord="";
    		keyField="";		 
    	}//if
    }//if
%>
    
<%
    BoardDao dao = BoardDao.getInstance(); //dao객체 생성
    vec=dao.getBoardList(keyField, keyWord);//dao메서드 호출
    totalRecord=vec.size();//총 글 갯수
    numPerPage=10;//페이지당 총 글 갯수, 10개글 출력
    pagePerBlock=10;//블럭당 페이지수, 10페이지를 탄 블럭
    
    if(request.getParameter("page")!=null){
    	nowPage=Integer.parseInt(request.getParameter("page"));//현재 페이지
    }//if
    
    beginPerPage = nowPage * numPerPage;//시작 페이지 까지
   
    totalPage=(int)Math.ceil((double)totalRecord/numPerPage);//ceil=올림값 Math.round()
    totalBlock=(int)Math.ceil((double)totalPage/pagePerBlock);//전체블럭계산
    
    if(request.getParameter("nowBlock")!=null){
    	nowBlock=Integer.parseInt(request.getParameter("nowBlock"));//현재 블럭을 얻는다
    }//if
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
			.content1{
				
				position: absolute;
				width: 80%;
				height: 100%;
				left: 10%	
			}
			.content1 h3.title {
				position: absolute;
				margin-left:-34.5%;
				top: 5%;	
				width: 100%;
				height: 26px;
				padding: 0;    
			    line-height: 18px;
			    border-bottom: 3px solid #252525;
			}
			.content1 h3{
				font-weight: bold;    
			    font-size: 17px; 
			    font-family: 맑은 고딕;
			    color: 1d1d1d;   
			    letter-spacing: 0;
			}
			.boardList{
				padding: 0;
				margin: 0;
				border: 0;
				width: 80%;
				height: 43%;
				position:absolute;
				top:11.5%;
				
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
			    text-align: center;
			}
			
			.paging{
				
			    clear: both;
			    text-align: center;
			    position: absolute;
			    width: 100%;
			    height: 5%;
			    top: 53%;	
			    z-index: 1;
			}
			.paging a{
			    display: inline-block;
			    color: #767676;
			    line-height: 15px;
			    min-width: 20px;
			    font-family: Verdana;
			    vertical-align: left;
			    vspace:200px;
			    
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
				width: 29%;
				line-height: 10%;
				top: 85%;
				text-align:right;
	
			}
			.searchForm{
				
				position: absolute;
				width: 80%;
				height: 3%;
				top: 62%;	
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

		    #messagebox{
		    background-color: pink;
		    width: 300px;
		    height: 300px;
		    border:1px solid black;
		    position: fixed;
		    display: block;
		    z-index: 1;
		    }
		    a, a:link, a:active, a:visited{
		    	text-decoration:none;
		    	color:#666;
		    }
		    
		    </style>
		    <script type="text/javascript">
	    
	    	function check(){//검색어가 없는데 검색 눌렀을 때
	    		if(document.searchForm.keyWord.value==''){
	    			alert("검색어를 입력 하시오");
	    			document.searchForm.keyWord.focus();
	    			return false;
	    		}//if
	    		var kWord=document.searchForm.keyWord.value;
	    		var kField=document.searchForm.keyField.value;	    		
	    		movePageUrl('./Board/Quiz_Board/Board_List.jsp?keyWord='+kWord+'&keyField='+kField);
	    		//document.searchForm.submit();
	    	}//check() end
	    	
	    	function pageMove(nb,p){
	    		//alert("nb:"+nb+"p:"+p)
	    		movePageUrl('./Board/Quiz_Board/Board_List.jsp?nowBlock='+nb+'&page='+p);
	    	}
	    	
	    	function list(){//리스트 보여주기
	    		document.listForm.action="Board/Quiz_Board/Board_List.jsp";
	    		document.listForm.submit();
	    	}//list() end
	    	
	    	function content(q_num){	
	    		//document.readForm.action="Board/Quiz_Board/Board_Content.jsp";//글 내용 보기
	    		//document.readForm.q_num.value=value;//글번호	    		
	    		  //$(this).load("Board_Content.jsp");
	    		//document.readForm.submit();
	    		
	    		movePageUrl('/Colosseum/Board/Quiz_Board/Board_Content.jsp?q_num='+q_num);
	    		
	    		
	    	}//read() end
	    	
	    	$(this).ready(function(){ 		        
	    		$('.receive').on('click',function(e){
	   			    var x=e.pageX;
	   			    var y=e.pageY; 

		    		var recname = $('.receive').eq($(".receive").index($(this))).html()
	   			    var messagebox2= $("#messagebox").width();
	   			    if(messagebox2 <= 0){
	   			    
	   				$("#content").append('<div id="messagebox"><table><tr><td id="123">'+recname+'</td></tr><tr><td><textarea id="456" align="center" rows=15 cols=38></textarea></td></tr></table></div>');
	   				$("#messagebox").css('left',x);
	   				$("#messagebox").css('top',y);
	   				$("#messagebox").append('<div align="center"><button id="msubmit">전송</button> <button id="mreset">취소</button></div>');

	   			    }else{
	   			     $("#messagebox").remove();	     
	   			    }//else
	   			    	
	   				 $("#mreset").on('click',function(){
	            	 $("#messagebox").remove();
	            	 });//mreset click function
	            	 
	   				$("#msubmit").on('click',function(){
	   					$.ajax({ //
		                  url:'./Board/Quiz_Board/Messagedb.jsp', //가져오고자하는 서버페이지 주소를 넣는다. 
		                  type:'post', //데이터를 서버로 전송하게 된다. 
		                  data:{ 
		                         nickname_receive: recname,  //에디터박스의 아이디를 넣으면 해당 에디터박스의 데이터를 보내준다.
		                         msg_content: $('#456').val(),  
		                         nickname_send : "<%= nickname %>"      
		                  } , 
		                  success : function(t){ 
		                                alert('메세지 전송!');
		                  } , 
		                  error : function(){ 
		                            alert('메세지 전송실패'); 
		                  } 
			           });
		   					$("#messagebox").remove();
	   				});
	    		});	//.receive click funciton	
	    	});//ready function()

		    function clicked(nickname){
	    		
		    	movePageUrl('./Board/Quiz_Board/Board_Write.jsp?q_nickname='+nickname);

		    }
		    
		    </script>
	    
	    </head>
    
    <body id="content">
 
    <div class="container">
    	<div class="content1">
    		<table align="center" border=0 width=56%>
	    		<tr>
	    		<td><h3 style=color:#666 class="title">게시판</h3></td>
	    		<td align="right" >
	    			
	    		</td>
	    		</tr>
    		</table>
    	</div> 
    	
    	<%-- 공지사항 테이블  
    	<div> <%@ include file="/Colosseum/Board/Quiz_Board/Board_Notice_List.jsp" %> </div>  --%>
	    
    	<div align="center" width="60%" id="content" class="boardList">	
    	
    	<%
    	if(vec.isEmpty()){
    		out.println("<div style=color:#666>등록한 글이 없습니다</div>");
    	}else{//등록한 글이 있으면
    		%>
    		
    		<table id=listTable border=1 width="56%" cellpadding=2 cellspacing=0>
    	
    		<thead>
	    		<tr align=center height="80%">
	    		<!-- 이게 없으면 테이블 사이즈 조정이 안됩니다 -->
	    		<th width="5%">번호</th> <th width="45%">제목</th><th width="20%">이름</th><th width="20%">날짜</th><th width="10%">조회수</th>	
	  			</tr>
    		</thead>
   
    		<tbody>
    		<%
    		for(int i=beginPerPage; i<(beginPerPage + numPerPage);i++){
    			if(i==totalRecord){break;}//for 탈출		
    			
    			BoardDto dto=(BoardDto)vec.get(i);
    					
    			String q_nickname1=dto.getQ_nickname();
    			String q_subject=dto.getQ_subject();
    			String q_create_time=dto.getQ_create_time();
    			String q_modify_time=dto.getQ_modify_time();
    			 
    			int q_num=dto.getQ_num();
    			int q_read_count=dto.getQ_read_count();
    			int q_notice_num=dto.getQ_notice_num();
    			int q_notice_group=dto.getQ_notice_group();
    			
    			//게시글 시간과 현재 시간 비교하기
    			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    			Date regdate= df.parse(q_create_time); //게시글 작성 시간으 받아와서 Date타입으로 저장
    			
    			Calendar now = Calendar.getInstance();  //현재 시간을 받아온다
    		    Calendar cal = Calendar.getInstance();
    		    cal.setTime(regdate); //게시글 작성시간을 셋팅한다 
    		    
    		    long dateTime1 = now.getTimeInMillis(); //밀리초로 변환
    		    long dateTime2 = cal.getTimeInMillis();
    		    
    		    long result = (dateTime1 - dateTime2)/1000; //두 시간의 차이를 구해서 다시 초로 환산
    		    int hour = (int) Math.round((double)(result / 3600)); //60*60 해서 시각으로 바꾼 후 반올림
    			
    		%>
    		
    		<%if(q_notice_group==0){
    			%>
    			<tr>
    			<td align="center">공지</td>	
    			<td>
    			<%-- 글 보기 --%>
    			<a href="javascript:content('<%=q_num%>')"><%=q_subject %></a>
    			
    			<%
				if(hour<24){//반올림한 시각이 24보다 작은 경우 new이미지 생성
				%>
				<img src = "imgs/ico_new.gif" width="10" height="10">
				<%}%>
    			</td>
    			
    			<td align=center class="receive"><%=q_nickname1 %></td>
    			<td align=center><%=q_create_time %></td>
    			<td align=center><%=q_read_count %></td>
    			</tr>
    			<%
    		}else{
    		 %>
    			<tr>
    			<!--  번호를 역순으로, num와 다르다 -->
    			<td align=center><%=totalRecord-i %></td>
    			<td class="title">
    			<%-- 글 보기 --%>
    			<a href="javascript:content('<%=q_num%>')"><%=q_subject %></a>
    			
    			<%
				if(hour<24){//반올림한 시각이 24보다 작은 경우 new이미지 생성
				%>
				<img src = "imgs/ico_new.gif" width="10" height="10">
				<%}%>
    			</td>
    			
    			<td align=center class="receive"><%=q_nickname1 %></td>
    			<td align=center><%=q_create_time %></td>
    			<td align=center><%=q_read_count %></td>
    			</tr>
    			<%
    			}//else
    		 %>
    			
    			<% }//for %>
    		</table>
    		</div>
    	
    	
    		<%}//else %>
    	
    	</tbody>
    	
    	<div></div>
    	<br>
    	
    	<div align="center" class="paging">

    	
    	<span class="boardBtn">
    		<%--<a href="Board_Write.jsp?q_nickname=<%=nickname%>"> --%>
    		<img src="imgs/boardBtn01.png" onclick="javascript:clicked('<%=nickname%>')">
    	</span>
    	</div>
    	
    	<div class="searchForm">
    	
    	<span>
    	<%
    	if(totalRecord!=0){//글이 존재하면
    		if(nowBlock>0){// 이전 블럭으로 이동
    	%>
    	<a href="./Board/Quiz_Board/Board_List.jsp?nowBlock=<%=nowBlock-1%>&
    	page=<%=((nowBlock-1)*pagePerBlock)%>&
    	keyField=<%=keyField %>&
    	keyWord=<%=keyWord %>">
    	
    	이전블럭 <%=pagePerBlock %>개
    	</a>
    	
    	<% }//if 이전 블럭 끝
    	
    	//-------------------------페이지 처리
    	for(int i=0; i<pagePerBlock; i++){
    		%>
    		<%-- <a href="./Board/Quiz_Board/Board_List.jsp?nowBlock=<%=nowBlock%>&page=<%=(nowBlock*pagePerBlock)+i %>">--%>
    		<a href="javascript:pageMove(<%=nowBlock%>,<%=(nowBlock*pagePerBlock)+i%>)">
    		<%=(nowBlock*pagePerBlock)+i+1 %>
    		</a>
    		<%
    		if(((nowBlock*pagePerBlock)+i+1)==totalPage){
    			//마지막 페이지 얻기
    			break;//for 탈출
    		}//if
    	}//for
    	//---------페이지 처리 끝 --------------
    	//다음블럭
    	if(totalBlock>nowBlock+1){
    		%>
    		<a href="./Board/Quiz_Board/Board_List.jsp?nowBlock=<%=nowBlock+1 %>&
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
    		<form name="searchForm" method="post" action="./Board/Quiz_Board/Board_List.jsp">
	    		<table width="55%" border=0 align=center cellpadding=1 cellspacing=0>
	    		<tr>
	    		<td align=center valign=bottom>
	    		<select name="keyField">
	    			<option value="q_subject">제목</option>
	    			<option value="q_nickname">이름</option>
	    			<option value="q_content">글내용</option>
	    		</select>
	    		
	    		<input type="text" id="keyWord" name="keyWord" size=16>
	    		<input type="hidden" name="page" value="0">
	    		<input type="button" value="검색" id="btnSearch" class="btSearch" onClick="check()">
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
