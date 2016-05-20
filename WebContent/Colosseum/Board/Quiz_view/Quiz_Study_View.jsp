<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="quiz_colosseum.*" 
    import="java.util.*" 
    import="java.text.*"%>
<%
request.setCharacterEncoding("utf-8");
java.util.Date date=new java.util.Date();
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd H:mm:ss");
%>    

<html>
  <head>
    <title>문제상세보기</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="script.js">

    
    </script>
    
    
    
  </head>  
  <body topmargin="30">
   <%
   Quiz_StudyMgr study=Quiz_StudyMgr.getInstance();//DAO객체 얻기
   //Quiz_ListMgr listmgr=Quiz_ListMgr.getInstance();
   
   int q_dep_num=Integer.parseInt(request.getParameter("q_dep_num"));
   int q_dep_step=Integer.parseInt(request.getParameter("q_dep_step"));
   
   Quiz_ListBean bean=study.quizSolve(q_dep_num,q_dep_step);//DAO메서드 호출
   Quiz_ListBean cnt=study.quizCount(q_dep_num);//DAO메서드 호출
   %>
   
   <form name="Quiz_Study_View.jsp" id="Quiz_Study_View.jsp" method="post" action="" enctype="multipart/form-data">
		<table align="center">
		<tr>
			<td><input type="text" name="q_title" id="subject" value="<%=bean.getQ_title() %>" size=50></td>
			<td></td>
		</tr>
		<%
		String type=bean.getQ_quiz_type();
		if(type.equals("100")){
			%>
	        <tr>
	          <td>
	          <input type="text" name="q_subject" id="Single_subject" size="50" value="<%=bean.getQ_subject() %>">
	          </td>
	        </tr>
	        
	        <tr>
	          <td>
	          <input type="text" name="q_content" id="Single_content" size="50" value="<%=bean.getQ_content() %>">
	          </td>
	        </tr>
	        <tr>
	          <td><img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_content_img() %>" width="370" height="450"></td>
	        </tr>
	        
	        <tr>
	            <td><input type="text" name="q_real_reply1" id="Word_answer" size="50" value=""></td>   
	        </tr>
	      
			<%
		}else if(type.equals("200")){
			%>
	        <tr>
	          <td>
	          <input type="text" name="q_subject" id="Single_subject" size="50" value="<%=bean.getQ_subject() %>">
	          </td>
	        </tr>
	        
	        <tr>
	          <td>
	          <input type="text" name="q_content" id="Single_content" size="50" value="<%=bean.getQ_content() %>">
	          </td>
	        </tr>
	        <tr>
	          <td><img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_content_img() %>" width="370" height="450"></td>
	        </tr>
	        
	        <tr>
	          <td>
	          <%
	         	//reply1~10까지 변수에 넣기
	        	String reply1=bean.getQ_reply1();
	          	String reply2=bean.getQ_reply2();
	          	String reply3=bean.getQ_reply3();  
	          	String reply4=bean.getQ_reply4();  
	          	String reply5=bean.getQ_reply5();  
	          	String reply6=bean.getQ_reply6();  
	          	String reply7=bean.getQ_reply7();  
	          	String reply8=bean.getQ_reply8();  
	          	String reply9=bean.getQ_reply9();  
	          	String reply10=bean.getQ_reply10(); 
	         	
	          	//null값 empty'' 변경
	          	if(reply1==null){
	          		reply1="";
	          	}
	          	if(reply2==null){
	          		reply2="";
	          	}
	          	if(reply3==null){
	          		reply3="";
	          	}
	          	if(reply4==null){
	          		reply4="";
	          	}
	          	if(reply5==null){
	          		reply5="";
	          	}
	          	if(reply6==null){
	          		reply6="";
	          	}
	          	if(reply7==null){
	          		reply7="";
	          	}
	          	if(reply8==null){
	          		reply8="";
	          	}
	          	if(reply9==null){
	          		reply9="";
	          	}
	          	if(reply10==null){
	          		reply10="";
	          	}
	          	%>
	          	
	          	<%
	          	if(!((reply1.equals(null))||reply1.length()<=0||(reply1.equals(""))))
	          	{
	   			%>	
	   				 <input type="radio" name="Single_option"><%=bean.getQ_reply1() %>
	   				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply1_img() %>" width="100" height="100">
	  				<%
   				}
	  			
	          	if(!((reply2.equals(null))||reply2.length()<=0||(reply2.equals(""))))
	          	{
					%>
	  				 <input type="radio" name="Single_option" ><%=bean.getQ_reply2() %>
	  				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply2_img() %>" width="100" height="100"><br>
	 				<%
   				}
	  			
	  			if(!((reply3.equals(null))||reply3.length()<=0||(reply3.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="Single_option" ><%=bean.getQ_reply3() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply3_img() %>" width="100" height="100">
    				<%
   				}

	  			if(!((reply4.equals(null))||reply4.length()<=0||(reply4.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="Single_option" ><%=bean.getQ_reply4() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply4_img() %>" width="100" height="100"><br>
    				<%
   				}
	  			
	  			if(!((reply5.equals(null))||reply5.length()<=0||(reply5.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="Single_option" ><%=bean.getQ_reply5() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply5_img() %>" width="100" height="100">
    				<%
   				}
	  			
	  			if(!((reply6.equals(null))||reply6.length()<=0||(reply6.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="Single_option" ><%=bean.getQ_reply6() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply6_img() %>" width="100" height="100"><br>
    				<%
   				}
	  			
	  			if(!((reply7.equals(null))||reply7.length()<=0||(reply7.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="Single_option" ><%=bean.getQ_reply7() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply7_img() %>" width="100" height="100">
    				<%
   				}
	  			
	  			if(!((reply8.equals(null))||reply8.length()<=0||(reply8.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="Single_option" ><%=bean.getQ_reply8() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply8_img() %>" width="100" height="100"><br>
    				<%
   				}
	  			
	  			if(!((reply9.equals(null))||reply9.length()<=0||(reply9.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="Single_option" ><%=bean.getQ_reply9() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply9_img() %>" width="100" height="100">
    				<%
   				}
	  			
	  			if(!((reply10.equals(null))||reply10.length()<=0||(reply10.equals(""))))
	  			{
	  				%>
    				 <input type="radio" name="Single_option" ><%=bean.getQ_reply10() %>
    				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply10_img() %>" width="100" height="100"><br>
   					<%
   				}
	 	
		}
		%>
		<tr>
			<td>
				<hr size='1' color='blue'>
			</td>
		</tr>
		
		
		<input type="text" value="<%=cnt.getCnt() %>">
		<%
		int rowCnt=cnt.getCnt();//선택한 퀴즈의 문제개수
		int endPage=rowCnt;				
		int nowPage=1;
		int startPage=1;
		
		%>
		 
		<%--
		if(rowCnt>1){
		--%>
		<tr>
			<td align="center">
<%-- onclick="location.href='Quiz_Study_View.jsp?q_dep_num=<%=bean.getQ_dep_num()%>&q_dep_step=<%=bean.getQ_dep_step()%>'" --%>
				<input type="button" id="before" name="before" onclick="location.href='Quiz_Study_View.jsp?q_dep_num=1&q_dep_step=1'" value="이전">
				
				<input type="button" id="next" name="next" onclick="location.href='Quiz_Study_View.jsp?q_dep_num=<%=bean.getQ_dep_num()%>&q_dep_step=<%=bean.getQ_dep_step()%>'" value="다음">&nbsp;
			
			</td>
		</tr>	
		<%--
		}//if 문제가2개 이상이면 출력
		
		--%>
		<tr>
			<td align="center">
				<input type="button" value="완료">
			</td>
		</tr>
		</table>	
	</form>
  
