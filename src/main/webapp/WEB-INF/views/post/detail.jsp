<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<c:import url="/WEB-INF/views/layouts/space/head.jsp" />
<body class="d-flex flex-column min-vh-100 bg-light">

<!-- Header -->
<c:import url="/WEB-INF/views/layouts/space/header.jsp" />

<main class="flex-grow-1 min-vh-90">
    <div class="container-fluid">
        <div class="row">
            <section class="col-md-8 py-4 mx-auto">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title mb-3">${post.postTitle}</h3>
                        <div class="mb-2 text-muted">
                            <span>작성자: ${post.user.userId}</span> &nbsp;|&nbsp;
                            <span>작성일: ${post.postDate}</span>
                        </div>
                        <hr>
                        <div class="card-text" style="min-height: 300px;">
                            <c:out value="${post.post}" escapeXml="false"/>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between">
                            <button type="button" class="btn btn-secondary" onclick="location.href='/posts/list'">목록으로</button>
                            <div>
                                <c:if test="${sessionScope.userId == post.user.userId}">
                                    <a href="/posts/edit?postId=${post.postId}" class="btn btn-primary">수정</a>
                                    <a href="/posts/delete?postId=${post.postId}" class="btn btn-danger"
                                       onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                                </c:if>
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

</body>
</html>