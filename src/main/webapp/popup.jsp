<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>설문조사 팝업</title>
  <script>
    function submitSurvey() {
      // 설문조사 데이터 수집 (예/아니오 선택 결과)
      var surveyData = '';
      for (var i = 1; i <= 10; i++) {
        var answer = document.querySelector('input[name="question' + i + '"]:checked');
        surveyData += '질문' + i + ': ' + (answer ? answer.value : '선택 안함') + '\n';
      }

      // 부모 창의 함수를 호출하여 설문조사 데이터를 전달
      window.opener.receiveSurveyData(surveyData);
      // 팝업 창 닫기
      window.close();
    }
  </script>
</head>
<body>
<h2>설문조사</h2>
<form>
  <div>
    <label>질문 1: 신발을 자주 신으세요?</label><br>
    <input type="radio" name="question1" value="예"> 예
    <input type="radio" name="question1" value="아니오"> 아니오
  </div>
  <!-- 같은 형식으로 질문 2~10 추가 -->
  <div>
    <label>질문 10: 신발이 마음에 들면 추천하시겠습니까?</label><br>
    <input type="radio" name="question10" value="예"> 예
    <input type="radio" name="question10" value="아니오"> 아니오
  </div>
  <button type="button" onclick="submitSurvey()">제출</button>
</form>
</body>
</html>
