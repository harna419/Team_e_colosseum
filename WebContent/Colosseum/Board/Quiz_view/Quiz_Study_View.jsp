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

int quiznumtest=0;



%>    

<html>
  <head>
    <title>문제상세보기</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> --%>
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
    	
   		function deletecheck(q_dep_num,q_dep_step){
   			alert("퀴즈 삭제 진행합니다.")
	         movePageUrl('/Colosseum/Board/Quiz_view/Quiz_DeleteForm.jsp?q_dep_num='+q_dep_num+'&q_dep_step='+q_dep_step);
	         

    	}

    	
    	
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
      
      $(function(){
    	 $("#test1").show()
    	 $("#test2").hide()
    	 $("#test3").hide()
    	 $("#test4").hide()
    	 $("#test5").hide()
    	 $("#test6").hide()
    	 $("#test7").hide()
    	 $("#test8").hide()
    	 $("#test9").hide()
    	 $("#test10").hide()
      });  
      
      var cnt=1;
      function prevquiz(){  //문제상세보기에서 이전문제
    	  if(cnt==1){
    		  alert("첫번쨰문제입니다")
    		  return
    	  }else{
    		  cnt--
    	  }
    	  if(cnt==1){
    		  $("#test2").hide()
    		  $("#test1").show() 
    	  }
    	  if(cnt==2){
    		  $("#test3").hide()
    		  $("#test2").show()    	     
    	  }if(cnt==3){
    		  $("#test4").hide()
    	      $("#test3").show()
    	  }
    	  if(cnt==4){
    		  $("#test5").hide()
    	      $("#test4").show()
    	  }
    	  if(cnt==5){
    		  $("#test6").hide()
    	      $("#test5").show()
    	  }
    	  if(cnt==6){
    		  $("#test7").hide()
    	      $("#test6").show()
    	  }
    	  if(cnt==7){
    		  $("#test8").hide()
    	      $("#test7").show()
    	  }
    	  if(cnt==8){
    		  $("#test9").hide()
    	      $("#test8").show()
    	  }
    	  if(cnt==9){
    		  $("#test10").hide()
    	      $("#test9").show()
    	  }    	  
      }//prevquiz()
      
      function nextquiz(quizcnt){ //문제상세보기에서 다음문제    	  
    	  
    	  if(quizcnt<=cnt){
    		  alert("마지막문제입니다")
    		  return
    	  }else{
    		  cnt++
    	  }
    	  
    	  if(cnt==2){
    		  $("#test1").hide()
    		  $("#test2").show()    	     
    	  }if(cnt==3){
    		  $("#test2").hide()
    	      $("#test3").show()
    	  }
    	  if(cnt==4){
    		  $("#test3").hide()
    	      $("#test4").show()
    	  }
    	  if(cnt==5){
    		  $("#test4").hide()
    	      $("#test5").show()
    	  }
    	  if(cnt==6){
    		  $("#test5").hide()
    	      $("#test6").show()
    	  }
    	  if(cnt==7){
    		  $("#test6").hide()
    	      $("#test7").show()
    	  }
    	  if(cnt==8){
    		  $("#test7").hide()
    	      $("#test8").show()
    	  }
    	  if(cnt==9){
    		  $("#test8").hide()
    	      $("#test9").show()
    	  }
    	  if(cnt==10){
    		  $("#test9").hide()
    	      $("#test10").show()
    	  }
    	 
      }//nextquiz()
      
    </script>
    
<style type="text/css">
   
.container{
	position: absolute;
	width: 100%;
	height: 100%;
}
.contentWrap{
	
	position: absolute;
	width: 80%;
	height: 100%;
	left: 6.5%;		
}
.contentWrap h3{
	font-weight: bold;    
    font-size: 20px; 
    font-family: "맑은 고딕";
    color: #fff;   
    letter-spacing: 0;
}
.contentWrap h3.title {
	position: absolute;
	top: 6.5%;	
	left: 20%;
	width: 60%;
	height: 26px;
	padding: 0;    
    line-height: 18px;
    border-bottom: 3px solid #fff;
}
.test{
	background-color: #4E94D4;
	position: absolute;
	width: 100%;
	height: 75%;
	top: 11.593%;
	
}
.board{	
	position: absolute;
	width: 60%;
	height: 100%;
	left: 20%;
	border-bottom: 1px solid #fff;	
}
.title_con{
	
	font-weight: bold;    
	font-size: 16px;
	font-family: '맑은고딕';
	color: #fff;
	line-height: 20px;
	letter-spacing: -1px;
	margin: 0;
	padding: 5px 0 10px 20px;
	border: 1px solid #d8d8d8;
	border-top: 0; 
}
.content{
	
	height: 12px;
    line-height: 12px;
    font-size: 12px;
	font-family: '맑은고딕';
	color: #fff;
    margin: 0;
    padding: 5px 0 10px 20px;
    border: 1px solid #d8d8d8;
    border-top: 0;
}
.img{	
	position: absolute;
	width: 100%;
	height: 84%;
	
}
.reply{
	position: absolute;
	width: 100%;
	height: 3%;
	top: 93%;
	font-family: '맑은고딕';
	left:25%;
}
.button{
	position: absolute;
	width: 60%;
	height: 5%;
	left: 20%;
	top: 88%;	
}
.pre{
	float:left;
	margin-top: 22%;
	
}
.next{
	float: right;
	margin-top: 22%;
}

