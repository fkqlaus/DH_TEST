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
        <div class="row">
            <!-- 메인 콘텐츠 -->
            <section class="col-md-10 py-4 mx-auto min-vh-90">
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

<!-- ...기존 코드... -->

<!-- Chart.js CDN 추가 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</body>
</html>

</body>
</html>