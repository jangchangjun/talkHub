<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25. 3. 4.
  Time: 오후 5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>talkhub</title>
</head>
<body>
<h1>로그인</h1>
<form action="${pageContext.request.contextPath}/user/login-proceed">
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
    <button type="submit">확인</button>
</form>
</body>
</html>
