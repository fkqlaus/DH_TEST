<%--
  Created by IntelliJ IDEA.
  User: fkqla
  Date: 25. 6. 5.
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>대호이엔지</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/output.css">




    <script>
        $(document).ready(function(){
            // 모바일 화면 버튼
            $('button.header-menu-icon').click(function(){
                $('header').toggleClass('on');
            });

            // 새로고침 시 헤더 css 유지
            var height = $(document).scrollTop();
            if(height > 100){
                $("header").addClass('scroll');
            }
            if(height < 100){
                $("header").removeClass('scroll');
            }

            // 스크롤 이벤트
            $(document).scroll(function () {
                var height = $(document).scrollTop();
                if(height > 100){
                    $("header").addClass('scroll');
                }
                if(height < 100){
                    $("header").removeClass('scroll');
                }
            });

            // bxSlider1
            var main = $('.bxslider1').bxSlider({
                mode: 'fade',
                auto: true,	//자동으로 슬라이드
                controls : false,	//좌우 화살표
                autoControls: false,	//stop,play
                pager:true,	//페이징
                pause: 5000,
                autoDelay: 0,
                slideWidth: 'auto', //이미지 박스 크기설정
                speed: 1500,
                stopAutoOnclick:true,
                infiniteLoop : true,
                moveSlides : 0,
                minSlides: 1,
                maxSlides: 1,
                useCSS: false
            });

            // bxSlider2
            var main = $('.bxslider2').bxSlider({
                mode: 'horizontal',
                auto: true,	//자동으로 슬라이드
                controls : true,	//좌우 화살표
                autoControls: false,	//stop,play
                pager:true,	//페이징
                pause: 5000,
                autoDelay: 0,
                slideWidth: 'auto', //이미지 박스 크기설정
                speed: 1500,
                stopAutoOnclick:true,
                infiniteLoop : true,
                moveSlides : 0,
                minSlides: 1,
                maxSlides: 5,
                touchEnabled: (navigator.maxTouchPoints > 0),
                useCSS: false
            });

            // 팝업닫기
            $('.btn-popup-close').click(function(){
                $('.popup-wrap').css('display','none');
            });
        });
    </script>
</head>
