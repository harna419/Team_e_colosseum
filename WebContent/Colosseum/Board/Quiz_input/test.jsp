<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function attrcheck(){
		//$("input").attr("value","ookk");
		$('input[name="kkk"]').attr("nnn","ookk");
		
		$('input[name="kkk"]').attr("nnn",value());
		
		}
</script>
</head>
<body>
	<input type="text" name="kkk" value="">
	<input type="text" name="nnn" value="okok">
	<input type="button" name="attrcheck" onClick="attrcheck()">
	
	

</body>
</html>