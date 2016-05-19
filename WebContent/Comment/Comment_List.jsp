<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Comment.*" import="java.util.*"%>

<%
	request.setCharacterEncoding("utf-8");
	//String q_nickname = (String) session.getAttribute("q_nickname");//id 이름에 있는 값 얻기

	String q_nickname = "이제훈";
%>

<%
	String str = "";
	int nowPage = 0;//현재 페이지
	int nowBlock = 0;//현재 블럭

	int totalRecord = 0;//전체 글 갯수
	int numPerPage = 0;//페이지당 글 갯수, 1 페이지에 10개씩
	int totalPage = 0;//전체 페이지 수

	int totalBlock = 0;//전체 블럭수
	int pagePerBlock = 0;//블럭당 페이지 수 10개
	int beginPerPage = 0;//시작 페이지 (페이지의 시작)

	String keyField = "";//키 필드
	String keyWord = "";//검색 단어 
	Vector vec = null;
%>
<%
	String im = request.getParameter("keyWord");

	if (request.getParameter("keyWord") != null) {//검색어가 있으면
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	System.out.println("");
	if (request.getParameter("reload") != null) {//그냥 리스트 보기 
		if (request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}//if
	}//if
%>


<%
	CmtDao dao = CmtDao.getInstance();
	vec = dao.getCommentList(keyField, keyWord);//dao메서드 호출
	totalRecord = vec.size();//총 글갯수
	numPerPage = 10;//페이지당 글 갯수, 10개글 출력
	pagePerBlock = 10;//블럭당 페이지 수, 10페이지를 한 블럭

	if (request.getParameter("page") != null) {
		nowPage = Integer.parseInt(request.getParameter("page"));//현재 페이지

	}//if 

	beginPerPage = nowPage * numPerPage; //시작 페이지 계산
	//				0	   * 10 =  0 ~ 9;// 해당 페이지의 시작
	//				1	   * 10 = 10 ~ 19
	//				2	   * 10 = 20 ~ 29
	//				3	   * 10 = 30 ~ 39
	//				4	   * 10 = 40 ~ 49

	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);//Math.ceil()=>올림값 
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);//전체블럭계산

	if (request.getParameter("nowBlock") != null) {
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));//현재 블럭을 얻는다 
	}//if
%>



	<table width=10% cellspacing=0 cellpadding=3 align=center>
		<tr>
			<td bgcolor="#ffd0cd" height=21 align=center><font size=4>댓글</font>
			</td>
		</tr>
	</table>
	<br>
	<form method="post" action="Comment_WriteProc.jsp">
		<table bgcolor=ffd0cd align=center width=70% border=0>

			<tr>
 
				<td><%=q_nickname %></td>
			</tr>

			<tr>

				<td><textarea name=q_comment cols=70% rows=5></textarea></td>
			</tr>

			<td align=right>
				<input type=submit value=등록>
				
				<input type=reset value=취소>
				<input type="hidden" value="<%=q_nickname%>" name="q_nickname">
				<input type=hidden name=q_ip value="<%=request.getRemoteAddr()%>"></td>
		</table>
	</form>

	
	<hr>

	<%
		for (int i = beginPerPage; i < (beginPerPage + numPerPage); i++) {
			if (i == totalRecord) {
				break;
			}//for 탈출 

			CmtDto dto = (CmtDto) vec.get(i);
					
					
			//String q_nickname=dto.getQ_nickname();
			String q_comment = dto.getQ_comment();
			String q_create_time = dto.getQ_create_time();
			int q_comment_depth = dto.getQ_comment_depth();
			int q_num = dto.getQ_num();

			if (q_comment_depth > 0) {
				str = "ffb0cf";
			} else {
				str = "ffdab9";
			}
	%>

	<table bgcolor="<%=str%>" align=center width=70% border=0>


		<tr>

			<td><%=q_nickname%></td>
		</tr>

		<tr>

			<td><%=q_comment%></td>
		</tr>

		
			<td><%=q_create_time%></td>

		<td align=right>
		
		<a href="Comment_Reply.jsp?page=<%=nowPage%>&q_num=<%=q_num%>"><input type=button value=답글></a>
		<a href="Comment_Update.jsp?page=<%=nowPage%>&q_num=<%=q_num%>"><img src="../imgs/modify.png"></a> 		 
		<a href="Comment_Delete.jsp?page=<%=nowPage%>&q_num=<%=q_num%>"><img src="../imgs/delete.png"></a></td>

	</table>
	
	<% 
		}//for end 
	%>
	<table>
		<tr>
			<td><br></td>
		</tr>

		<tr>
			<td align=center> <%
				if (totalRecord != 0) {//글이 존재하면
					if (nowBlock > 0) {//이전 블럭으로 이동
			%> <a
				href="Comment_List.jsp?nowBlock=<%=nowBlock - 1%>&page=<%=((nowBlock - 1) * pagePerBlock)%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">

					[이전블럭 <%=pagePerBlock%>]개
			</a> <%
 	}//if 이전 블럭 끝

 		//---- 페이지 처리 
 		for (int i = 0; i < pagePerBlock; i++) {
 %> <a
				href="Comment_List.jsp?nowBlock=<%=nowBlock%>&page=<%=(nowBlock * pagePerBlock) + i%>">
					[<%=(nowBlock * pagePerBlock) + i + 1%>]
			</a> <%
 	if (((nowBlock * pagePerBlock) + i + 1) == totalPage) {
 				//마지막 페이지 인가
 				break;//for 탈출 
 			}
 		}//for 

 		//---- 페이지 처리 끝 ----
 		//다음블럭
 		if (totalBlock > nowBlock + 1) {
 %> <a
				href="Comment_List.jsp?nowBlock=<%=nowBlock + 1%>&page=<%=(nowBlock + 1) * pagePerBlock%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">

					[다음블럭<%=pagePerBlock%>]개
			</a> <%
 	}//if

 	}//if 글이 존재하면 끝
 %>
			</td>

		</tr>
	</table>

