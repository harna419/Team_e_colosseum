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
	
	if($(this).children().first().attr('id') == 'menu1'){ //콜로세움이란?
		
		movePageUrl('Menu1.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
	}else if($(this).children().first().attr('id') == 'menu2'){ //회원가입
		
		movePageUrl('Member/Member_JoinMember.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu3'){ //문제게시판
	
		movePageUrl('./Board/Quiz_view/Quiz_list.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
		
	}else if($(this).children().first().attr('id') == 'menu4'){ //자유게시판
	
		movePageUrl('Board/Quiz_Board/Board_List.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu5'){ //QNA
		
	
		movePageUrl('Menu5.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu6'){ //명예의전당
		
		movePageUrl('Menu6.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu7'){ //학습모드
		
		
		movePageUrl('Menu7.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
		
	}else if($(this).children().first().attr('id') == 'menu8'){ //개발진소개
	
		movePageUrl('Menu8.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
				
	}
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
	
	
	
	if($(this).children().first().attr('id') == 'menu1'){ //콜로세움이란?
		
		movePageUrl('Menu1.jsp',$('#main').css("backgroundColor"), $(this).children().first().attr("data-color") );
		
	}
});
//====================================================================================================
//====================================================================================================

num=$("#quiz_study_num").val();
dep=$("#q_dep_num").val();

click=q_dep_num+dep
$('#q_dep_num').on("click", function(){
	aa=$("#quiz_study_value").val();
	movePageUrl(aa);
	
	
});

/*
function imageclick(){
	alert(zxc)
}*/
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
//회원가입시 체크하기////////////////////////////////
var Id_Check=-1;
function checkIt(){
	
	if($("#q_id").val()==""){
		alert("ID를 입력해주세요");
		$('#q_id').val('').focus();
		return false;
	}
	
	if($('#q_nickname').val()==""){
		alert("닉네임을 입력 해주세요");
		$('#q_nickname').val('').focus();
		return false;
	}
	
	if($('#q_pwd').val()==""){
		alert("비밀번호를 입력 해주세요");
		$('#q_pwd').val('').focus();
		return false;
	}
	
	if($('#q_pwd2').val()==""){
		alert("비밀번호를 확인 해주세요");
		$('#q_pwd2').val('').focus();
		return false;
	}
	
	if($('#q_pwd').val() != $('#q_pwd2').val()){
		alert("비밀번호가 확인이 일치하지 않습니다");
		$('#q_pwd2').val('').focus();
		return false;
	}
	
	if($('#q_name').val()==""){
		alert("이름을 입력 해주세요");
		$('#q_name').val('').focus();
		return false;
	}
	
	if($('#q_jumin1').val()=="" || $('#q_jumin2').val()==""){
		alert("주민번호를 입력 해주세요");
		$('#q_jumin1').val('').focus();
		return false; 
	}
	
	if($('#q_pw_question').val()==""){
		alert("비밀번호 찾기 질문을 입력 해주세요");
		$('#q_pw_question').val('').focus();
		return false;
	}
	if($('#q_pw_reply').val()==""){
		alert("비밀번호 찾기 답변을 입력 해주세요");
		$('#q_pw_reply').val('').focus();
		return false;
	}
	
	if(Id_Check!=1){
		alert("아이디 중복 확인 해주세요");
		return false;
	}
	
	alert("가입이 완료 되었습니다");
}//checkIt end

function openConfirmID(formID){

	if($('#q_id').val()==''){
		alert("id를 입력하세요");
		$('#q_id').focus();
	}else{

		$.ajax({
			type:'POST',
			url:'confirmId.jsp',
			data : "q_id="+$('#q_id').val(),
			dataType:'JSON',
			cache:false,
			async:true,
			success:function(data){
				//alert(data.check); 
				
				if(data.check==1){
					alert("사용중인 id");
					$('#q_id').val('').focus();
				}else{
					alert("사용가능한 아이디");
					Id_Check=1;
				}//else
			}//success
		});
	}//else
}//openConfirmId
//////////////////////////////////////////


//Board_List.jsp/////////////////////////////
function check(){//검색어가 없는데 검색 눌렀을 때
	if(document.searchForm.keyWord.value==''){
		alert("검색어를 입력 하시오");
		document.searchForm.keyWord.focus();
		return false;
	}//if
	document.searchForm.submit();
}//check() end

function list(){//리스트 보여주기
	document.listForm.action="Board_List.jsp";
	document.listForm.submit();
}//list() end

function content(value){	
	document.readForm.action="Board_Content.jsp";//글 내용 보기
	document.readForm.q_num.value=value;//글번호
	document.readForm.submit();
}//read() end

$(this).ready(function(){ 		        
	$('.receive').on('click',function(e){
		    var x=e.pageX;
		    var y=e.pageY; 

		var recname = $('.receive').eq($(".receive").index($(this))).html()
		    var messagebox2= $("#messagebox").width();
		    if(messagebox2 <= 0){
		    
			$("#content").append('<div id="messagebox"><table><tr><td id="123">'+recname+'</td></tr><tr><td><textarea id="456" rows=15 cols=38></textarea></td></tr></table></div>');
			$("#messagebox").css('left',x);
			$("#messagebox").css('top',y);
			$("#messagebox").append('<div align="center"><button id="msubmit">전송</button> <button id="mreset">취소</button></div>');

		    }else{
		     $("#messagebox").remove();	     
		    }//else
		    	
			 $("#mreset").on('click',function(){
    	 $("#messagebox").remove();
    	 });//mreset click function
    	 
			$("#msubmit").on('click',function(){
				$.ajax({ 
              url:'Messagedb.jsp', //가져오고자하는 서버페이지 주소를 넣는다. 
              type:'post', //데이터를 서버로 전송하게 된다. 
              data:{ 
                     nickname_receive: recname,  //에디터박스의 아이디를 넣으면 해당 에디터박스의 데이터를 보내준다.
                     msg_content: $('#456').val(),  
                     nickname_send : "<%= q_nickname %>"      
              } , 
              success : function(t){ 
                            alert('메세지 전송!');
              } , 
              error : function(){ 
                        alert('메세지 전송실패'); 
              } 
           });
					$("#messagebox").remove();
			});
	});	//.receive click funciton	
});//ready function()
//Board_List.jsp/////////////////////////////
