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
    }
    h2 {
      text-align: center;
      font-size: 24px;
      color: #4a4a4a;
    }
    form {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 400px;
      margin: 0 auto;
    }
    label {
      font-size: 16px;
      color: #333;
    }
    input[type="radio"] {
      margin-right: 10px;
    }
    .question {
      margin-bottom: 15px;
    }
    button {
      display: block;
      width: 100%;
      padding: 12px;
      font-size: 16px;
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
    <label>질문 1: 발볼이 넓은 편인가요?</label><br>
    <input type="radio" name="question1" value="예"> 예
    <input type="radio" name="question1" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>질문 2: 운동화의 착용감이 신발 선택에서 중요한 요소인가요?</label><br>
    <input type="radio" name="question2" value="예"> 예
    <input type="radio" name="question2" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>질문 3: 주로 러닝 또는 피트니스 목적으로 신발을 사용하시나요?</label><br>
    <input type="radio" name="question3" value="예"> 예
    <input type="radio" name="question3" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>질문 4: 레트로 또는 빈티지한 신발 디자인을 좋아하시나요?</label><br>
    <input type="radio" name="question4" value="예"> 예
    <input type="radio" name="question4" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>질문 5: 깔끔한 미니멀 디자인의 신발을 선호하시나요?</label><br>
    <input type="radio" name="question5" value="예"> 예
    <input type="radio" name="question5" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>질문 6: 방수 또는 방한 기능이 있는 신발을 자주 신으시나요?</label><br>
    <input type="radio" name="question6" value="예"> 예
    <input type="radio" name="question6" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>질문 7: 평소 신발의 브랜드를 중요하게 생각하시나요?</label><br>
    <input type="radio" name="question7" value="예"> 예
    <input type="radio" name="question7" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>질문 8: 화려하거나 눈에 띄는 색상의 신발을 선호하시나요?</label><br>
    <input type="radio" name="question8" value="예"> 예
    <input type="radio" name="question8" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>질문 9: 일상에서 주로 신을 신발을 찾으시나요?</label><br>
    <input type="radio" name="question9" value="예"> 예
    <input type="radio" name="question9" value="아니오"> 아니오
  </div>

  <div class="question">
    <label>질문 10: 고급스럽고 럭셔리한 디자인의 신발을 좋아하시나요?</label><br>
    <input type="radio" name="question10" value="예"> 예
    <input type="radio" name="question10" value="아니오"> 아니오
  </div>

  <button type="submit">제출</button>
</form>
</body>
</html>