.submitbutton{
	border:0;
    background: #ffffff;
    color: #4E94D4;
    cursor: pointer;
    position: absolute;
    font-family: "museo-sans",sans-serif;
    font-size: 13px;
    font-weight: bold;
    letter-spacing: 1px;
    left: 69.3%;
    text-transform: uppercase;
    opacity: 1;
    width: 80px;
    padding: 5px 10px;
    
}
.updatebutton{
	border:0;
 	background: #ffffff;
    color: #4E94D4;
    cursor: pointer;
    position: absolute;
    font-family: "museo-sans",sans-serif;
    font-size: 13px;
    font-weight: bold;
    letter-spacing: 1px;
    left: 79.8%;
    text-transform: uppercase;
    opacity: 1;
    width: 80px;
    padding: 5px 10px;
}
.deletebutton{
	border:0;
 	background: #ffffff;
    color: #4E94D4;
    cursor: pointer;
    position: absolute;
    font-family: "museo-sans",sans-serif;
    font-size: 13px;
    font-weight: bold;
    letter-spacing: 1px;
    left: 90.3%;
    text-transform: uppercase;
    opacity: 1;
    width: 80px;
    padding: 5px 10px;
}
.single1{
	position:relative;
	display:inline-block;
	width:40%;
	hegiht:40%;
	margin-right:-170px;
	
}

.single2{
	position:relative;
	display:inline-block;
	width:40%;
	height:40%;
	margin-right:-170px;
	
}
#si1{
margin-top: 50%;	
margin-left: 10px;
margin-right: 10px;
}
#si2{
display:inline-block;
margin-top: 1%;
margin-left: 1%;
margin-right: 1%;

}


   
</style>

  </head>  
  <body topmargin="30">
   <%
   Quiz_StudyMgr study=Quiz_StudyMgr.getInstance();//DAO객체 얻기
   
   //Quiz_ListMgr listmgr=Quiz_ListMgr.getInstance();
   
   int q_dep_num=Integer.parseInt(request.getParameter("q_dep_num"));
   session.setAttribute("q_dep_num",new Integer(q_dep_num));
   
   int q_dep_step=Integer.parseInt(request.getParameter("q_dep_step"));
   //q_dep_step1=study.quizCount(q_dep_num);
   
   
    
   vec=study.quizSolve(q_dep_num,q_dep_step);//DAO메서드 호출
   Quiz_StudyBean quiz = study.quizCount(q_dep_num);//DAO메서드 호출
   
   int quizcnt=quiz.getCnt();


  
   
   %>
