<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>설문조사 및 입찰가 갱신</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      color: #333;
      margin: 0;
      padding: 20px;
    }
    h1 {
      text-align: center;
      font-size: 28px;
      color: #4a4a4a;
    }
    .container {
      text-align: center;
      margin-top: 50px;
    }
    button {
      display: inline-block;
      padding: 12px 24px;
      font-size: 16px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>
  <script>
    // 설문조사 팝업 열기
    function openSurveyPopup() {
      window.open('popup.jsp', 'surveyPopup', 'width=500,height=600');
    }

    // 입찰가 갱신 팝업 열기
    function openBidUpdatePopup() {
      window.open('bidUpdate.jsp', 'bidUpdatePopup', 'width=500,height=300');
    }

    // 설문 데이터 부모 페이지로 전송
    function receiveSurveyData(surveyData) {
      window.location.href = 'https://your-target-link.com?surveyData=' + encodeURIComponent(surveyData);
    }

    // 페이지 로드 시 두 개의 팝업을 자동으로 띄우기
    window.onload = function() {
      openSurveyPopup();       // 설문조사 팝업
      openBidUpdatePopup();    // 입찰가 갱신 팝업
    };
  </script>
</head>
<body>
<h1>설문조사 및 입찰가 갱신 알림</h1>
<div class="container">
  <button onclick="openSurveyPopup()">설문조사 시작</button>
  <button onclick="openBidUpdatePopup()">입찰가 갱신 알림 보기</button>
</div>
</body>
</html>
