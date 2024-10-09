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
        /* 페이지 전체의 폰트는 Noto Sans로 설정 */
        body {
            font-family: 'Noto Sans', sans-serif;
        }

        /* 버튼들이 화면 중앙에 위치하도록 설정 */
        .button-container {
            display: flex; /* 버튼들을 가로로 나열 */
            justify-content: center; /* 버튼들을 화면 중앙에 위치 */
            align-items: center; /* 수직 중앙에 맞춤 */
            height: 100vh; /* 버튼 컨테이너의 높이를 화면 전체 높이로 설정 */
            gap: 20px; /* 버튼들 간의 간격을 20px로 설정 */
            transform: scale(0.6); /* 전체 크기를 60%로 줄여 작은 크기처럼 보이게 설정 */
        }

        /* 각 버튼의 스타일을 지정하는 클래스 */
        .action-btn {
            color: #fff; /* 버튼 내 텍스트 색상 흰색 */
            font-weight: bold; /* 텍스트 굵게 설정 */
            border-radius: 10px; /* 버튼 모서리를 둥글게 설정 */
            padding: 10px; /* 버튼 내부 여백 설정 */
            border: none; /* 버튼 테두리 제거 */
            width: 100%; /* 버튼의 너비를 부모 요소(컨테이너)의 너비에 맞춤 */
            max-width: 350px; /* 버튼의 최대 너비를 350px로 제한 */
            display: flex; /* 버튼 내부 요소를 가로로 나열 */
            align-items: center; /* 내부 요소들을 수직 중앙에 맞춤 */
            position: relative; /* 자식 요소의 위치를 상대적으로 설정 가능하게 만듦 */
        }

        /* 구매 버튼 스타일 */
        .purchase-btn {
            background-color: #ef6253; /* 구매 버튼 배경색 설정 */
        }

        /* 판매 버튼 스타일 */
        .sell-btn {
            background-color: #41b979; /* 판매 버튼 배경색 설정 */
        }

        /* 구매, 판매 텍스트를 감싸는 컨테이너 */
        .action-text-container {
            width: 70px; /* 텍스트 컨테이너의 고정된 가로 크기 설정 */
            height: 70px; /* 텍스트 컨테이너의 고정된 세로 크기 설정 */
            display: flex; /* 컨테이너 내부 요소를 가로로 나열 */
            justify-content: center; /* 텍스트를 수평 중앙에 맞춤 */
            align-items: center; /* 텍스트를 수직 중앙에 맞춤 */
            box-sizing: border-box; /* padding, border 포함한 크기 계산 */
        }

        /* 구매, 판매 텍스트 스타일 */
        .action-text {
            font-size: 25px; /* 텍스트 크기를 25px로 설정 */
            font-weight: 900; /* 텍스트 굵기를 900으로 설정 */
            text-align: center; /* 텍스트를 중앙 정렬 */
        }

        /* 가격 및 설명을 감싸는 컨테이너 */
        .price-container {
            display: flex; /* 내부 요소를 세로로 나열 (column) */
            flex-direction: column; /* 세로 정렬 */
            align-items: flex-start; /* 내부 요소들을 왼쪽에 정렬 */
            position: relative; /* 자식 요소의 위치를 상대적으로 설정 가능하게 만듦 */
            margin-left: 20px; /* 텍스트 오른쪽으로 20px 이동 */
        }

        /* 가격 텍스트 스타일 */
        .price {
            font-size: 20px; /* 가격 텍스트 크기 */
            font-weight: 700; /* 가격 텍스트 굵게 설정 */
            color: #fff; /* 텍스트 색상 흰색 */
            margin: 0; /* 여백을 제거하여 밀착되도록 설정 */
        }

        /* 즉시 구매/판매 텍스트 스타일 */
        .purchase-text {
            font-size: 10px; /* 텍스트 크기 */
            color: #fff; /* 텍스트 색상 흰색 */
            opacity: 0.7; /* 투명도 설정으로 흐리게 보이게 */
            margin-top: -2px; /* 위쪽 여백을 줄여 가격과 가까이 배치 */
        }

        /* 구매/판매 텍스트와 가격 사이의 수직선을 만드는 클래스 */
        .separator {
            position: absolute; /* 절대 위치로 설정하여 버튼 내에서 상대적인 위치 지정 */
            left: 90px; /* 수직선의 위치를 텍스트에서 90px 떨어지게 설정 */
            top: 0; /* 수직선의 상단을 버튼 상단에 맞춤 */
            bottom: 0; /* 수직선의 하단을 버튼 하단에 맞춤 */
            width: 1px; /* 수직선의 두께 설정 */
            background-color: rgba(0, 0, 0, 0.15); /* 수직선 색상과 투명도 설정 */
        }
    </style>
</head>
<body>

<div class="button-container">
    <!-- 구매 버튼 -->
    <button class="action-btn purchase-btn">
        <div class="action-text-container">
            <div class="action-text">구매</div> <!-- 구매 텍스트 -->
        </div>
        <div class="separator"></div> <!-- 구매 버튼의 수직선 -->
        <div class="price-container">
            <div class="price">120,000원</div> <!-- 구매 가격 텍스트 -->
            <div class="purchase-text">즉시 구매가</div> <!-- 구매 설명 텍스트 -->
        </div>
    </button>

    <!-- 판매 버튼 -->
    <button class="action-btn sell-btn">
        <div class="action-text-container">
            <div class="action-text">판매</div> <!-- 판매 텍스트 -->
        </div>
        <div class="separator"></div> <!-- 판매 버튼의 수직선 -->
        <div class="price-container">
            <div class="price">110,000원</div> <!-- 판매 가격 텍스트 -->
            <div class="purchase-text">즉시 판매가</div> <!-- 판매 설명 텍스트 -->
        </div>
    </button>
</div>

<!-- 부트스트랩 JS 및 의존성 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
