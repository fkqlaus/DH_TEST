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
                                            <li class="list-group-item">
                                                <strong>${comment.userId}</strong>
                                                <span class="text-muted small">
                                                    (${comment.commentDate})
                                                </span>
                                                <div>${comment.comment}</div>
                                            </li>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="list-group-item text-muted">아직 댓글이 없습니다.</li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                            <ul class="pagination">
                                <c:forEach var="i" begin="0" end="${comments.totalPages - 1}">
                                    <li class="page-item ${i == comments.number ? 'active' : ''}">
                                        <a class="page-link"
                                           href="?postId=${post.postId}&categoryName=${categoryName}&page=${i}&size=${comments.size}">
                                                ${i + 1}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>

                            

                        </div>



                        <!-- 댓글 영역 끝 -->
                        <button type="button" class="btn btn-secondary" onclick="goToList()">목록으로</button>


                    </div>
                </div>
            </section>
        </div>
    </div>
</main>

<!-- Footer -->
<c:import url="/WEB-INF/views/layouts/space/footer.jsp" />

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
    <%--const postId = '${post.postId}';--%>
    console.log('postId!!!!:', postId);

    // function loadComments(page = 0) {
    //     fetch('/api/comments/' + postId)
    //         .then(res => res.json())
    //         .then(data => {
    //             console.log('댓글 데이터:', data);
    //             renderComments(data);
    //         });
    // }
    <%--function formatCommentDate(arr) {--%>
    <%--    if (!Array.isArray(arr) || arr.length < 3) return '';--%>
    <%--    // arr: [year, month, day, hour, minute]--%>
    <%--    const [y, m, d, h = 0, min = 0] = arr;--%>
    <%--    return `${y}-${String(m).padStart(2, '0')}-${String(d).padStart(2, '0')} ${String(h).padStart(2, '0')}:${String(min).padStart(2, '0')}`;--%>
    <%--}--%>

    <%--function renderComments(data) {--%>
    <%--    let html = '<ul class="list-group mb-3">';--%>
    <%--    if (Array.isArray(data.content) && data.content.length > 0) {--%>
    <%--        data.content.forEach(comment => {--%>
    <%--            html += `<li class="list-group-item">--%>
    <%--            <strong>${comment.userId}</strong>--%>
    <%--            <div>${comment.comment}</div>--%>
    <%--        </li>`;--%>
    <%--        });--%>
    <%--    } else {--%>
    <%--        html += '<li class="list-group-item text-muted">아직 댓글이 없습니다.</li>';--%>
    <%--    }--%>
    <%--    html += '</ul>';--%>

    <%--    // 로그인 여부와 상관없이 폼 항상 추가--%>
    <%--    html += `--%>
    <%--    <form id="commentForm" class="d-flex gap-2" onsubmit="submitComment(event)">--%>
    <%--        <input type="hidden" name="postId" value="${postId}" />--%>
    <%--        <input type="text" name="comment" class="form-control" placeholder="댓글을 입력하세요" required />--%>
    <%--        <button type="submit" class="btn btn-primary">댓글 작성!!</button>--%>
    <%--    </form>--%>
    <%--`;--%>

    <%--    document.getElementById('comment-area').innerHTML = html;--%>
    <%--}--%>



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

    // 페이지 진입 시 최초 댓글 로딩
    // document.addEventListener('DOMContentLoaded', () => loadComments());
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
    // function goToList() {
    //     if (document.referrer && document.referrer.includes('/posts')) {
    //         location.href = document.referrer;
    //     } else {
    //         location.href = '/posts';
    //     }
    // }
</script>


</body>
</html>