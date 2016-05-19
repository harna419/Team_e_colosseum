<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>버젼 5-19 통합</title>  
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	$('#main').stop().animate({backgroundColor: $('#menu1').attr("data-color")}, 400 );
	$('#top').stop().animate({backgroundColor: $('#menu1').attr("data-color")}, 400 );
	$('#content_block').stop().animate({backgroundColor: $('#menu1').attr("data-color")}, 400 );
	
	$('#content_block').load('Menu1.jsp');
	
	
var window_height = $(window).height();

//zalert('start');
$('.Intro_menu, .Intro_left').css({'height': window_height});
$('.menu_button').css('height', Math.floor(window_height/8) );
$('.menu_button').last().css('height', Math.floor(window_height/8) + window_height%8);
$('.circle, .home-block').height($('.Intro_menu').height());

//====================================================================================================
$(window).resize(function() { //윈도우 리사이즈 이벤트 발생시!
		var window_height = ($(window).height() > 700) ? $(window).height() : 700;
		
		$('.Intro_menu, .Intro_left').css({'height': window_height});
		$('.menu_button').css('height', Math.floor(window_height/8) );
		$('.menu_button').last().css('height', Math.floor(window_height/8) + window_height%8);
		$('.circle, .home-block').height($('.Intro_menu').height());
	
	
	});
//====================================================================================================	
	$('.Intro_menu > span').each(function() {
	$(this).attr('data-height', $(this).css('height'));
	$(this).attr('data-status', 'move_end');
		
	});
//====================================================================================================
	$('.menu_button> span').each(function() {
		$(this).attr('class', 'button');
	});
//====================================================================================================

$('#content_block').on("click",'#menu2_to_input' , function(){ 
	//alert('test');
	$('#content_block').load('./Board/Quiz_input/Quiz_RegisterForm.jsp');
	
});		
//====================================================================================================
		
		
$(this).on("click",'.menu_button' ,function(){
		
	$('.Intro_menu > span').each(function() { //속성 값을 준 다음에, 패딩 액션 확인.
	$(this).attr('data-status', 'move');
	$(this).css({'padding-top': '0', 'margin-top': '0'}, 800);
	});
	
	$('#home_wrapper').stop().animate({ right: "100%"}, 350); //커버 걷히는 속도 위치.
	$('.menu_button').css({'right': '-150px'});
	$('.menu_button').css({'margin-left': '-90px'});  //버튼 밀어 놓기
	
	//클릭이 일어났을때, 페이지 로딩.
	$('#top').load('Top.jsp');
		
	//누르는 버튼에 따라서 값을 다르게 로딩.
	//var test= $(this).attr('id')
	//alert(test);
	
	if($(this).attr('id') == 'menu1'){
		
		$('#main').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#top').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#content_block').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		
		/*
		animate({
	          backgroundColor: "#aa0000",
	          color: "#fff",
	          width: 500
	        }, 1000 );*/
		//$('#main').stop().animate({ 'background-color': $(this).attr("data-color")}, 350);
	       // $('#main').animate({backgroundColor: $(this).attr("data-color")}, 1000 );
				
		$('#content_block').load('JoinMember.jsp');
		
	}else if($(this).attr('id') == 'menu2'){
		
		$('#content_block').load('./Board/Quiz_view/Quiz_list.jsp', function(){
			$('#main').stop().animate({'backgroundColor': $(this).attr("data-color")}, 400 );
			$('#top').stop().animate({'backgroundColor': $(this).attr("data-color")}, 400 );
			$('#content_block').stop().animate({'backgroundColor': $(this).attr("data-color")}, 400 );
			
		});
		
	}else if($(this).attr('id') == 'menu3'){
		
		$('#main').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#top').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#content_block').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		
		$('#content_block').load('Menu3.jsp');
		
	}else if($(this).attr('id') == 'menu4'){
		
		$('#main').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#top').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#content_block').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		
	}else if($(this).attr('id') == 'menu5'){
		
		$('#main').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#top').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#content_block').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		
	}else if($(this).attr('id') == 'menu6'){
		
		$('#main').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#top').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#content_block').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		
	}else if($(this).attr('id') == 'menu7'){
		
		$('#main').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#top').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#content_block').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		
	}else if($(this).attr('id') == 'menu8'){
	
		$('#main').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#top').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		$('#content_block').stop().animate({backgroundColor: $(this).attr("data-color")}, 400 );
		
	}
	//복수의 클래스의 인덱스 값을 반환 한다.
	//alert($(".Intro_menu > span").find('#menu1'));
	//var test= $(this).attr('id')
	//alert(test);
	//alert($('.menu_button > span').attr('id'));
		
	/*
	if($(this).attr('id')=='menu1'){
	$('#content_block').load('JoinMember.jsp');
	}*/
});
//====================================================================================================
	
//====================================================================================================
$('#back_intro').on("click", function(){ //초상화 클릭시 메인 화면으로 간다. 임시
	
	$('.Intro_menu > span').each(function() {
	$(this).attr('data-status', 'move_end');
	});
	$('.menu_button').css({'right': '0px'});
	$('.menu_button').css({'margin-left': '0px'});	
	$('#home_wrapper').stop().animate({ right: "0%"}, 350);
	
	$('#content_block').load('Menu1.jsp');
});
//====================================================================================================

