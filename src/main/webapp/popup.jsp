<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>설문조사 팝업</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      color: #333;
      margin: 0;
      padding: 20px;
      width: 400px; /* 팝업 창 너비 줄이기 */
    }
    h2 {
      text-align: center;
      font-size: 26px; /* 제목 크기 증가 */
      color: #4a4a4a;
    }
    form {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 100%; /* 폼 최대 너비 조정 */
      margin: 0 auto;
    }
    label {
      font-size: 18px; /* 레이블 크기 증가 */
      color: #333;
      display: block; /* 레이블을 블록으로 설정 */
      margin-bottom: 10px; /* 레이블 아래 여백 추가 */
    }
    input[type="radio"] {
      margin-right: 10px;
      transform: scale(1.5); /* 라디오 버튼 크기 증가 */
    }
    .question {
      margin-bottom: 20px; /* 질문 간 여백 증가 */
    }
    button {
      display: block;
      width: 100%;
      padding: 15px; /* 버튼 패딩 증가 */
      font-size: 18px; /* 버튼 폰트 크기 증가 */
      color: white;
      background-color: #00D084; /* 민트 그린 */
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-top: 20px;
    }
    button:hover {
      background-color: #00A86B; /* 어두운 민트 그린 */
    }
  </style>
</head>
<body>
<h2>신발 취향 설문조사</h2>
<form action="SurveyServlet" method="POST">
  <div class="question">
    <label>1. 당신이 선호하는 신발 브랜드는?</label>
    <input type="radio" name="brand" value="나이키"> 나이키
    <input type="radio" name="brand" value="아디다스"> 아디다스
    <input type="radio" name="brand" value="퓨마"> 퓨마
    <input type="radio" name="brand" value="구찌"> 구찌
    <input type="radio" name="brand" value="조던"> 조던
    <input type="radio" name="brand" value="에르메스"> 에르메스
  </div>

  <div class="question">
    <label>2. 당신이 선호하는 신발의 색깔은?</label>
    <input type="radio" name="color" value="검정색"> 검정색
    <input type="radio" name="color" value="흰색"> 흰색
    <input type="radio" name="color" value="유채색"> 유채색
  </div>

  <div class="question">
    <label>3. 당신이 선호하는 신발 카테고리는?</label>
    <input type="radio" name="category" value="스니커즈"> 스니커즈
    <input type="radio" name="category" value="슬리퍼"> 슬리퍼
    <input type="radio" name="category" value="구두"> 구두
  </div>

  <div class="question">
    <label>4. 소장용 신발을 찾고 계십니까?</label>
    <input type="radio" name="collection" value="예"> 예
    <input type="radio" name="collection" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>5. 50만원 이상의 신발을 구매할 의향이 있으십니까?</label>
    <input type="radio" name="budget" value="예"> 예
    <input type="radio" name="budget" value="아니오"> 아니오
  </div>

  <button type="submit">제출</button>
</form>
</body>
</html>
