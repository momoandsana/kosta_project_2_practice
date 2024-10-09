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
        /* 전체 글씨체 적용 */
        body {
            font-family: 'Noto Sans', sans-serif; /* 크림 스타일 폰트 */
        }

        /* 버튼 컨테이너 스타일 */
        .button-container {
            display: flex;
            justify-content: center; /* 버튼 중앙 정렬 */
            align-items: center;
            height: 100vh; /* 화면 중앙 배치 */
            gap: 20px; /* 버튼 간 간격 */
        }

        /* 구매 버튼 스타일 (크림 빨간색) */
        .purchase-btn {
            background-color: #ef6253; /* 크림 빨간색 */
            color: #fff; /* 흰색 텍스트 */
            font-weight: bold; /* 굵은 텍스트 */
            border-radius: 10px; /* 둥근 모서리 */
            padding: 20px; /* 버튼 크기 조정 */
            border: none; /* 테두리 제거 */
            width: 100%; /* 가로로 꽉 채우기 */
            max-width: 300px; /* 최대 버튼 너비 */
            transition: background-color 0.3s ease; /* 배경색 전환 효과 */
            display: flex; /* 수직선과 텍스트를 나란히 배치 */
            flex-direction: column; /* 수직 방향으로 정렬 */
            align-items: flex-start; /* 왼쪽 정렬 */
        }

        /* 판매 버튼 스타일 (크림 초록색) */
        .sell-btn {
            background-color: #41b979; /* 크림 초록색 */
            color: #fff; /* 흰색 텍스트 */
            font-weight: bold; /* 굵은 텍스트 */
            border-radius: 10px; /* 둥근 모서리 */
            padding: 20px; /* 버튼 크기 조정 */
            border: none; /* 테두리 제거 */
            width: 100%; /* 가로로 꽉 채우기 */
            max-width: 300px; /* 최대 버튼 너비 */
            transition: background-color 0.3s ease; /* 배경색 전환 효과 */
            display: flex; /* 수직선과 텍스트를 나란히 배치 */
            flex-direction: column; /* 수직 방향으로 정렬 */
            align-items: flex-start; /* 왼쪽 정렬 */
        }

        /* 즉시 구매가 스타일 (굵고 큰 글씨) */
        .price {
            font-size: 24px; /* 즉시 구매가 (숫자) */
            font-weight: 700; /* 굵은 글씨 */
            margin: 0; /* 여백 제거 */
            color: #fff; /* 흰색 텍스트 */
            text-align: left; /* 왼쪽 정렬 */
        }

        /* 즉시 구매 텍스트 스타일 (작은 글씨) */
        .purchase-text {
            font-size: 12px; /* 작은 텍스트 */
            color: #fff; /* 흰색 텍스트 */
            opacity: 0.7; /* 흐릿한 효과 */
            text-align: left; /* 왼쪽 정렬 */
        }

        /* 구매 및 판매 텍스트 크기 조정 */
        .action-text {
            font-size: 24px; /* 구매 및 판매 텍스트 크기 증가 */
            margin: 0; /* 여백 제거 */
            text-align: left; /* 왼쪽 정렬 */
        }

        /* 수직선 스타일 */
        .separator {
            margin: 0 10px; /* 수직선과 텍스트 간 간격 */
            font-size: 24px; /* 수직선 크기 */
            color: #fff; /* 흰색 텍스트 */
            font-weight: 300; /* 얇은 굵기 */
        }
    </style>
</head>
<body>

<div class="button-container">
    <!-- 구매 버튼 -->
    <button class="purchase-btn">
        <div style="display: flex; align-items: center;"> <!-- 구매 텍스트 및 수직선 -->
            <div class="action-text">구매</div>
            <span class="separator">|</span>
            <div class="price">120,000원</div> <!-- 즉시 구매가 -->
        </div>
        <div class="purchase-text">즉시 구매가</div> <!-- 즉시 구매 텍스트 -->
    </button>

    <!-- 판매 버튼 -->
    <button class="sell-btn">
        <div style="display: flex; align-items: center;"> <!-- 판매 텍스트 및 수직선 -->
            <div class="action-text">판매</div>
            <span class="separator">|</span>
            <div class="price">110,000원</div> <!-- 즉시 판매가 -->
        </div>
        <div class="purchase-text">즉시 판매가</div> <!-- 즉시 판매 텍스트 -->
    </button>
</div>

<!-- 부트스트랩 JS 및 의존성 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
