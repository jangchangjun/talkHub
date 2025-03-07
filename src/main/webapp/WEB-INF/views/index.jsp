<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>TalkHub</title>
    <style>
        /* 기본 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f6f9;
        }

        /* 상단 바 스타일 */
        .header {
            display: flex;
            justify-content: space-between; /* 왼쪽과 오른쪽에 요소를 배치 */
            align-items: center; /* 세로 중앙 정렬 */
            padding: 15px 30px;
            background-color: #007bff;
            color: white;
        }

        /* h1 스타일 */
        h1 {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
        }

        /* 네비게이션 바 스타일 */
        .navbar a {
            margin-left: 20px;
            text-decoration: none;
            color: white;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #ffd700;
        }

        /* 로그인/회원가입/마이페이지 버튼 hover 효과 */
        .navbar a:active {
            color: #ff6347;
        }

        /* 하단에 마진을 추가하여 공간 확보 */
        body > .header {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<!-- 상단에 위치하는 h1과 navbar를 포함하는 div -->
<div class="header">
    <!-- h1은 왼쪽에 위치 -->
    <h1>TalkHub</h1>

    <!-- 상단 오른쪽에 위치하는 네비게이션 바 -->
    <div class="navbar">
        <c:choose>
            <c:when test="${authentication}">
                <a href="${pageContext.request.contextPath}/user/profile">마이페이지</a>
                <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
                <a href="${pageContext.request.contextPath}/post/write">글작성</a>
                <a href="${pageContext.request.contextPath}/post/list">글목록</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/user/login">로그인</a>
                <a href="${pageContext.request.contextPath}/user/join">회원가입</a>
                <a href="${pageContext.request.contextPath}/post/list">글목록</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>
