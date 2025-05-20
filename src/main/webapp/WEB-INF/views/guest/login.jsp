<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>로그인</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
</head>
<body class="d-flex flex-column min-vh-100">

<!-- ✅ 로그인 화면 -->
<div class="container mt-5">
    <div class="row justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow">
                <div class="card-body">
                    <h2 class="text-center mb-4">로그인</h2>
                    <form action="/login" method="post">
                        <div class="form-group">
                            <label for="userId">아이디</label>
                            <input type="text" id="userId" name="userId" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>
                        <div class="d-flex justify-content-between mt-4">
                            <button type="submit" class="btn btn-primary">로그인</button>
                            <button type="button" class="btn btn-secondary" onclick="openRegisterModal()">회원가입</button>
                        </div>
                    </form>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger mt-3" role="alert">
                                ${error}
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ✅ 회원가입 모달 -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="/register" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLabel">회원가입</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="reg-username">아이디</label>
                        <input type="text" id="reg-username" name="username" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="reg-password">비밀번호</label>
                        <input type="password" id="reg-password" name="password" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="reg-email">이메일</label>
                        <input type="email" id="reg-email" name="email" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">회원가입</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- ✅ Bootstrap JS & jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function openRegisterModal() {
        $('#registerModal').modal('show');
    }
</script>

<jsp:include page="/WEB-INF/views/layouts/space/footer.jsp" />


</body>
</html>