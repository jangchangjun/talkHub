<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
      justify-content: center;  /* 세로 방향 중앙 정렬 */
      align-items: center;      /* 가로 방향 중앙 정렬 */
      min-height: 100vh;        /* 화면 높이를 최소화 */
      padding: 10px;            /* 화면에 패딩을 추가하여 여백 확보 */
      box-sizing: border-box;  /* 모든 요소의 크기를 padding, border 포함하여 계산 */
      overflow-x: hidden;       /* 가로 스크롤 방지 */
    }

    /* 콘텐츠 박스 스타일 */
    .content-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 100%;                /* 화면의 100% 너비로 조정 */
      max-width: 500px;          /* 최대 너비를 500px로 제한 */
      text-align: left;
      box-sizing: border-box;
    }

    /* 제목 스타일 */
    h2, h3 {
      color: #333;
      word-wrap: break-word; /* 긴 단어가 잘리지 않도록 줄 바꿈 처리 */
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
      word-wrap: break-word; /* 긴 단어가 잘리지 않도록 줄 바꿈 처리 */
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

    /* 목록 버튼 스타일 */
    footer {
      text-align: center;
      margin-top: 20px;
    }

    footer a {
      color: #007bff;
      text-decoration: none;
      font-size: 14px;
    }

    footer a:hover {
      text-decoration: underline;
    }

    /* 미디어 쿼리 - 화면 크기가 작은 경우 */
    @media (max-width: 600px) {
      h2 {
        font-size: 18px;
      }
      h3 {
        font-size: 16px;
      }
      .post-text {
        font-size: 14px; /* 글 내용 폰트 크기 조정 */
      }
      footer a {
        font-size: 12px;
      }
      button {
        font-size: 12px; /* 버튼 폰트 크기 조정 */
      }
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
  <h3>${post.title}</h3>
  <p>작성자: ${post.writerId}</p>
  <p>카테고리: ${post.category}</p>
  <hr>
  <h3>글 내용</h3>
  <p class="post-text">${post.text}</p>

  조회수 : ${post.views} 좋아요 : ${post.likes}
</div>

<c:choose>
  <c:when test="${already}">
    <button type="button" disabled>이미 추천한 글</button>
  </c:when>
  <c:otherwise>
    <a href="${pageContext.request.contextPath}/post/like-proceed?id=${param.id}">
      <button type="button">좋아요</button>
    </a>
  </c:otherwise>
</c:choose>

<footer>
  <a href="${pageContext.request.contextPath}/post/list">목록</a>
</footer>

</body>
</html>
