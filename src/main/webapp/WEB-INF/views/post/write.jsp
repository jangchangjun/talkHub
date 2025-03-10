<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
      padding: 10px;
      box-sizing: border-box;
    }

    /* 폼 스타일 */
    .form-container {
      background-color: #fff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 500px;
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

    /* 버튼들 배치 */
    .button-container {
      display: flex;
      justify-content: space-between;
      gap: 10px; /* 버튼 간의 간격 설정 */
      margin-top: 20px;
    }

    .button-container button,
    .button-container a {
      width: 48%;  /* 두 버튼이 같은 너비로 배치되도록 설정 */
      padding: 10px;
      font-size: 16px;
      border-radius: 4px;
      cursor: pointer;
      text-align: center;
    }

    /* 기본 버튼 스타일 */
    button {
      background-color: #007bff;
      color: white;
      border: none;
    }

    button:hover {
      background-color: #0056b3;
    }

    /* 홈으로 버튼 스타일 (회색 배경) */
    .home-button {
      background-color: #6c757d; /* 회색 배경 */
      color: white;
      text-decoration: none;
    }

    .home-button:hover {
      background-color: #5a6268; /* hover시 어두운 회색으로 변경 */
    }

    /* 미디어 쿼리 - 모바일에서도 잘 보이게 */
    @media (max-width: 600px) {
      /* 버튼들을 세로로 배치 */
      .button-container {
        flex-direction: row; /* 모바일에서도 버튼이 가로로 나란히 배치되도록 설정 */
      }

      .button-container button,
      .button-container a {
        width: 48%; /* 가로로 배치되지만, 너비는 48%로 설정 */
        margin-bottom: 10px; /* 버튼들 사이에 간격을 두기 위해 추가 */
      }
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

    <!-- 버튼들을 동일한 크기로 배치 -->
    <div class="button-container">
      <button type="submit">등록</button>
      <a href="${pageContext.request.contextPath}/index" class="home-button">홈으로</a>
    </div>
  </form>
</div>

</body>
</html>
