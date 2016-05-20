/**
 * 
 */

function movePageUrl(url, nowColor, nextColor){
	
	//alert("url:"+url+" nowColor:"+nowColor+" nextColor:"+nextColor);
	document.hiddenForm.pageUrl.value=url;
	document.hiddenForm.nowColor.value=nowColor;
	document.hiddenForm.nextColor.value=nextColor;
	document.hiddenForm.submit();
}

function startSet(nowColor, nextColor){
	alert(" nowColor:"+nowColor+" nextColor:"+nextColor);
}




$(document).ready(function() {

	//alert($('#nextColor').attr("value"));
		
var window_height = $(window).height();

//메인 들어오면, 해상도 잡기.
$('.Intro_menu, .Intro_left').css({'height': window_height});
$('.menu_button').css('height', Math.floor(window_height/8) );
$('.menu_button').last().css('height', Math.floor(window_height/8) + window_height%8);
$('.circle, .home-block').height($('.Intro_menu').height());

//메인으로 들어오면, 버튼 이동 생략.
$('#home_wrapper').css({ right: "100%"});
$('.menu_button').css({'right': '-150px'});
$('.menu_button').css({'margin-left': '-90px'});  //버튼 밀어 놓기

//버튼 상태 속성 부여해서, JQuery 작동 하도록 설정한다.
$('.Intro_menu > a ').each(function() { //속성 값을 준 다음에, 패딩 액션 확인.
	$(this).children().first().attr('data-status', 'move');
	$(this).children().first().css({'padding-top': '0', 'margin-top': '0'}, 800);
});

//페이지 값 읽어서 페이지 색상 변경 (content_block 을 페이드 아웃, 인 해준다.)

$('#content_block').hide();
$('#main').css({backgroundColor: $('#nowColor').attr("value")});
$('#top').css({backgroundColor: $('#nowColor').attr("value")});
$('#content_block').css({backgroundColor: $('#nowColor').attr("value")});
$('#main').stop().animate({backgroundColor: $('#nextColor').attr("value")}, 400 );
$('#top').stop().animate({backgroundColor: $('#nextColor').attr("value")}, 400 );
$('#content_block').stop().animate({backgroundColor: $('#nextColor').attr("value")}, 400 );
$('#content_block').fadeIn();

//====================================================================================================
$(window).resize(function() { //윈도우 리사이즈 이벤트 발생시!
		var window_height = ($(window).height() > 700) ? $(window).height() : 700;
		
		$('.Intro_menu, .Intro_left').css({'height': window_height});
		$('.menu_button').css('height', Math.floor(window_height/8) );
		$('.menu_button').last().css('height', Math.floor(window_height/8) + window_height%8);
		$('.circle, .home-block').height($('.Intro_menu').height());
	
	
	});
//====================================================================================================	
//모든 부분에 대하여.data-hegit 와 클래스를 부여해준다.
	$('.Intro_menu > a').each(function() {
		$(this).children().first().attr('data-height', $(this).css('height'));
		//$(this).children().first().attr('data-status', 'move_end');
		//커버 걷힌 채로 들어오므로 일단 이부분 생략.
	});
	$('.menu_button> span').each(function() {
		$(this).children().first().attr('class', 'button');
	});
//====================================================================================================
//메뉴 버튼 클릭시 이벤트 컨트롤러.		
$(this).on("click",'.menu_link' ,function(event){
	//alert(event);
	event.preventDefault();
	
	$('.Intro_menu > a ').each(function() { //속성 값을 준 다음에, 패딩 액션 확인.
		$(this).children().first().attr('data-status', 'move');
		$(this).children().first().css({'padding-top': '0', 'margin-top': '0'}, 800);
	});
	
	$('#home_wrapper').stop().animate({ right: "100%"}, 350); //커버 걷히는 속도 위치.
	$('.menu_button').css({'right': '-150px'});
	$('.menu_button').css({'margin-left': '-90px'});  //버튼 밀어 놓기
			
	//누르는 버튼에 따라서 값을 다르게 로딩.
	//var test= $(this).attr('id')
	//alert(test);
	
	if($(this).children().first().attr('id') == 'menu1'){
		
		movePageUrl('Menu1.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
	}else if($(this).children().first().attr('id') == 'menu2'){
		
		movePageUrl('JoinMember.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu3'){
	
		movePageUrl('../Colosseum/Board/Board_List.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu4'){
	
		movePageUrl('./Board/Quiz_view/Quiz_list.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu5'){
		
	
		movePageUrl('Menu5.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu6'){
		
		movePageUrl('Menu6.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu7'){
		
		
		movePageUrl('Menu7.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu8'){
	
		movePageUrl('Menu8.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
				
	}
});
//====================================================================================================
	
//====================================================================================================
$('#back_intro').on("click", function(){ //초상화 클릭시 메인 화면으로 간다. 임시
	
	$('.Intro_menu > a').each(function() {
		$(this).children().first().attr('data-status', 'move_end');
	});
	$('.menu_button').css({'right': '0px'});
	$('.menu_button').css({'margin-left': '0px'});	
	$('#home_wrapper').stop().animate({ right: "0%"}, 350);

});
//====================================================================================================

$('.menu_link').hover(
	
	function(){
		//alert("마우스 오버");

		//이동전
		if($('.Intro_menu > a > span').attr('data-status')=='move_end'){
			
			$(this).children().first().css({'padding-top': '20px', 'margin-top': '-20px'}, 800);
			}
		
		
		//이동후
		if($('.Intro_menu > a > span').attr('data-status')=='move'){
			
			$(this).children().first().stop().animate({ 'margin-left': "8%"}, 250);
			
		}
		
	},
	function(){//마우스 아웃.
		
		
		if($('.Intro_menu > a > span').attr('data-status')=='move_end'){
			$(this).children().first().css({'padding-top': '0', 'margin-top': '0'}, 800);
		}
		
		if($('.Intro_menu > a > span').attr('data-status')=='move'){
			
			$(this).children().first().stop().animate({ 'margin-left': "-90px"}, 250);
			
			
		}
		
	});


});