<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #333333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555555;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .form-group input:focus {
            border-color: #007bff;
            outline: none;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 15px;
            text-align: center;
        }
        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 10px; /* 버튼 간격 추가 */

        }
        .login-btn:hover {
            background-color: #0056b3;
        }
        .register-btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .modal {
            display: none; /* 초기 상태에서 모달 숨김 */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 반투명한 뒷배경 */
            justify-content: center;
            align-items: center;
            z-index: 1000; /* 모달이 다른 요소 위에 표시되도록 설정 */
        }

        .modal-content {
            background: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            z-index: 1001; /* 모달 내용이 뒷배경 위에 표시되도록 설정 */
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>로그인</h2>
    <form action="/login" method="post">
        <div class="form-group">
            <label for="username">아이디</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required>
        </div>
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>
        <button type="submit" class="login-btn">로그인</button>
        <button type="button" class="register-btn" onclick="openRegisterModal()">회원가입</button>

    </form>
</div>

<!-- 회원가입 모달 -->
<div class="modal" id="registerModal">
    <div class="modal-content">
        <h2>회원가입</h2>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="reg-username">아이디</label>
                <input type="text" id="reg-username" name="username" required>
            </div>
            <div class="form-group">
                <label for="reg-password">비밀번호</label>
                <input type="password" id="reg-password" name="password" required>
            </div>
            <div class="form-group">
                <label for="reg-email">이메일</label>
                <input type="email" id="reg-email" name="email" required>
            </div>
            <button type="submit" class="register-btn">회원가입</button>
            <button type="button" class="close-btn" onclick="closeModal('registerModal')">닫기</button>
        </form>
    </div>
</div>


<script>
    function openRegisterModal() {
        document.getElementById('registerModal').style.display = 'flex';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
</script>
</body>
</html>