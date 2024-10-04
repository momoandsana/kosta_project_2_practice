<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>설문조사 페이지</title>
  <script>
    // 팝업창 열기
    function openSurveyPopup() {
      window.open('popup.jsp', 'surveyPopup', 'width=500,height=600');
    }

    // 팝업창에서 설문 데이터를 부모 페이지로 전송
    function receiveSurveyData(surveyData) {
      // 설문조사 데이터를 특정 링크로 전송
      window.location.href = 'https://your-target-link.com?surveyData=' + encodeURIComponent(surveyData);
    }

    // 페이지가 로드되면 팝업을 자동으로 띄우기
    window.onload = function() {
      openSurveyPopup();
    };
  </script>
</head>
<body>
<h1>설문조사 페이지에 오신 것을 환영합니다!</h1>
</body>
</html>