<div class="container">
<div class="contentWrap">
<h3 class="title"> QUIZ </h3>
   <form name="Quiz_Study_View" id="Quiz_Study_View" method="post" action="./Board/Quiz_view/Quiz_Study_ViewProc.jsp">
    <input type="hidden" name="q_dep_step" value="<%=vec.size()%>">
    

    
	<%
   for(int i=0;i<vec.size();i++){
	   
	   Quiz_StudyBean bean=(Quiz_StudyBean)vec.get(i);
	   int num=i+1;
	   
	   
		//String numint=num+"";//숫자를 문자열로 변환
		//System.out.println("numint : "+numint);
		
	   //System.out.println(vec.size());
   %>
   

	
		<div id="test<%=num%>" class="test">
		
		<tr>
			<td><input type="hidden" name="q_title" id="title" readOnly value="<%=bean.getQ_title() %>" size=60></td>
			<td></td>
		</tr>
	
	<%
		String type=bean.getQ_quiz_type();
		if(type.equals("100")){
	%>
			<div class="board">
	          <p class="title_con" name="q_subject<%=num %>" readOnly id="Word_subject<%=num %>"><%=bean.getQ_subject() %></p>


	          <div class="content" name="q_content<%=num %>" readOnly id="Word_content<%=num %>"><%=bean.getQ_content() %></div>
	    
	     
	          <div class="img"><img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_content_img() %>" width="100%" height="100%" align="center"></div>
	        
	        
	          <p class="reply"><input type="text" name="q_real_reply<%=num %>1" id="Word_answer<%=num %>1" style="height:100%" size="53" required="required" value=""></p>
	        
	        <input type="hidden" name="q_quiz_type<%=num %>" value="100">
           </div><!-- board -->
       
			<%
		}else if(type.equals("200")){
			%>
			
			<span class="board">
	          <p class="title_con" name="q_subject<%=num %>" readOnly id="Single_subject<%=num %>"><%=bean.getQ_subject() %></p>


	          <div class="content" name="q_content<%=num %>" readOnly id="Single_content<%=num %>"><%=bean.getQ_content() %></div>
	    
	     
	          <div class="img"><img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_content_img() %>" width="100%" height="60%" align="center"></div>
	        
	        
           
	        
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
	          	<div id="si1">
	          	<%
	          	if(!((reply1.equals(null))||reply1.length()<=0||(reply1.equals(""))))
	          	{
	   			%>	
	   			
	   				 <div class="single1"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" required="required" id="Single_option<%=bean.getQ_dep_step()%>1" value="1"><%=bean.getQ_reply1() %>
	   				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply1_img() %>" width="30%" height="15%"></div>
	  				<%
   				}//if end
	  			
	          	if(!((reply2.equals(null))||reply2.length()<=0||(reply2.equals(""))))
	          	{
					%>
	  				 <div class="single1"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="2"><%=bean.getQ_reply2() %>
	  				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply2_img() %>" width="30%" height="15%"><br></div>
	 				<%
   				}//if end//if end
	  			
	  			if(!((reply3.equals(null))||reply3.length()<=0||(reply3.equals(""))))
	  			{
   					%>
     				 <div class="single1"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="3"><%=bean.getQ_reply3() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply3_img() %>"width="30%" height="15%"></div>
    				<%
   				}//if end

	  			if(!((reply4.equals(null))||reply4.length()<=0||(reply4.equals(""))))
	  			{
   					%>
     				 <div class="single1"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="4"><%=bean.getQ_reply4() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply4_img() %>"width="30%" height="15%"><br></div>
    				<%
   				}//if end
	  			
	  			if(!((reply5.equals(null))||reply5.length()<=0||(reply5.equals(""))))
	  			{
   					%>
     				 <div class="single1"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="5"><%=bean.getQ_reply5() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply5_img() %>"width="30%" height="15%"></div>
     				 
    				<%
   				}//if end
	  			%></div>
	  			<div id="si2">
	  			<%
	  			if(!((reply6.equals(null))||reply6.length()<=0||(reply6.equals(""))))
	  			{
   					%>
   					
     				 <div class="single2"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="6"><%=bean.getQ_reply6() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply6_img() %>"width="30%" height="15%"><br></div>
    				<%
   				}//if end
	  			
	  			if(!((reply7.equals(null))||reply7.length()<=0||(reply7.equals(""))))
	  			{
   					%>
     				 <div class="single2"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="7"><%=bean.getQ_reply7() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply7_img() %>"width="30%" height="15%"></div>
    				<%
   				}//if end
	  			
	  			if(!((reply8.equals(null))||reply8.length()<=0||(reply8.equals(""))))
	  			{
   					%>
     				 <div class="single2"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="8"><%=bean.getQ_reply8() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply8_img() %>"width="30%" height="15%"><br></div>
    				<%
   				}//if end
	  			
	  			if(!((reply9.equals(null))||reply9.length()<=0||(reply9.equals(""))))
	  			{
   					%>
     				 <div class="single2"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="9"><%=bean.getQ_reply9() %>
     				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply9_img() %>"width="30%" height="15%"></div>
    				<%
   				}//if end
	  			
	  			if(!((reply10.equals(null))||reply10.length()<=0||(reply10.equals(""))))
	  			{
	  				%>
    				 <div class="single2"><input type="radio" name="q_real_reply<%=bean.getQ_dep_step()%>1" id="Single_option<%=bean.getQ_dep_step()%>1" value="10"><%=bean.getQ_reply10() %>
    				 <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_reply10_img() %>"width="30%" height="15%"><br></div>
    				 
   					<%
   				}//if end
   				%>
   				</div>
   				
	  			<input type="hidden" name="q_quiz_type<%=num %>" value="200">
	  			</span><!-- board --> 
	  		<%}//else if
   
		%>

		<input type="hidden" name="q_quiz_type<%=num %>" value="200">
		
		<div class="pre"><img src="../Colosseum/imgs/left_key.png" onclick="prevquiz()" value="이전문제"></div>
		<div class="next"><img src="../Colosseum/imgs/right_key.png" onclick="nextquiz(<%=quizcnt %>)" value="다음문제"></div>
		</div><!-- test -->

	<% 
	}//vec get(i) for end
	%>
	<div class="button">
		<tr> 
			<td>
			
				
				<input type="button" class="submitbutton" onclick="inputcheck()" value="FIN">
				
				<input type="button" class="updatebutton" onclick="document.location.href='updateForm.jsp?q_dep_num=<%=q_dep_num%>&q_dep_step=<%=q_dep_step%>'" value="MOD">
				<input type="button" class="deletebutton" onclick="deletecheck(<%=q_dep_num%>,<%=q_dep_step%>)" value="DEL">
				<%--<input type="button" onclick="document.location.href='delForm.jsp?q_dep_num=<%=q_dep_num%>&q_dep_step=<%=q_dep_step%>'" value="삭제"> --%>
				
				
			</td>
		</tr>
	</table>
	</div><!-- button -->		
	</form>
</div><!-- contentWrap -->
</div><!-- container -->
	
  </body>
  </html>
  
