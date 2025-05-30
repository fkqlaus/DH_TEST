<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<!-- head -->
<c:import url="/WEB-INF/views/layouts/space/head.jsp" />
<body class="d-flex flex-column min-vh-100 bg-light">

<!-- Header -->
<c:import url="/WEB-INF/views/layouts/space/header.jsp" />

<main class="flex-grow-1">
    <div class="container-fluid">
        <!-- 공지사항 영역 -->
        <div class="notice-wrap" style="text-align: center;">
            <p>공지사항</p>
            <ul class="bxslider">
                <li>
                    <a href="#">
                        <p class="titleP">2023-06-19 1111</p>
                        <input type="hidden" value="공지사항 내용">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <p class="titleP">2023-06-14 2222</p>
                        <input type="hidden" value="ttts">

                    </a>
                </li>
                <!-- 추가 공지사항 -->
            </ul>
        </div>
        <div class="slider_wrap" style="display: flex; justify-content: center;">
            <ul class="my_bxslider" style="display: inline-block;">
                <li>
                    <a href="/posts" class="img-text-wrap">
                        <img src="/resources/images/image1.jpg" alt="이미지1"/>
                        <span class="img-caption">글자를 올려봤습니다</span>
                    </a>
                </li>

                <li><img src="/resources/images/image2.jpg" alt="이미지2"/></li>
                <li><img src="/resources/images/image3.jpg" alt="이미지3"/></li>
            </ul>
        </div>
        <div class="row">

            <!-- 메인 콘텐츠 -->
            <section class="col-md-10 py-4 mx-auto">
                <div class="card shadow-sm h-100" style="min-height: 1400px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <!-- 첫 번째 영역 -->
                                <h5>영역 1</h5>
                                <canvas id="myChart" width="400" height="200"></canvas>
                            </div>
                            <div class="col-md-6">
                                <!-- 첫 번째 영역 -->
                                <h5>영역 2</h5>
                                <canvas id="myChart2" width="400" height="200"></canvas>
                            </div>
                            <div class="col-md-6">
                                <!-- 두 번째 영역 -->
                                <h5>영역 3</h5>
                                <p>여기에 다른 콘텐츠를 넣으세요.</p>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
        </div>
    </div>
</main>

<!-- Footer -->
<c:import url="/WEB-INF/views/layouts/space/footer.jsp" />

<script>
    $(document).ready(function() {
        $('.nav-item.dropdown').hover(function() {
            $(this).addClass('show');
            $(this).find('.dropdown-menu').addClass('show');
        }, function() {
            $(this).removeClass('show');
            $(this).find('.dropdown-menu').removeClass('show');
        });
    });
</script>
<!-- 슬라이더 초기화 -->
<script>
    $(document).ready(function(){
        $('.bxslider').bxSlider({
            mode: 'vertical',      // 슬라이드 전환 방향: 'horizontal'(기본값), 'vertical', 'fade'
            auto: true,            // 자동 슬라이드 재생 여부
            pager: false,          // 하단 페이지 네비게이션(점) 표시 여부
            controls: true,        // 이전/다음 화살표 버튼 표시 여부
            minSlides: 1,          // 한 화면에 보여질 최소 슬라이드 개수
            maxSlides: 1,          // 한 화면에 보여질 최대 슬라이드 개수
            moveSlides: 1,         // 한 번에 이동할 슬라이드 개수
            slideMargin: 0,        // 슬라이드 사이의 간격(px)
            speed: 500,            // 슬라이드 전환 속도(ms)
            pause: 3000            // 자동 슬라이드 시 각 슬라이드가 머무는 시간(ms)
        });
    });
</script>

<!-- ...기존 코드... -->

<!-- Chart.js CDN 추가 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<script type="text/javascript">
    $(document).ready(function(){
        $('.my_bxslider').bxSlider({
            controls: false, // 양 옆 버튼 제거
            touchEnabled : false, // 이걸 fasle로 해야 클릭시 링크로 이동 대신 드래그로 슬라이드 안됨
            auto: true,
            slideWidth: 600      // 슬라이드의 너비(px)


        });
    });
</script>





</body>
</html>

