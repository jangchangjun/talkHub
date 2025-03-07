<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TalkHub - 로그인</title>
    <style>
        /* 기본 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* 로그인 폼 스타일 */
        .login-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        /* 제목 스타일 */
        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        /* 라벨 스타일 */
        label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        /* 입력창 스타일 */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        /* 버튼 스타일 */
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* 폼 내부 요소들 간의 간격을 설정 */
        p {
            margin: 10px 0;
        }

        /* 에러 메시지 스타일 */
        .error {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<!-- 로그인 폼 -->
<div class="login-container">
    <h1>로그인</h1>


    <form action="${pageContext.request.contextPath}/user/login-proceed" method="post">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" placeholder="아이디를 입력하세요" required />

        <label for="password">비밀번호</label>
        <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요" required />

        <button type="submit">확인</button>
    </form>
</div>

</body>
</html>
