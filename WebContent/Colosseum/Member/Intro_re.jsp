<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {

var window_height = $(window).height();


$('.Intro_menu, .Intro_left, #content_block').css({'height': window_height});
$('.menu_button').css('height', Math.floor(window_height/8) );
$('.menu_button').last().css('height', Math.floor(window_height/8) + window_height%8);
$('.circle, .home-block').height($('.Intro_menu').height());

//====================================================================================================
$(window).resize(function() { //윈도우 리사이즈 이벤트 발생시!
		var window_height = ($(window).height() > 700) ? $(window).height() : 700;
		
		$('.Intro_menu, .Intro_left, #content_block').css({'height': window_height});
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

$('.menu_button > span').on("click", function(){
	
	//alert("test");
	//$('#home_wrapper').css('right','100%');
	
	$('.Intro_menu > span').each(function() {
	$(this).attr('data-status', 'move');
	$(this).css({'padding-top': '0', 'margin-top': '0'}, 800);
	
	
	});
	
	
	$('#home_wrapper').stop().animate({ right: "88%"}, 600);
	
	$('.menu_button').css({'margin-left': '-90px'});
	
	//복수의 클래스의 인덱스 값을 반환 한다.
	//alert($(".Intro_menu > span").find('#menu1'));
	var test= $(this).attr('id')
	alert(test);
	//alert($('.menu_button > span').attr('id'));
		
	/*
	if($(this).attr('id')=='menu1'){
	$('#content_block').load('JoinMember.jsp');
	}*/
});
//====================================================================================================
	
//====================================================================================================
$('#back_intro').on("click", function(){
	
	//alert("test");
	//$('#home_wrapper').css('right','100%');
	
	$('.Intro_menu > span').each(function() {
	$(this).attr('data-status', 'move_end');
	});
	
	$('.menu_button').css({'margin-left': '0px'});	
	$('#home_wrapper').stop().animate({ right: "0%"}, 600);
	
	
	/*
	if($('.menu_button > span').attr('data-status')=='stop'){
		$(this).css({'margin-left':'0px','margin-top': '0px'}, 800);
	}*/
		
	
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
			
			$(this).stop().animate({ 'margin-left': "0px"}, 400);
			$('.menu_button > .button').css({ right: "0%"});
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
			
			$(this).stop().animate({ 'margin-left': "-90px"}, 400);
			$('.menu_button>span').css({ right: "0%"});
			
		}
		
	});


});

</script>

<style>
html body{height: 100%; margin: 0px;padding: 0px;}
div {/*border:1px solid black;*/}

#back_intro{
position: absolute;
top: 0%;
right: 5%;

}

#content_block{
position: absolute;
width:80%;
height: 90%;
top:10%;

background-color: blue;
}

.menu_button>span{
position:absolute;
top:50%;
right:0%;

margin-right: 10px;
padding-right: 10px;

color: #fff;
display: block;
font-size: 14px;
font-weight: bold;
letter-spacing: 1px;
line-height: 30px;
margin-top: -12px;

text-align: right;
text-transform: uppercase;
vertical-align: middle;
width: 100%;

}

#main{width:88%; height:100%; position:absolute; left: 12%; background-color: white;}

#home_wrapper{width:100%; height:100%; z-index:1; position:absolute; right: 0%;}

.Intro_left{position:absolute; height:100%; left:0px; width:40%; background-color: #ffffff; z-index: 3;margin-right: 0px;]}

.circle{position: absolute; left: 40%; z-index:3; height:100%;}

.Intro_menu{position: absolute; height:100%; right:0px; width:60%; z-index: 2}

.menu_button{ display:block; width:100%; position: relative; height: 50px; }

#menu1{ 
background-image: url('../Imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 40px 40px;
padding-right: 60px;
}

#menu2{ 
background-image: url('../Imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 40px 40px;
padding-right:60px;
}

#menu3{ 
background-image: url('../Imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 40px 40px;
padding-right: 60px;
}

#menu4{ 
background-image: url('../Imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 40px 40px;
padding-right: 60px;
}

#menu5{ 
background-image: url('../Imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 40px 40px;
padding-right: 60px;
}

#menu6{ 
background-image: url('../Imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 40px 40px;
padding-right: 60px;
}

#menu7{ 
background-image: url('../Imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 40px 40px;
padding-right:60px;
}

#menu8{ 
background-image: url('../Imgs/opti1-01.svg');
background-repeat: no-repeat;
background-position: right;
background-size: 40px 40px;
padding-right:60px;
}


</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="home_wrapper">

<div class="Intro_left">
<font align=center><h1>Colosseum</h1></font>
</div> <!-- home block end -->

<div class="circle">
<img src="../Imgs/Ellipse 1.svg" height="100%">
</div>

<div class="Intro_menu">

<span  data-color="#f2b701" class="menu_button"  style="background-color: #f2b701;"> 
 <span id="menu1" >Join Us</span> </span>


<span data-color="#e57d04" class="menu_button" style="background-color: #e57d04;"> 
<span id="menu2">What is Colosseum?</span>  </span>


<span data-color="#dc0030" class="menu_button"  style="background-color: #dc0030;"> 
<span id="menu3">What is Colosseum?</span> </span>


<span data-color="#b10058" class="menu_button"  style="background-color: #b10058;"> 
<span id="menu4">What is Colosseum?</span>  </span>


<span data-color="#7c378a" class="menu_button"  style="background-color: #7c378a;"> 
<span id="menu5">What is Colosseum?</span> </span>


<span data-color="#3465aa" class="menu_button"  style="background-color: #3465aa;"> 
<span id="menu6">What is Colosseum?</span>  </span>


<span data-color="#7cb854" class="menu_button"  style="background-color: #7cb854;"> 
<span id="menu7">What is Colosseum?</span>  </span>



<span data-color="#09a275" class="menu_button"  style="background-color: #09a275;"> 
<span id="menu8">What is Colosseum?</span> </span>


</div>	<!-- Intro_menu end -->

</div>	<!-- home_wrapper end -->

<div id="main"> <!-- main page-->

<div id="content_block"></div>

<div id="back_intro">
<img src="../Imgs/test.png">
</div>


</div><!-- main page end-->



</body>
</html>