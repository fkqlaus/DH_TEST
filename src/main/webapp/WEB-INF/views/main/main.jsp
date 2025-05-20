<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>메인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <!-- jQuery first, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
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
                        <h2 class="card-title mb-4">게시판</h2>
                        <p class="card-text">여기에 메인 콘텐츠를 추가하세요.</p>
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

</body>
</html>