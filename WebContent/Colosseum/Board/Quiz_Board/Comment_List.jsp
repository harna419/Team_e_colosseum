<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Comment.*" import="java.util.*" import="Board.*" %>

<%
	request.setCharacterEncoding("utf-8");
	//String q_nickname = (String) session.getAttribute("q_nickname");//id 이름에 있는 값 얻기

	String q_nickname4 = "이제훈";
	int q_zone=Integer.parseInt(request.getParameter("q_num"));
	
	System.out.println("q_zone"+q_zone);
%>

<%
	String str2 = "";
	int nowPage2 = 0;//현재 페이지
	int nowBlock2 = 0;//현재 블럭

	int totalRecord2 = 0;//전체 글 갯수
	int numPerPage2 = 0;//페이지당 글 갯수, 1 페이지에 10개씩
	int totalPage2 = 0;//전체 페이지 수

	int totalBlock2 = 0;//전체 블럭수
	int pagePerBlock2 = 0;//블럭당 페이지 수 10개
	int beginPerPage2 = 0;//시작 페이지 (페이지의 시작)

	Vector vec2 = null;
%>

<%
	CmtDao cdao = CmtDao.getInstance();

	BoardDto bdto= new BoardDto();
	BoardDao bdao= new BoardDao();
	
	bdto=bdao.getBoard(q_zone);
	
	//int q_zone=Integer.parseInt(request.getParameter("q_num"));
	
	System.out.println(q_zone);
	
	/////////////////////////////////////////

	vec2 = cdao.getCommentList(q_zone);//dao메서드 호출
	totalRecord2 = vec2.size();//총 글갯수
	numPerPage2 = 10;//페이지당 글 갯수, 10개글 출력
	pagePerBlock2 = 10;//블럭당 페이지 수, 10페이지를 한 블럭
	

	if (request.getParameter("page") != null) {
		nowPage2 = Integer.parseInt(request.getParameter("page"));//현재 페이지

	}//if 

	beginPerPage2 = nowPage2 * numPerPage2; //시작 페이지 계산

	totalPage2 = (int) Math.ceil((double) totalRecord2 / numPerPage2);//Math.ceil()=>올림값 
	totalBlock2 = (int) Math.ceil((double) totalPage2 / pagePerBlock2);//전체블럭계산

	if (request.getParameter("nowBlock") != null) {
		nowBlock2 = Integer.parseInt(request.getParameter("nowBlock"));//현재 블럭을 얻는다 
	}//if
%>



	<table width=10% cellspacing=0 cellpadding=3 align=center>
		<tr>
			<td bgcolor="#ffd0cd" height=21 align=center><font size=4>댓글</font>
			</td>
		</tr>
	</table>
	<br>
	<form id="commentForm" method="post" action="Comment_WriteProc.jsp">
		<table bgcolor=ffd0cd align=center width=70% border=0>

			<tr>
 
				<td><%=q_nickname4 %></td>
			</tr>

			<tr>

				<td><textarea name=q_comment cols=70% rows=5></textarea></td>
			</tr>

			<td align=right>
				<input type=submit value=등록>
				<input id="test" type=button value=test onclick="check()">  
				<input type=reset value=취소>

				<input type="hidden" value="<%=bdto.getQ_num() %>" name="q_zone">
				<input type="hidden" value="<%=q_nickname4%>" name="q_nickname">
				<input type=hidden name=q_ip value="<%=request.getRemoteAddr()%>"></td>
		</table>
	</form>

	
	<hr>

	<%
		for (int i = beginPerPage2; i < (beginPerPage2 + numPerPage2); i++) {
			if (i == totalRecord2) {
				break;
			}//for 탈출 

			CmtDto cdto = (CmtDto) vec2.get(i);
					
					
			String q_nickname3=cdto.getQ_nickname();
			String q_comment = cdto.getQ_comment();
			String q_create_time2 = cdto.getQ_create_time();
			int q_comment_depth = cdto.getQ_comment_depth();
			int q_num2 = cdto.getQ_num();
			int q_zone2=cdto.getQ_zone();

			if (q_comment_depth > 0) {
				str2 = "ffb0cf";
			} else {
				str2 = "ffdab9";
			}
	%>

	<table bgcolor="<%=str2%>" align=center width=70% border=0>


		<tr>

			<td><%=q_nickname3%></td>
		</tr>

		<tr>

			<td><%=q_comment%></td>
		</tr>

		
			<td><%=q_create_time2%></td>

		<td align=right>
		
		<a href="Comment_Reply.jsp?page=<%=nowPage2%>&q_num=<%=q_num2%>"><input type=button value=답글></a>
		<a href="Comment_Update.jsp?page=<%=nowPage2%>&q_num=<%=q_num2%>"><img src="../imgs/modify.png"></a> 		 
		<a href="Comment_Delete.jsp?page=<%=nowPage2%>&q_num=<%=q_num2%>"><img src="../imgs/delete.png"></a></td>

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
				if (totalRecord2 != 0) {//글이 존재하면
					if (nowBlock2 > 0) {//이전 블럭으로 이동
			%> <a
				href="Comment_List.jsp?nowBlock=<%=nowBlock2 - 1%>&page=<%=((nowBlock2 - 1) * pagePerBlock2)%>">

					[이전블럭 <%=pagePerBlock2%>]개
			</a> <%
 	}//if 이전 블럭 끝

 		//---- 페이지 처리 
 		for (int i = 0; i < pagePerBlock2; i++) {
 %> <a
				href="Comment_List.jsp?nowBlock=<%=nowBlock2%>&page=<%=(nowBlock2 * pagePerBlock2) + i%>">
					[<%=(nowBlock2 * pagePerBlock2) + i + 1%>]
			</a> <%
 	if (((nowBlock2 * pagePerBlock2) + i + 1) == totalPage2) {
 				//마지막 페이지 인가
 				break;//for 탈출 
 			}
 		}//for 

 		//---- 페이지 처리 끝 ----
 		//다음블럭
 		if (totalBlock2 > nowBlock2 + 1) {
 %> <a href="Comment_List.jsp?nowBlock=<%=nowBlock2 + 1%>&page=<%=(nowBlock2 + 1) * pagePerBlock2%>">
					[다음블럭<%=pagePerBlock2%>]개
			</a> <%
 	}//if

 	}//if 글이 존재하면 끝
 %>
			</td>

		</tr>
	</table>

