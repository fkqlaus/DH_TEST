<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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
                            <span>작성자: ${post.userId}</span>
                            <span>작성일: ${post.postDate}</span>
                        </div>
                        <hr>
                        <div class="card-text" style="min-height: 300px;">
                            <c:out value="${post.post}" escapeXml="false"/>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between">
                            <button type="button" class="btn btn-secondary" onclick="goToList()">목록으로</button>
                            <div>
                                <c:set var="isOwner" value="${pageContext.request.userPrincipal.name == post.userId}" />
                                <sec:authorize access="hasRole('ROLE_ADMIN') or #isOwner">
                                    <c:if test="${isOwner or pageContext.request.isUserInRole('ROLE_ADMIN')}">
                                        <form id="updateForm" style="display:inline;">
                                            <input type="hidden" name="postId" value="${post.postId}">
                                            <button type="button" class="btn btn-danger" onclick="updatePost();">수정</button>
                                        </form>
                                        <form id="deleteForm" style="display:inline;">
                                            <input type="hidden" name="postId" value="${post.postId}">
                                            <button type="button" class="btn btn-danger" onclick="if(confirm('정말 삭제하시겠습니까?')) deletePost();">삭제</button>
                                        </form>
                                    </c:if>
                                </sec:authorize>
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
    function deletePost() {
        const form = document.getElementById('deleteForm');
        const postId = form.postId.value;
        fetch('/api/posts?postId=' + encodeURIComponent(postId), {
            method: 'DELETE',
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        }).then(res => {
            if (res.status === 204) {
                alert('삭제되었습니다.');
                location.href = '/posts';
            } else {
                alert('삭제 실패');
            }
        });
    }
</script>

<script>
    function updatePost() {
        const form = document.getElementById('updateForm');
        const postId = form.postId.value;
        // 페이지 이동만 하면 됨
        location.href = '/posts/' + encodeURIComponent(postId) + '/edit';
    }
</script>
<%--<script>--%>
<%--    function goToList() {--%>
<%--        // JSP에서 파라미터 값을 EL로 받아옴 (없으면 빈 문자열)--%>
<%--        const categoryName = '${categoryName}';--%>

<%--        // 쿼리스트링 조합--%>
<%--        let url = '/posts?categoryName=' + categoryName--%>
<%--            // encodeURIComponent(categoryName);--%>


<%--        location.href = url;--%>
<%--        // return url;--%>
<%--    }--%>
<%--</script>--%>
<script>
    function goToList() {
        if (document.referrer && document.referrer.includes('/posts')) {
            location.href = document.referrer;
        } else {
            location.href = '/posts';
        }
    }
</script>
</body>
</html>