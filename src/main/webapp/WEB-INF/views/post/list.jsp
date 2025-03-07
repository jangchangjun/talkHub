<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>TalkHub - 전체 글</title>
    <style>
        /* 기본 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f6f9;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* 콘텐츠 박스 스타일 */
        .content-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            text-align: left;
        }

        /* 제목 스타일 */
        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        /* 글 목록 스타일 */
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        ul li {
            margin: 10px 0;
        }

        ul li a {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }

        ul li a:hover {
            text-decoration: underline;
        }

        /* 목록 추가 버튼 스타일 */
        footer {
            text-align: center;
            margin-top: 30px;
        }

        footer a {
            margin: 0 15px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- 전체 글 콘텐츠 -->
<div class="content-container">
    <h2>전체 글</h2>
    <p>
        총 ${total}개의 글이 저장되어 있습니다.
    </p>
    <hr>
    <ul>
        <c:forEach var="i" begin="0" end="${total-1}">
            <li><a href="${pageContext.request.contextPath}/post/read?id=${datas[i].id}">${datas[i].title}</a></li>
        </c:forEach>
    </ul>
</div>

<!-- 글 작성 및 메인 페이지 링크 -->
<footer>
    <a href="${pageContext.request.contextPath}/post/write">글 작성</a>
    <a href="${pageContext.request.contextPath}/index">메인으로</a>
</footer>

</body>
</html>
