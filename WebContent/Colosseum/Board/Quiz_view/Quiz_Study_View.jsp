<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="quiz_colosseum.*" import="java.util.*" import="java.text.*"%>
<%
request.setCharacterEncoding("utf-8");
java.util.Date date=new java.util.Date();
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd H:mm:ss");
%>    

<%

%>

<html>
  <head>
    <title>문제상세보기</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="script.js"></script>
  </head>  
  <body topmargin="30">
   <h2>상세보기</h2>
   
   <%
   Quiz_StudyMgr study=Quiz_StudyMgr.getInstance();//DAO객체 얻기
   int q_Num=Integer.parseInt(request.getParameter("q_num"));
   //System.out.print("q_Num:"+q_Num);
   
   Quiz_ListBean bean=study.quizSolve(q_Num);//DAO메서드 호출
   %>
   
   <h2>문제번호:<%=bean.getQ_num() %></h2>
   
   <h2>제목:<%=bean.getQ_title() %> 작성일<%=sdf.format(bean.getQ_create_time()) %> <br>
   <img src="<%=request.getContextPath() %>/imgs/<%=bean.getQ_title_img() %>" width="250" height="100"></h2>
   
   <h2>소제목:<%=bean.getQ_subject() %></h2>
   <h2>설명:<%=bean.getQ_content() %></h2>
   
  <h2>보기</h2>
  
   <% 
   List <String>list=new ArrayList<String>();
   
    
   list.add(bean.getQ_reply1());
   list.add(bean.getQ_reply2());
   list.add(bean.getQ_reply3());
   list.add(bean.getQ_reply4());
   list.add(bean.getQ_reply5());
   list.add(bean.getQ_reply6());
   list.add(bean.getQ_reply7());
   list.add(bean.getQ_reply8());
   list.add(bean.getQ_reply9());
   list.add(bean.getQ_reply10());       
   
   List <String>list2=new ArrayList<String>();
   list2.add(bean.getQ_reply1_img());
   list2.add(bean.getQ_reply2_img());
   list2.add(bean.getQ_reply3_img());
   list2.add(bean.getQ_reply4_img());
   list2.add(bean.getQ_reply5_img());
   list2.add(bean.getQ_reply6_img());
   list2.add(bean.getQ_reply7_img());
   list2.add(bean.getQ_reply8_img());   
   list2.add(bean.getQ_reply9_img());
   list2.add(bean.getQ_reply10_img());
   %>
    
  
   <%
   for(int i=0;i<list.size();i++){
	   %>
	   <h3><%=list.get(i) %>&nbsp;&nbsp;&nbsp;&nbsp;<%=list2.get(i) %></h3>
	   <%
	   
   }%>
   
   
   
  </body>
