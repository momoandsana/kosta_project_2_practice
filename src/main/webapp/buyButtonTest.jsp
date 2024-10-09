<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>구매 및 판매 버튼</title>

    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts (Noto Sans) -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Noto Sans', sans-serif;
        }

        /* 버튼들이 화면 중앙에 위치하도록 설정 */
        .button-container {
            display: flex;
            justify-content: space-between; /* 버튼들 사이에 균등한 간격 유지 */
            align-items: center;
            width: 100%;
            gap: 10px; /* 버튼들 간의 간격을 10px로 설정 */
        }

        /* 각 버튼의 스타일을 지정하는 클래스 */
        .action-btn {
            color: #fff;
            font-weight: bold;
            border-radius: 10px;
            padding: 10px; /* 버튼 내 여백을 줄임 */
            border: none;
            width: 100%; /* 버튼의 너비를 부모 요소의 너비에 맞춤 */
            max-width: 400px; /* 버튼의 최대 너비를 350px로 설정하여 더 길게 만듦 */
            height: 70px; /* 버튼의 높이를 50px로 줄임 */
            display: flex;
            align-items: center;
            position: relative;
        }

        /* 구매 버튼 스타일 */
        .purchase-btn {
            background-color: #ef6253;
        }

        /* 판매 버튼 스타일 */
        .sell-btn {
            background-color: #41b979;
        }

        /* 구매, 판매 텍스트를 감싸는 컨테이너 */
        .action-text-container {
            width: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* 구매, 판매 텍스트 스타일 - 텍스트를 왼쪽 벽과 검정선 기준 중앙에 배치 */
        .action-text {
            font-size: 16px;
            font-weight: 900;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }

        /* 가격 및 설명을 감싸는 컨테이너 */
        .price-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-left: 20px;
        }

        /* 가격 텍스트 스타일 */
        .price {
            font-size: 14px;
            font-weight: 700;
            color: #fff;
            margin: 0;
        }

        /* 즉시 구매/판매 텍스트 스타일 */
        .purchase-text {
            font-size: 10px;
            color: #fff;
            opacity: 0.7;
            margin-top: -2px;
        }

        /* 구매/판매 텍스트와 가격 사이의 수직선을 만드는 클래스 */
        .separator {
            position: absolute;
            left: 80px; /* 수직선을 텍스트로부터 80px 떨어지게 설정 */
            top: 10%; /* 수직선의 상단을 약간 여백을 주고 설정 */
            bottom: 10%; /* 수직선의 하단을 약간 여백을 주고 설정 */
            width: 1px;
            background-color: rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>

<div class="button-container">
    <!-- 구매 버튼 -->
    <button class="action-btn purchase-btn">
        <div class="action-text-container">
            <div class="action-text">구매</div>
        </div>
        <div class="separator"></div>
        <div class="price-container">
            <div class="price">120,000원</div>
            <div class="purchase-text">즉시 구매가</div>
        </div>
    </button>

    <!-- 판매 버튼 -->
    <button class="action-btn sell-btn">
        <div class="action-text-container">
            <div class="action-text">판매</div>
        </div>
        <div class="separator"></div>
        <div class="price-container">
            <div class="price">110,000원</div>
            <div class="purchase-text">즉시 판매가</div>
        </div>
    </button>
</div>

<!-- 부트스트랩 JS 및 의존성 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
