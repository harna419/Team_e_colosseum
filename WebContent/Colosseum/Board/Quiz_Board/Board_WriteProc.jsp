<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Board.*"%>
    
<%
 request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="Board.BoardDto">
<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%

//dto.setIp(request.getRemoteAddr()); //ip setter 작업

BoardDao dao = BoardDao.getInstance(); //dao객체 얻기
dao.insertBoard(dto); //dao 메서드 호출

%>

<html>
	<head>
	<script>
	 function ret(){
		 alert("되돌아가기")
		 history.go(-2);
		    	//movePageUrl('/Colosseum/Board/Quiz_Board/Board_List.jsp');
		    }
	 </script>
	</head>
	<body onload="ret()">
	
	</body>
</html>





    