<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Qna.*"
    import="java.util.*"
    %>
    
<%
request.setCharacterEncoding("utf-8");
int q_group=0;
%>

<%
QnaDao dao=QnaDao.getInstance();
Vector vec1=dao.getFaqList_u(q_group);
Vector vec2=dao.getFaqList_s(q_group);
Vector vec3=dao.getFaqList_e(q_group);
int totalRecord1=vec1.size();
int totalRecord2=vec2.size();
int totalRecord3=vec3.size();
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ List</title>
<style type="text/css">
/* toggle */

	/*
	a:hover{background-color: #a5e3e6;	
	}*/
	a:link{
		text-decoration:none;
		color: #666;
		font-family: '맑은 고딕';
	}
	a:visited{
		color:grey;
	}
	
/* tab */
#css_tabs {
    font-family:'nanumgothic', '나눔고딕', 'malgun gothic', '맑은 고딕', 'dotum', '돋움', sans-serif
}
/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3) {
    display:none
}
#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3) {
    display:block
}
/* 라벨 기본 스타일 지정 */
#css_tabs > label {
    display:inline-block;
    font-variant:small-caps;
    font-size:.9em;
    padding:5px;
    text-align:center;
    width:5%;
    line-height:1.0em;
    font-weight:700;
    border-radius:3px 3px 0 0;
    background:#eee;
    color:#777;
    border:1px solid #ccc;
    border-width:1px 1px 0
}
#css_tabs > label:hover {
    cursor:pointer
}
#css_tabs label[for=tab1] {
    margin-left:1.5em;
    position:static;
}
/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs > label[for=tab1]:hover {
    background:#3d3d3e;
    color:#ffc0cb
}
#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs > label[for=tab2]:hover {
    background:#3d3d3e;
    color:#c1aeee
    
    /*#d5c2ee*/
}
#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs > label[for=tab3]:hover {
    background:#3d3d3e;
    color:#76daff
}
/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab1_content, #css_tabs .tab2_content, #css_tabs .tab3_content {
    padding:2em;
    border:1px solid #ddd;
    width:50%;
    height:45%;
    font-family: '맑은 고딕';
    font-size: 12px;
    font-color: #666;
}

</style>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
$(function(){
	
	count=$("#firstname").val();
		//alert(count)
		//for(var i=0;i<count;i++){
		$("#first, #second, #third").hide();

	    $("a[href=#first], a[href=#second], a[href=#third]").click(function(){
	    $($(this).attr("href")).toggle();
	        return false;
	    });
	    

$('#css_tabs > div > p > a').hover(

   		function(){
   			
   			$(this).css("background-color","#a5e3e6");

   			},
   			
   			function(){
   				
   			$(this).css("background-color","#fff");
   		});
   
});
</script>
</head>
<body>

<div id="css_tabs">
    <input id="tab1" type="radio" name="tab" checked="checked" />
    <input id="tab2" type="radio" name="tab" />
    <input id="tab3" type="radio" name="tab" />
    
    <label for="tab1">회원</label>
    <label for="tab2">SITE</label>
    <label for="tab3">기타</label>
    
<div class="tab1_content">
<%
System.out.println(vec1.size());
    		
	 for(int i=0; i<vec1.size(); i++){
		
		QnaDto dto=(QnaDto)vec1.get(i);
		
		int q_num=dto.getQ_num();
		int q_sort=dto.getQ_sort();
		String q_subject=dto.getQ_subject();
		String q_content=dto.getQ_content();
		
		//int q_group2=dto.getQ_group();
%>		
    	<p><a href="#first">Q&nbsp;&nbsp;&nbsp;<%=q_subject %></a></p>
		<p id="first">A&nbsp;&nbsp;&nbsp;<%=q_content %></p>
		
	<%	
	}//for
%>
</div><!-- tab1_content -->

<div class="tab2_content">
<%
System.out.println(vec2.size());
    		
	 for(int i=0; i<vec2.size(); i++){
		
		QnaDto dto=(QnaDto)vec2.get(i);
		
		int q_num=dto.getQ_num();
		int q_sort=dto.getQ_sort();
		String q_subject=dto.getQ_subject();
		String q_content=dto.getQ_content();
		
		//int q_group2=dto.getQ_group();
%>		
    	<p><a href="#second">Q&nbsp;&nbsp;&nbsp;<%=q_subject %></a></p>
		<p id="second">A&nbsp;&nbsp;&nbsp;<%=q_content %></p>
		
	<%	
	}//for
%>
</div><!-- tab2_content -->


<div class="tab3_content">
<%
System.out.println(vec3.size());
    		
	 for(int i=0; i<vec3.size(); i++){
		
		QnaDto dto=(QnaDto)vec3.get(i);
		
		int q_num=dto.getQ_num();
		int q_sort=dto.getQ_sort();
		String q_subject=dto.getQ_subject();
		String q_content=dto.getQ_content();
		
		//int q_group2=dto.getQ_group();
%>		
    	<p><a href="#third">Q&nbsp;&nbsp;&nbsp;<%=q_subject %></a></p>
		<p id="third">A&nbsp;&nbsp;&nbsp;<%=q_content %></p>
		
	<%	
	}//for
%>
</div><!-- tab3_content -->





<!--    
    <div class="tab1_content">
    	<p><a href="#first">Q 회원<%--<%=q_subject %>--%></a></p>
		<p id="first">- A 회원<%--<%=q_content %>--%></p></div>
 		
    <div class="tab2_content">
    	<p><a href="#second">Q 사이트<%--<%=q_subject %>--%></a></p>
		<p id="second">- A 사이트<%--<%=q_content %>--%></p></div>
		
    <div class="tab3_content">
    	<p><a href="#third">Q  기타<%--<%=q_subject %>--%></a></p>
		<p id="third">- A 기타<%--<%=q_content %>--%></p></div>		
-->
</div>
</body>
</html>