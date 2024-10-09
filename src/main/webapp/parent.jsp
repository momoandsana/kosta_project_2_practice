<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
      display: flex;
      flex-direction: column;
      height: 100vh;
    }

    h1 {
      text-align: center;
      font-size: 28px;
      color: #4a4a4a;
    }

    /* 차트와 관련된 버튼과 차트를 감싸는 컨테이너 */
    .chart-button-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-end;
      position: absolute;
      bottom: 20px;
      left: 20px;
      width: 25%; /* 화면의 4분의 1만 차지 */
    }

    .chart-container {
      width: 100%;
      height: auto;
    }

    /* 팝업 버튼은 차트와 무관하게 따로 배치 */
    .popup-button-container {
      display: flex;
      justify-content: center;
      margin-top: 20px;
      gap: 20px;
    }

    button {
      padding: 8px 16px; /* 더 작게 조정 */
      font-size: 12px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin: 0 5px;
    }

    button:hover {
      background-color: #0056b3;
    }

    /* 다른 요소와 차트가 겹치지 않도록 상위 요소 */
    .main-content {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-grow: 1;
    }
  </style>
  <script>
    function openSurveyPopup() {
      window.open('popup.jsp', 'surveyPopup', 'width=500,height=600');
    }

    function openBidUpdatePopup() {
      window.open('bidUpdate.jsp', 'bidUpdatePopup', 'width=500,height=300');
    }

    function receiveSurveyData(surveyData) {
      window.location.href = 'https://your-target-link.com?surveyData=' + encodeURIComponent(surveyData);
    }

    window.onload = function() {
      openSurveyPopup();
      openBidUpdatePopup();
    };
  </script>
</head>
<body>
<h1>설문조사 및 입찰가 갱신 알림</h1>

<!-- 팝업 관련 버튼들 -->
<div class="popup-button-container">
  <button onclick="openSurveyPopup()">설문조사 팝업</button>
  <button onclick="openBidUpdatePopup()">입찰갱신 팝업</button>
</div>

<div class="main-content">
  <div class="chart-button-container">
    <!-- 차트는 왼쪽 하단에 위치하고 버튼은 priceChartJquery.jsp 내부에서 처리됨 -->
    <div class="chart-container">
      <jsp:include page="priceChartJquery.jsp" />
    </div>
  </div>
</div>

</body>
</html>
