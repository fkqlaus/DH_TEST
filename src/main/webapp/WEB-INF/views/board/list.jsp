<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<c:import url="/WEB-INF/views/layouts/space/head.jsp" />
<body class="d-flex flex-column min-vh-100 bg-light">

<!-- Header -->
<c:import url="/WEB-INF/views/layouts/space/header.jsp" />

<!-- Main Content -->
<main class="flex-grow-1 min-vh-90" >
    <div class="container-fluid">
        <div class="row">
<%--            <div class="col-md-10 mx-auto">--%>
<%--                <h1 class="mb-4">게시판</h1>--%>
                <!-- 게시판 리스트 -->
                <section class="col-md-10 py-4 mx-auto">

                    <div class="card shadow-sm h-100" style="min-height: 1000px;">
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- 게시글 데이터 반복 -->
                                <c:forEach var="post" items="${posts}">
                                    <tr>
                                        <td>${post.id}</td>
                                        <td><a href="/board/view?id=${post.id}">${post.title}</a></td>
                                        <td>${post.author}</td>
                                        <td>${post.date}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
<%--                    </div>--%>
                </section>

            </div>

        </div>
    </div>
</main>

<!-- Footer -->
<c:import url="/WEB-INF/views/layouts/space/footer.jsp" />

</body>
</html>