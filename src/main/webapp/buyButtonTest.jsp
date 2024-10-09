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

        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            gap: 20px;
        }

        .action-btn {
            color: #fff;
            font-weight: bold;
            border-radius: 10px;
            padding: 20px;
            border: none;
            width: 100%;
            max-width: 300px;
            display: flex;
            align-items: center;
            position: relative;
        }

        .purchase-btn {
            background-color: #ef6253;
        }

        .sell-btn {
            background-color: #41b979;
        }

        /* 판매, 구매 텍스트 정사각형 안의 중심에 위치 */
        .action-text {
            font-size: 24px;
            width: 80px; /* 고정된 폭을 줘서 정사각형처럼 보이게 함 */
            text-align: center; /* 가운데 정렬 */
        }

        .price-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            position: relative;
            margin-left: 20px; /* 오른쪽으로 이동 */
        }

        .price {
            font-size: 24px;
            font-weight: 700;
            color: #fff;
            margin: 0;
        }

        .purchase-text {
            font-size: 12px;
            color: #fff;
            opacity: 0.7;
            margin-top: -2px;
        }

        .separator {
            width: 1px;
            background-color: rgba(0, 0, 0, 0.3);
            height: 100%; /* 선을 더 길게 설정 */
            margin-left: 10px;
        }
    </style>
</head>
<body>

<div class="button-container">
    <!-- 구매 버튼 -->
    <button class="action-btn purchase-btn">
        <div class="action-text">구매</div>
        <div class="separator"></div> <!-- 수직선 -->
        <div class="price-container">
            <div class="price">120,000원</div> <!-- 즉시 구매가 -->
            <div class="purchase-text">즉시 구매가</div> <!-- 즉시 구매 텍스트 -->
        </div>
    </button>

    <!-- 판매 버튼 -->
    <button class="action-btn sell-btn">
        <div class="action-text">판매</div>
        <div class="separator"></div> <!-- 수직선 -->
        <div class="price-container">
            <div class="price">110,000원</div> <!-- 즉시 판매가 -->
            <div class="purchase-text">즉시 판매가</div> <!-- 즉시 판매 텍스트 -->
        </div>
    </button>
</div>

<!-- 부트스트랩 JS 및 의존성 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
