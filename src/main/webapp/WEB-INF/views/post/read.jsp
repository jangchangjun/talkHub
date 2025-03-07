<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>TalkHub - 글 상세보기</title>
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
    h2, h3 {
      color: #333;
    }

    /* 글 작성자 및 카테고리 스타일 */
    p {
      font-size: small;
      color: #555;
    }

    /* 글 내용 스타일 */
    .post-text {
      margin-top: 15px;
      font-size: 16px;
      color: #333;
    }

    /* 목록 버튼 스타일 */
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
  </style>
</head>
<body>

<!-- 글 상세보기 콘텐츠 -->
<div class="content-container">
  <h2>글 상세보기</h2>
  <p>
    식별 번호 ${param.id}의 조회결과입니다.
  </p>
  <hr>
  <h3>${post.getTitle()}</h3>
  <p>작성자: ${post.getWriterID()}</p>
  <p>카테고리: ${post.getCategory()}</p>
  <hr>
  <h3>글 내용</h3>
  <p class="post-text">${post.getText()}</p>
</div>

<!-- 목록 버튼 -->
<footer>
  <a href="${pageContext.request.contextPath}/post/list">목록</a>
</footer>

</body>
</html>
