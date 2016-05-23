<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="quiz_colosseum.*" 
    import="java.util.*" 
    import="java.text.*"%>
<%
request.setCharacterEncoding("utf-8");
java.util.Date date=new java.util.Date();
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd H:mm:ss");
Vector vec=null;
%>    

<html>
  <head>
    <title>문제상세보기</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
   		<%--유효성체크 --%>
   		
    	var id
   		function inputcheck(){
    		<%-- 주관식 유형 --%>
    		if($("#Word_answer1").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer1").focus();
	    		return;
    		}
    		if($("#Word_answer2").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer2").focus();
	    		return;
    		}
    		if($("#Word_answer3").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer3").focus();
	    		return;
    		}
    		if($("#Word_answer4").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer4").focus();
	    		return;
    		}
    		if($("#Word_answer5").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer5").focus();
	    		return;
    		}
    		if($("#Word_answer6").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer6").focus();
	    		return;
    		}
    		if($("#Word_answer7").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer7").focus();
	    		return;
    		}
    		if($("#Word_answer8").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer8").focus();
	    		return;
    		}
    		if($("#Word_answer9").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer9").focus();
	    		return;
    		}
    		if($("#Word_answer10").val()==""){
    			alert("주관식 답변을 입력하세요");
	    		$("#Word_answer10").focus();
	    		return;
    		}
    		///////////////////////////////////

    		<%-- 객관식 단일 유형 --%>
			if($('#Single_option11').length){
	    		if($('input:radio[name=q_real_reply11]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply11]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인
			
    		if($('#Single_option21').length){
	    		if($('input:radio[name=q_real_reply21]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply21]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인
			
    		if($('#Single_option31').length){
	    		if($('input:radio[name=q_real_reply31]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply31]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인
			
    		if($('#Single_option41').length){
	    		if($('input:radio[name=q_real_reply41]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply41]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인
			
			if($('#Single_option51').length){
	    		if($('input:radio[name=q_real_reply51]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply51]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인
			
			if($('#Single_option61').length){
	    		if($('input:radio[name=q_real_reply61]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply61]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인
			
			if($('#Single_option71').length){
	    		if($('input:radio[name=q_real_reply71]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply71]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인
			
			if($('#Single_option81').length){
	    		if($('input:radio[name=q_real_reply81]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply81]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인
			
			if($('#Single_option91').length){
	    		if($('input:radio[name=q_real_reply91]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply91]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인	
			
			if($('#Single_option101').length){
	    		if($('input:radio[name=q_real_reply101]:checked').length < 1){
	    			alert("객관식 단일 선택해주세요");
	    			$("input:radio[name=q_real_reply101]").focus();
	    			return;
	    		}//if 체크 확인
			}//if tag 여부 확인
    	
    	
    		Quiz_Study_View.submit();
    	}//inputcheck() end
    	
    	
    	
/*
      function back(a,b){
    	  alert("뒤로가기 버튼")
    	  
    	  if(b==1){
    		  //alert("처음페이지입니다")
    		  return;
    		  
    	  }else{
    		  b--;
    		  location.href="Quiz_Study_View.jsp?q_dep_num="+a+"&q_dep_step="+b; 
    		  
    	  }//else
      }//back(a,b) end
      
      function go(a,b,c){
    	  //alert("앞으로가기 버튼")    	  
    	  checked=$("#Single_option"+b+"1:checked").val();
    	  alert("checked:"+checked)  

    	  if(b<c){
    		  b++;
    		  location.href="Quiz_Study_View.jsp?q_dep_num="+a+"&q_dep_step="+b;
    		  
    	  }else{    
    		  alert("마지막페이지입니다")
    	  }//else
    		  
      }//goo(a,b,c) end
      */
    </script>
  </head>  
  <body topmargin="30">
   <%
   Quiz_StudyMgr study=Quiz_StudyMgr.getInstance();//DAO객체 얻기
   
   //Quiz_ListMgr listmgr=Quiz_ListMgr.getInstance();
   
   int q_dep_num=Integer.parseInt(request.getParameter("q_dep_num"));
   session.setAttribute("q_dep_num",new Integer(q_dep_num));
   
   int q_dep_step=Integer.parseInt(request.getParameter("q_dep_step"));
   
   vec=study.quizSolve(q_dep_num,q_dep_step);//DAO메서드 호출
   Quiz_StudyBean cnt=study.quizCount(q_dep_num);//DAO메서드 호출
   %>
   <form name="Quiz_Study_View" id="Quiz_Study_View" method="post" action="Quiz_Study_ViewProc.jsp">
  
	<%
   for(int i=0;i<vec.size();i++){
	   
	   Quiz_StudyBean bean=(Quiz_StudyBean)vec.get(i);
	   int num=i+1;
		//String numint=num+"";//숫자를 문자열로 변환
		//System.out.println("numint : "+numint);
		
	   //System.out.println(vec.size());
   %>
   
  
		<table align="center">
		<tr>
			<td><input type="text" name="q_title" id="title" readOnly value="<%=bean.getQ_title() %>" size=60></td>
			<td></td>
		</tr>
	
	<%
		String type=bean.getQ_quiz_type();
		if(type.equals("100")){
	%>
	        <tr>
	          <td>
	          <input type="text" name="q_subject<%=num %>" id="Word_subject<%=num %>" size="60" value="<%=bean.getQ_subject() %>">
	          </td>
	        </tr>
	        
	        <tr>
	          <td>
	          <input type="text" name="q_content<%=num %>" id="Word_content<%=num %>" size="60" value="<%=bean.getQ_content() %>">
	          </td>
	        </tr>
	        <tr>
	          <td><img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_content_img() %>" width="450" height="450"></td>
	        </tr>
	        
	        <tr>
	            <td><input type="text" name="q_real_reply<%=num %>" id="Word_answer<%=num %>" size="60" value="asd"></td>   
	        </tr>
	        
			<%
		}else if(type.equals("200")){
			%>
	        <tr>
	          <td>
	          <input type="text" name="q_subject" id="Single_subject" size="60" value="<%=bean.getQ_subject() %>">
	          </td>
	        </tr>
	        
	        <tr>
	          <td>
	          <input type="text" name="q_content" id="Single_content" size="60" value="<%=bean.getQ_content() %>">
	          </td>
	        </tr>
	        <tr>
	          <td><img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_content_img() %>" width="450" height="450"></td>
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
	          	}//if end
	          	if(reply2==null){
	          		reply2="";
	          	}//if end
	          	if(reply3==null){
	          		reply3="";
	          	}//if end
	          	if(reply4==null){
	          		reply4="";
	          	}//if end
	          	if(reply5==null){
	          		reply5="";
	          	}//if end
	          	if(reply6==null){
	          		reply6="";
	          	}//if end
	          	if(reply7==null){
	          		reply7="";
	          	}//if end
	          	if(reply8==null){
	          		reply8="";
	          	}//if end
	          	if(reply9==null){
	          		reply9="";
	          	}//if end
	          	if(reply10==null){
	          		reply10="";
	          	}//if end
	          	%>
	          	
	          	<%
	          	if(!((reply1.equals(null))||reply1.length()<=0||(reply1.equals(""))))
	          	{
	   			%>	
	   				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="1"><%=bean.getQ_reply1() %>
	   				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply1_img() %>" width="100" height="100">
	  				<%
   				}//if end
	  			
	          	if(!((reply2.equals(null))||reply2.length()<=0||(reply2.equals(""))))
	          	{
					%>
	  				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="2"><%=bean.getQ_reply2() %>
	  				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply2_img() %>" width="100" height="100"><br>
	 				<%
   				}//if end//if end
	  			
	  			if(!((reply3.equals(null))||reply3.length()<=0||(reply3.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="3"><%=bean.getQ_reply3() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply3_img() %>" width="100" height="100">
    				<%
   				}//if end

	  			if(!((reply4.equals(null))||reply4.length()<=0||(reply4.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="4"><%=bean.getQ_reply4() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply4_img() %>" width="100" height="100"><br>
    				<%
   				}//if end
	  			
	  			if(!((reply5.equals(null))||reply5.length()<=0||(reply5.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="5"><%=bean.getQ_reply5() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply5_img() %>" width="100" height="100">
    				<%
   				}//if end
	  			
	  			if(!((reply6.equals(null))||reply6.length()<=0||(reply6.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="6"><%=bean.getQ_reply6() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply6_img() %>" width="100" height="100"><br>
    				<%
   				}//if end
	  			
	  			if(!((reply7.equals(null))||reply7.length()<=0||(reply7.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="7"><%=bean.getQ_reply7() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply7_img() %>" width="100" height="100">
    				<%
   				}//if end
	  			
	  			if(!((reply8.equals(null))||reply8.length()<=0||(reply8.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="8"><%=bean.getQ_reply8() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply8_img() %>" width="100" height="100"><br>
    				<%
   				}//if end
	  			
	  			if(!((reply9.equals(null))||reply9.length()<=0||(reply9.equals(""))))
	  			{
   					%>
     				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="9"><%=bean.getQ_reply9() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply9_img() %>" width="100" height="100">
    				<%
   				}//if end
	  			
	  			if(!((reply10.equals(null))||reply10.length()<=0||(reply10.equals(""))))
	  			{
	  				%>
    				 <input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="10"><%=bean.getQ_reply10() %>
    				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply10_img() %>" width="100" height="100"><br>
   					<%
   				}//if end
	 	
		}
   
		%>
		<tr>
			<td>
				<hr size='1' color='blue'>
			</td>
		</tr>


		</table>
	<% 
	}//vec get(i) for end
	%>
	<table align="center">
		<tr>
			<td>
				<input type="button" onclick="inputcheck()" value="완료">
			</td>
		</tr>
	</table>
		
	</form>
  
