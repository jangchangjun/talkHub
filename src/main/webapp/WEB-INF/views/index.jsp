<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>TalkHub</title>
    <style>
        /* 상단 바 스타일 */
        .header {
            display: flex;
            justify-content: space-between; /* 왼쪽과 오른쪽에 요소를 배치 */
            align-items: center; /* 세로 중앙 정렬 */
            padding: 10px;
            background-color: #f8f9fa;
        }

        /* 네비게이션 바 스타일 */
        .navbar a {
            margin-left: 15px; /* 링크 간격 */
            text-decoration: none;
            color: #007bff;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        /* h1 스타일 */
        h1 {
            margin: 0; /* 기본 여백 제거 */
            color: #333;
        }
    </style>
</head>
<body>

<!-- 상단에 위치하는 h1과 navbar를 포함하는 div -->
<div class="header">
    <!-- h1은 왼쪽에 위치 -->
    <h1>talkhub</h1>

    <!-- 상단 오른쪽에 위치하는 네비게이션 바 -->
    <div class="navbar">
        <c:choose>
            <c:when test="${authentication}">
                <a href="${pageContext.request.contextPath}/user/login">로그인</a>
                <a href="${pageContext.request.contextPath}/user/join">회원가입</a>
            </c:when>
            <c:otherwise>
                <a href="">마이페이지</a>
                <a href="">로그아웃</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>