$('.menu_button').hover(
	
	function(){
		//alert("마우스 오버");
		
		//$(this).css('background-color','black');
		//$('.Intro_left').css('background-color',$(this).attr("data-color"));
		//$(this).stop().animate({ height: "0%"}, 500);
		
		//이동전
		if($('.Intro_menu > span').attr('data-status')=='move_end'){
			$(this).css({'padding-top': '20px', 'margin-top': '-20px'}, 800);
			}
		
		
		//이동후
		if($('.Intro_menu > span').attr('data-status')=='move'){
			
			$(this).stop().animate({ 'margin-left': "8%"}, 250);
			//$('.menu_button > .button').css({ right: "0%"});
			//$('.menu_button').css({'margin-left': '0px'});
		}
		
		//css({'padding-top': '5px', 'margin-top': '-5px'})
	},
	function(){//마우스 아웃.
		//$(this).css('background-color', $(this).attr("data-color"));
		//$('.Intro_left').css('background-color','white');
		//$(this).stop().animate({ height: $(this).attr('data-height')}, 500);
		//{'padding-top': '0', 'margin-top': '0'}
		
		if($('.Intro_menu > span').attr('data-status')=='move_end'){
		$(this).css({'padding-top': '0', 'margin-top': '0'}, 800);
		}
		
		if($('.Intro_menu > span').attr('data-status')=='move'){
			
			$(this).stop().animate({ 'margin-left': "-90px"}, 250);
			//$('.menu_button>span').css({ right: "0%"});
			
		}
		
	});


});

</script>

<style>
html body{height: 100%; margin: 0px;padding: 0px;}
div {border:1px solid black;}

#back_intro{
position: absolute;
top: 0%;
right: 5%;

  	float:left;
    overflow:hidden; /* this is important 이 부분이 넘치는 부분을 생략해준다.*/
    height:150px;
    width:150px;
}
/*#back_intro img{margin-top:-19px;}*/




.menu_button>span{
position:absolute;
top:50%;
right:5%;

margin-right: 10px;
padding-right: 10px;

color: #fff;
display: block;
font-size: 50px;
font-weight: bold;
letter-spacing: 1px;
line-height: 30px;
margin-top: -12px;

text-align: right;
text-transform: uppercase;
vertical-align: middle;
width: 100%;

}

#main{width:100%; height:100%; position:absolute; left: 0%; background-color: white;}
#top{position: absolute; top:0%; background-color: yellow; left:5%; width: 90%; height: 10%;}
#content_block{position: absolute;width:90%;height: 90%;top:10%; left:5%; background-color: blue;}

#home_wrapper{width:100%; height:100%; z-index:1; position:absolute; right: 0%;}
.Intro_left{position:absolute; height:100%; left:0px; width:40%; background-color: #ffffff; z-index: 3;margin-right: 0px;]}
.circle{position: absolute; left: 40%; z-index:3; height:100%;}
.Intro_menu{position: absolute; height:100%; right:0px; width:60%; z-index: 2}
.menu_button{ display:block; width:100%; position: relative; height: 50px; }

#menu1{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}


#menu2{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}

#menu3{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;
}

#menu4{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu5{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu6{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu7{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}

#menu8{ 
background-image: url('./imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 60px 60px;

}


</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="home_wrapper">

<div class="Intro_left">
<font align=center><h1>Colosseum</h1></font>
<%=request.getContextPath() %>

</div> <!-- home block end -->

<div class="circle">
<img src="./imgs/Ellipse 1.svg" height="100%">
</div>

<div class="Intro_menu">

<span id="menu1" data-color="#f2b701" class="menu_button"  style="background-color: #f2b701;"> 
 <span  >회원 가입</span> </span>


<span id="menu2" data-color="#e57d04" class="menu_button" style="background-color: #e57d04;"> 
<span >문제 리스트</span>  </span>


<span id="menu3" data-color="#dc0030" class="menu_button"  style="background-color: #dc0030;"> 
<span > 회원 정보 </span> </span>


<span id="menu4" data-color="#b10058" class="menu_button"  style="background-color: #b10058;"> 
<span > 콜로세움 이란?</span>  </span>


<span id="menu5" data-color="#7c378a" class="menu_button"  style="background-color: #7c378a;"> 
<span >What is Colosseum?</span> </span>


<span id="menu6" data-color="#3465aa" class="menu_button"  style="background-color: #3465aa;"> 
<span >What is Colosseum?</span>  </span>


<span id="menu7" data-color="#7cb854" class="menu_button"  style="background-color: #7cb854;"> 
<span >What is Colosseum?</span>  </span>



<span id="menu8" data-color="#09a275" class="menu_button"  style="background-color: #09a275;"> 
<span >What is Colosseum?</span> </span>


</div>	<!-- Intro_menu end -->

</div>	<!-- home_wrapper end -->

<div id="main"> <!-- main page-->
<div id="top"></div>
<div id="content_block"></div>

<div id="back_intro">
<img src="./imgs/test.png">
</div>


</div><!-- main page end-->



</body>
</html>