<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>TalkHub - 글 작성</title>
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

    /* 폼 스타일 */
    .form-container {
      background-color: #fff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 500px;
      text-align: left;
    }

    /* 제목 스타일 */
    h2 {
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
    textarea {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      font-size: 14px;
    }

    textarea {
      resize: vertical;
      height: 150px;
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

<!-- 글 작성 폼 -->
<div class="form-container">
  <h2>글 작성</h2>
  <form action="${pageContext.request.contextPath}/post/write-proceed" method="post">
    <label for="title">제목</label>
    <input type="text" name="title" id="title" placeholder="제목을 입력하세요" required />

    <label for="category">카테고리</label>
    <input type="text" name="category" id="category" placeholder="카테고리 입력" required/>

    <label for="text">내용</label>
    <textarea name="text" id="text" placeholder="내용을 입력하세요" required></textarea>

    <button type="submit">등록</button>
  </form>
</div>

</body>
</html>
