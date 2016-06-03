<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="quiz_colosseum.*" 
    import="java.util.*" 
    import="java.text.*"
%>
<%
request.setCharacterEncoding("UTF-8");

Quiz_StudyMgr studyMgr=Quiz_StudyMgr.getInstance();//dao객체얻기

//out.println("q_dep_num:"+session.getAttribute("q_dep_num"));
//int q_dep_num=(Integer)session.getAttribute("q_dep_num");
int q_dep_num=Integer.parseInt(request.getParameter("q_dep_num"));
int q_dep_step=Integer.parseInt(request.getParameter("q_dep_step"));
String q_id=request.getParameter("q_id");

//out.println("q_dep_step:"+q_dep_step);
System.out.println("q_dep_num:"+q_dep_num);
System.out.println("q_dep_step:"+q_dep_step);
System.out.println("q_id:"+q_id);

studyMgr.quiz_ResultHistory(request,q_dep_num,q_dep_step,q_id);//메서드 호출

String url22=request.getContextPath();
System.out.print("url22="+url22);
%>

<script>
location.href="<%=url22%>/Colosseum/Main_template.jsp?q_dep_num=<%=q_dep_num%>&q_dep_step=<%=q_dep_step%>&afternum=11";
</script>
