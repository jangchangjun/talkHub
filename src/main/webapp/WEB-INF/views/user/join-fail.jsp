<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>TalkHub - 회원가입</title>
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

        /* 회원가입 폼 컨테이너 */
        .signup-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        /* 제목 스타일 */
        h1 {
            font-size: 28px;
            color: #007bff;
            margin-bottom: 10px;
        }

        h3 {
            font-size: 20px;
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
        input[type="password"],
        select {
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

        /* 선택창 간격 설정 */
        select {
            padding: 10px;
        }

        /* 에러 메시지 스타일 */
        .error {
            color: red;
            font-size: small;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<!-- 회원가입 폼 -->
<div class="signup-container">
    <h1>TalkHub</h1>
    <h3>회원가입</h3>

    <form action="${pageContext.request.contextPath}/user/join-proceed">
        <!-- 아이디 -->
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" placeholder="아이디를 입력하세요" required />
        <c:if test="${idError != null}">
            <p class="error">${idError}</p>
        </c:if>
        <c:if test="${idUniqueError != null}">
            <p class="error">${idUniqueError}</p>
        </c:if>

        <!-- 비밀번호 -->
        <label for="password">비밀번호</label>
        <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요" required />
        <c:if test="${passError != null}">
            <p class="error">${passError}</p>
        </c:if>

        <!-- 닉네임 -->
        <label for="nickname">닉네임</label>
        <input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력하세요" required />
        <c:if test="${nickError != null}">
            <p class="error">${nickError}</p>
        </c:if>

        <!-- 성별 -->
        <label for="gender">성별</label>
        <select name="gender" id="gender" required>
            <option value="남">남</option>
            <option value="여">여</option>
            <option value="비공개">비공개</option>
        </select>

        <!-- 출생년도 -->
        <label for="birth">출생년도</label>
        <select name="birth" id="birth" required>
            <c:forEach var="i" begin="1970" end="2025">
                <option value="${i}">${i}년</option>
            </c:forEach>
        </select>

        <!-- 확인 버튼 -->
        <button type="submit">확인</button>
    </form>
</div>

</body>
</html>
