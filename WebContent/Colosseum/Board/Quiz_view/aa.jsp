<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
  function aa(){
	  alert("dd")
	  //$(".aaaa").submit();
  }
</script>

</head>
<body>

<form class="aaaa" name="aa" method="post" action="bb.jsp">
 <input type="hidden" name="1" value="aa">
 
 <input type="button" value="전송" onClick="aa()">
</form>
<%-- 
<form class="aaaa" name="aa" method="post" action="bb.jsp">
<input type="hidden" name="2" value="bb">
</form>
<form class="aaaa" name="aa" method="post" action="bb.jsp">
<input type="hidden" name="3" value="cc">
</form>
<form class="aaaa" name="aa" method="post" action="bb.jsp">
<input type="hidden" name="4" value="dd">

</form>
--%>
</body>
</html>