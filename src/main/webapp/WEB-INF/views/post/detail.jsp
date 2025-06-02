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
                        <!-- 게시글 본문 및 버튼 영역 -->
                        <div class="d-flex justify-content-between">
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
                        <!-- 댓글 영역 시작 -->
                        <div class="mt-4">
                            <h5 class="mb-3">댓글</h5>

                            <ul class="list-group mb-3">
                                <sec:authorize access="isAuthenticated()">
                                    <form id="commentForm" class="d-flex gap-2 mt-2" onsubmit="submitComment(event)">
                                        <input type="hidden" name="postId" value="${post.postId}" />
                                        <input type="text" name="comment" class="form-control" placeholder="댓글을 입력하세요" required />
                                        <button type="submit" class="btn btn-primary">댓글 작성!!</button>
                                    </form>
                                </sec:authorize>
                                <c:choose>
                                    <c:when test="${comments.totalElements > 0}">
                                        <c:forEach var="comment" items="${comments.content}">
                                            <li class="list-group-item position-relative">
                                                <c:if test="${pageContext.request.userPrincipal.name == comment.userId || pageContext.request.isUserInRole('ROLE_ADMIN')}">
                                                    <div class="dropdown comment-menu">
                                                        <button class="btn btn-link p-0 m-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="position:absolute; right:8px; top:8px;">
                                                            <svg width="24" height="24" fill="none" stroke="#888" stroke-width="2">
                                                                <circle cx="7" cy="12" r="1.5"></circle>
                                                                <circle cx="13" cy="12" r="1.5"></circle>
                                                                <circle cx="19" cy="12" r="1.5"></circle>
                                                            </svg>
                                                        </button>
                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item" href="#" onclick="editComment('${comment.commentId}', '${comment.comment}'); return false;">수정</a>
                                                            <a class="dropdown-item text-danger" href="#" onclick="deleteComment('${comment.commentId}'); return false;">삭제</a>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <strong>${comment.userId}</strong>
                                                <span class="text-muted small">(${comment.commentDate})</span>
                                                <div>${comment.comment}</div>
                                            </li>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="list-group-item text-muted">아직 댓글이 없습니다.</li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                            <div style="text-align:center; margin-top:20px;">
                                <c:if test="${comments.totalPages > 0}">
                                    <div class="custom-pagination">
                                        <c:forEach var="i" begin="0" end="${comments.totalPages - 1}">
                                            <a href="?postId=${post.postId}&categoryName=${categoryName}&page=${i}&size=${comments.size}"
                                               class="page-num${i == comments.number ? ' active' : ''}">
                                                    ${i + 1}
                                            </a>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!-- 댓글 영역 끝 -->
                        <button type="button" class="btn btn-secondary" onclick="goToList()">목록으로</button>
                    </div>
                </div>
            </section>
        </div>
    </div>
</main>


<sec:authorize access="isAuthenticated()">
    <script>
        // 로그인한 경우에만 userId 할당
        const userId = '${pageContext.request.userPrincipal.name}';
    </script>
</sec:authorize>
<script>
    // postId는 null일 수 있으니 기본값 처리
    const postId = '${empty post.postId ? "" : post.postId}';
    console.log('postId:', postId);
</script>


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
                location.href = '/posts?categoryName=' + encodeURIComponent('${categoryName}');
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
<script>
    <%--const postId = '${post.postId}';--%>
    console.log('postId!!!!:', postId);

    function submitComment(e) {
        e.preventDefault();
        const form = e.target;
        const comment = form.comment.value;
        fetch('/api/comments', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({ postId, comment, userId })
        }).then(() => {
            // loadComments(0);
            form.comment.value = '';
        });
    }
</script>
<script>
    function goToList() {
        const lastUrl = sessionStorage.getItem('lastPostListUrl');
        if (lastUrl && lastUrl.includes('/posts')) {
            location.href = lastUrl;

        } else {
            location.href = '/posts?categoryName=' + encodeURIComponent('${categoryName}');
        }
    }
</script>

<!-- Footer -->
<c:import url="/WEB-INF/views/layouts/space/footer.jsp" />

</body>
</html>