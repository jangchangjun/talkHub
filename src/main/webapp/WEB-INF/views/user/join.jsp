<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25. 3. 4.
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>talkhub</title>
</head>
<body>
<h1>TalkHub</h1>
<h3>회원가입</h3>
<form action="${pageContext.request.contextPath}/user/join-proceed">
    <label>아이디</label>
    <p>
        <label>
            <input type="text" name="id"/>
        </label>
    </p>
    <label>비밀번호</label>
    <p>
        <label>
            <input type="password" name="password"/>
        </label>
    </p>
    <label>닉네임</label>
    <p>
        <label>
            <input type="text" name="nickname"/>
        </label>
    </p>
    <label>성별</label>
    <p>
        <select name="gender">
            <option value="남">남</option>
            <option value="여">여</option>
            <option value="비공개">비공개</option>
        </select>
    </p>
    <label>출생년도</label>
    <p>
        <select name="birth">
            <c:forEach var="i" begin="1970" end="2025">
            <option value="${i}">${i}년</option>
            </c:forEach>
        </select>
    </p>
    <p>
        <button type="submit">확인</button>
    </p>
</form>
</body>
</html>
