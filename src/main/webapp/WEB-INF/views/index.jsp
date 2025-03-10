<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
<head>
    <title>TalkHub</title>
    <style>
        /* 기본 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f6f9;
            box-sizing: border-box; /* padding과 margin 포함한 크기 계산 */
        }

        /* 상단 바 스타일 */
        .header {
            display: flex;
            justify-content: space-between; /* 왼쪽과 오른쪽에 요소 배치 */
            align-items: center; /* 세로 중앙 정렬 */
            padding: 15px 10px; /* 상단 바 패딩 조정 */
            background-color: #007bff;
            color: white;
        }

        /* h1 스타일 */
        h1 {
            margin: 0;
            font-size: 24px; /* 기본 폰트 크기 조정 */
            font-weight: bold;
        }

        /* 네비게이션 바 스타일 */
        .navbar {
            display: flex;
            justify-content: flex-end;
            flex-wrap: wrap; /* 작은 화면에서 항목이 줄바꿈 되도록 설정 */
        }

        .navbar a {
            margin-left: 15px;
            text-decoration: none;
            color: white;
            font-size: 14px; /* 기본 폰트 크기 설정 */
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #ffd700;
        }

        .navbar a:active {
            color: #ff6347;
        }

        /* 하단에 마진을 추가하여 공간 확보 */
        body > .header {
            margin-bottom: 20px;
        }

        /* 미디어 쿼리 추가 - 화면 크기가 작은 경우 */
        @media (max-width: 600px) {
            h1 {
                font-size: 20px; /* 모바일에서는 제목 크기를 작게 */
            }

            .navbar a {
                font-size: 12px; /* 모바일에서 링크 폰트 크기 조정 */
                margin-left: 10px;
            }

            .header {
                padding: 10px; /* 상단 바 패딩을 줄여서 공간 확보 */
            }
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
                <a href="${pageContext.request.contextPath}/user/profile">마이페이지</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>
