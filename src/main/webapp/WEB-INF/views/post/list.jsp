<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<c:import url="/WEB-INF/views/layouts/space/head.jsp" />
<body class="d-flex flex-column min-vh-100 bg-light">

<!-- Header -->
<c:import url="/WEB-INF/views/layouts/space/header.jsp" />

<!-- Main Content -->
<main class="flex-grow-1 min-vh-90">
    <div class="container-fluid">
        <div class="row">
            <section class="col-md-10 py-4 mx-auto">
                <div class="card shadow-sm h-100" style="min-height: 1000px;">
                    <div class="card-body">
                        <!-- 검색 폼 - 테이블 위에 배치 -->
                        <div class="mb-3">
                            <form action="/posts/list" method="get" class="d-flex gap-2">
                                <input type="text" name="searchTitle" class="form-control w-25"
                                       value="${searchTitle}" placeholder="제목 검색">
                                <button type="submit" class="btn btn-primary">검색</button>
                            </form>

                            <c:if test="${pageContext.request.userPrincipal != null}">
                                <a href="/posts/write" class="btn btn-success float-end">글쓰기</a>
                            </c:if>
                        </div>

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th style="text-align: center; padding-left: 24px; padding-right: 24px;">제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${totalItems == 0}">
                                    <tr>
                                        <td colspan="4" class="text-center">등록된 게시물이 없습니다.</td>
                                    </tr>
                                </c:if>
                                
                                <c:forEach items="${posts}" var="post">
                                    <tr>
                                        <td>${post.postId}</td>
                                        <td style="text-align: center; padding-left: 24px; padding-right: 24px;">
                                            <a href="/posts/${post.postId}">
                                                    ${post.postTitle}
                                            </a>
                                        </td>
                                        <td>${post.user.userId}</td>
                                        <td>${post.postDate}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <!-- 페이징 - 테이블 아래에 배치 -->
                        <c:if test="${totalItems > 0}">
                            <div class="pagination justify-content-center mt-4">
                                <c:if test="${currentPage > 0}">
                                    <a href="?page=${currentPage - 1}&searchTitle=${searchTitle}" 
                                       class="btn btn-outline-primary mx-1">이전</a>
                                </c:if>

                                <c:forEach begin="0" end="${totalPages > 0 ? totalPages - 1 : 0}" var="i">
                                    <c:choose>
                                        <c:when test="${currentPage == i}">
                                            <a href="#" class="btn btn-primary mx-1">${i + 1}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="?page=${i}&searchTitle=${searchTitle}" 
                                               class="btn btn-outline-primary mx-1">${i + 1}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${currentPage < totalPages - 1}">
                                    <a href="?page=${currentPage + 1}&searchTitle=${searchTitle}" 
                                       class="btn btn-outline-primary mx-1">다음</a>
                                </c:if>
                            </div>
                        </c:if>
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