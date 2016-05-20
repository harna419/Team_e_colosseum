<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA tab_box</title>
<style type="text/css">
/* toggle */
	a:hover{background-color: #a5e3e6;	
	}
	a:link{
		text-decoration:none;
		color:black;
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
    margin-left:1.5em
}
/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs > label[for=tab1]:hover {
    background:#3d3d3e;
    color:#ffc0cb
}
#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs > label[for=tab2]:hover {
    background:#3d3d3e;
    color:#a5e3e6
    
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
    width:70%;
    height:45%;
    font-family: '돋움', Dotum, '굴림', Gulim, AppleGothic, sans-serif;
    font-size: 12px;
}

</style>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">

$(function(){
    $("#first, #second, #third").hide();
    $("a[href=#first], a[href=#second], a[href=#third]").click(function(){
        $($(this).attr("href")).toggle();
        return false;
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
    	<p><a href="#first">회원가입에 대한 혜택이 궁금해요.</a></p>
		<p id="first">- 회원가입시 바로 사용하실 수 있는 4종의 쿠폰과 2000원의 적립금을 지급해드립니다.
 		</p></div>
    <div class="tab2_content">
    	<p><a href="#second">회원ID 및 비밀번호를 분실시 어떻게 해야하나요.</a></p>
		<p id="second">- 사이트 로그인 페이지에서 아이디와 비밀번호를 찾으실 수 있으며
 						아이디는 성함과 이메일 주소를 입력해주시면 확인이 가능합니다.
 						비밀번호의 경우 기존 번호로는 알 수 없으며 임시 비밀번호가 생성되어 회원가입 당시 기재해주신 메일로 발송됩니다.

		</p></div>
    <div class="tab3_content">
    	<p><a href="#third">회원 탈퇴 하는 방법 알려주세요.</a></p>
		<p id="third">- 회원탈퇴시 모든 주문내역은 사라지게 되며 적립금 및 쿠폰 또한 소멸 됩니다.
						소멸된 적립금/쿠폰은 일체 복구가 불가하오니 회원 탈퇴 전 신중히 고려해주세요.
					- 회원탈퇴는 로그인 후 마이페이지 하단에서 요청하실 수 있습니다.
 		</p></div>
</div>
</body>
</html>