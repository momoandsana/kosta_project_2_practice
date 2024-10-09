<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>이커머스 사이트</title>
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

    /* 검색 바 스타일 */
    .search-bar {
      display: flex;
      justify-content: center;
      margin-bottom: 20px;
    }

    .search-bar input {
      width: 300px;
      padding: 10px;
      font-size: 14px;
      border: 1px solid #d1d1d1;
      border-radius: 4px;
    }

    .search-bar button {
      padding: 10px 20px;
      margin-left: 10px;
      font-size: 14px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    /* 제품 리스트 스타일 */
    .product-list {
      display: flex;
      justify-content: space-around;
      margin-top: 20px;
      flex-wrap: wrap;
    }

    .product {
      background-color: white;
      border: 1px solid #d1d1d1;
      border-radius: 8px;
      width: 200px;
      margin: 20px;
      padding: 10px;
      text-align: center;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .product img {
      width: 100%;
      height: auto;
    }

    .product h3 {
      font-size: 18px;
      margin: 10px 0;
    }

    .product p {
      color: #888;
      margin: 5px 0;
    }

    .product button {
      padding: 8px 16px;
      font-size: 14px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-top: 10px;
    }

    /* 차트와 관련된 버튼과 차트를 감싸는 컨테이너 */
    .chart-button-container {
      display: flex;
      flex-direction: column;
      align-items: flex-start; /* 왼쪽 정렬 */
      position: absolute;
      bottom: 100px;
      left: 50px;
      width: 25%;
    }

    /* 시세 제목 */
    h2.chart-title {
      font-size: 40px;
      margin-bottom: 10px;
      color: #333;
      text-align: left;
      font-weight: bold;
      position: relative;
      left: 0; /* 제목을 왼쪽 정렬 */
    }

    .chart-container {
      width: 100%;
      height: auto;
      position: relative;
      left: 0; /* 차트와 제목의 왼쪽을 맞추기 */
    }

    /* 차트의 크기를 줄이기 위한 스타일 */
    .chart-container canvas {
      width: 12.5%;
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
      padding: 8px 16px;
      font-size: 12px;
      background-color: #fff;
      color: #333;
      border: 1px solid #d1d1d1;
      border-radius: 4px;
      cursor: pointer;
      margin: 0 5px;
      transition: background-color 0.3s, color 0.3s;
    }

    /* 버튼 호버 시 배경을 어두운 회색으로 변경하고, 텍스트 색상을 흰색으로 변경 */
    button:hover {
      background-color: #444;
      color: #fff;
    }

    /* 다른 요소와 차트가 겹치지 않도록 상위 요소 */
    .main-content {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-grow: 1;
    }
  </style>
</head>
<body>
<h1>이커머스 사이트</h1>

<!-- 검색 바 -->
<div class="search-bar">
  <input type="text" placeholder="상품 검색...">
  <button>검색</button>
</div>

<!-- 팝업 관련 버튼들 -->
<div class="popup-button-container">
  <button onclick="openSurveyPopup()">설문조사 팝업</button>
  <button onclick="openBidUpdatePopup()">입찰갱신 팝업</button>
</div>

<!-- 제품 리스트 -->
<div class="product-list">
  <div class="product">
    <img src="https://via.placeholder.com/200" alt="상품 이미지">
    <h3>상품 1</h3>
    <p>가격: 50,000원</p>
    <button>장바구니에 추가</button>
  </div>

  <div class="product">
    <img src="https://via.placeholder.com/200" alt="상품 이미지">
    <h3>상품 2</h3>
    <p>가격: 75,000원</p>
    <button>장바구니에 추가</button>
  </div>

  <div class="product">
    <img src="https://via.placeholder.com/200" alt="상품 이미지">
    <h3>상품 3</h3>
    <p>가격: 120,000원</p>
    <button>장바구니에 추가</button>
  </div>
</div>

<div class="main-content">
  <div class="chart-button-container">
    <!-- 시세 제목을 h2로 변경 -->
    <h2 class="chart-title">시세</h2>

    <!-- 차트는 왼쪽 하단에 위치하고 버튼은 priceChartJquery.jsp 내부에서 처리됨 -->
    <div class="chart-container">
      <jsp:include page="priceChartJquery.jsp" />
    </div>
  </div>
</div>

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
</body>
</html>
