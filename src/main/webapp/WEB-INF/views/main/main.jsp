<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 25. 5. 16.
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메인</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/resources/css/main.css">

</head>
<body class="d-flex flex-column min-vh-100">
<header class="header">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">메인 페이지</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">홈</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">게시판1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">문의하기</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">로그아웃</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<main class="container-fluid mt-4" role="main"  >
    <div class="row">
        <div class="col-md-2 border-right d-flex flex-column" style="min-height: 100vh;">
            <div class="list-group flex-grow-1">
                <c:choose>
                    <c:when test="${not empty menuList}">
                        <c:forEach var="menu" items="${menuList}">
                            <a href="${menu.link}" class="list-group-item list-group-item-action">${menu.name}</a>
                        </c:forEach>
                    </c:when>

                </c:choose>
            </div>
        </div>
        <div class="col-md-7 ml-5">
            <h2>게시판</h2>
            <p>여기에 메인 콘텐츠를 추가하세요.</p>
        </div>
    </div>
</main>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
