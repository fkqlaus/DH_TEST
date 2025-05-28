<!-- src/main/webapp/WEB-INF/views/layouts/space/header.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">

<!-- src/main/webapp/WEB-INF/views/layouts/space/header.jsp -->
<nav class="navbar navbar-expand-md navbar-light bg-light border-bottom py-3 mb-4">
  <div class="container-fluid">
    <!-- 왼쪽: Home -->
    <a class="navbar-brand" href="/">Home</a>
    <!-- 메뉴 -->
    <div class="collapse navbar-collapse" id="mainNavbar">
      <ul class="navbar-nav mx-auto">
        <!-- 드롭다운 메뉴들 -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="featuresDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            게시판
          </a>
          <div class="dropdown-menu" aria-labelledby="featuresDropdown">
            <a class="dropdown-item" href="/posts/list">공지사항</a>
            <a class="dropdown-item" href="/posts/list">자유게시판</a>
          </div>
        </li>
        <!-- 이하 동일하게 Pricing, FAQs, About 등 추가 -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pricingDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Pricing
          </a>
          <div class="dropdown-menu" aria-labelledby="pricingDropdown">
            <a class="dropdown-item" href="#">Plan A</a>
            <a class="dropdown-item" href="#">Plan B</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="faqsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            FAQs
          </a>
          <div class="dropdown-menu" aria-labelledby="faqsDropdown">
            <a class="dropdown-item" href="#">FAQ 1</a>
            <a class="dropdown-item" href="#">FAQ 2</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="aboutDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            About
          </a>
          <div class="dropdown-menu" aria-labelledby="aboutDropdown">
            <a class="dropdown-item" href="#">회사 소개</a>
            <a class="dropdown-item" href="#">연락처</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 오른쪽: 로그인/회원가입 + 햄버거버튼 -->
    <div class="d-flex align-items-center ms-auto">
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <ul class="navbar-nav flex-row order-1">
        <c:choose>
          <c:when test="${pageContext.request.userPrincipal == null}">
            <li class="nav-item"><a href="/login" class="nav-link px-3">Login</a></li>
            <li class="nav-item"><a href="/signup" class="nav-link px-3">Sign up</a></li>
          </c:when>
          <c:otherwise>
            <%-- 관리자 권한 체크는 Security 태그라이브러리 사용 권장 --%>
            <li class="nav-item">
              <span class="nav-link px-3">${pageContext.request.userPrincipal.name}님</span>
            </li>
            <li class="nav-item">
              <form action="/logout" method="post" style="margin: 0; padding: 0;">
                <button type="submit" class="nav-link px-3" style="background: none; border: none; width: 100%; text-align: left;">
                  Logout
                </button>
              </form>
            </li>
          </c:otherwise>
        </c:choose>
      </ul>
      <button class="navbar-toggler order-2 ms-2" type="button" data-toggle="collapse" data-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</nav>
<script>
  $('.nav-item.dropdown').hover(function() {
    $(this).addClass('show');
    $(this).find('.dropdown-menu').addClass('show');
  }, function() {
    $(this).removeClass('show');
    $(this).find('.dropdown-menu').removeClass('show');
  });
</script>