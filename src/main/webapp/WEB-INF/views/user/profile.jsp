<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
<head>
    <title>프로필 : talkhub</title>
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
            overflow-x: hidden; /* 가로 스크롤 방지 */
            box-sizing: border-box;
        }

        /* 콘텐츠 박스 스타일 */
        .content-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 90%; /* 화면의 90% 너비로 조정 */
            max-width: 500px; /* 최대 너비를 500px로 제한 */
            text-align: left;
            box-sizing: border-box;
        }

        /* 제목 스타일 */
        h1 {
            color: #333;
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }

        /* 항목 스타일 */
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }

        /* 구분선 스타일 */
        hr {
            border: 1px solid #ddd;
            margin: 20px 0;
        }

        /* 버튼 스타일 */
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            width: 100%; /* 버튼을 전체 너비로 확대 */
        }

        button:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }

        button:hover {
            background-color: #0056b3;
        }

        footer {
            text-align: center;
            margin-top: 30px;
        }

        footer a {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* 미디어 쿼리 추가 - 작은 화면에서 스타일 조정 */
        @media (max-width: 600px) {
            h1 {
                font-size: 20px;
            }
            li {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<!-- 프로필 콘텐츠 -->
<div class="content-container">
    <h1>프로필 확인</h1>
    <hr>
    <ul>
        <li>아이디 : ${user.id}</li>
        <li>활동명 : ${user.nickname}</li>
        <li>성별 : ${user.gender}</li>
        <li>생년 : ${user.birth}</li>
        <li>가입일 : ${user.createdAt}</li>
    </ul>
    <hr>
    <footer>
        <a href="${pageContext.request.contextPath}/index">홈으로</a>
    </footer>
</div>

</body>
</html>
