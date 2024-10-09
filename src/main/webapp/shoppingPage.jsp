<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>상품 상세 설명</title>

    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts (Noto Sans) -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

    <!-- 부트스트랩 아이콘 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css" rel="stylesheet">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        /* 기존 상품 상세 설명 스타일 */
        body {
            font-family: 'Noto Sans', sans-serif;
            background-color: #fff;
            margin: 0;
        }

        /* 헤더 스타일 */
        .navbar {
            background-color: #fff;
            padding: 20px;
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            color: #333;
        }

        .nav-link {
            color: #333;
            font-weight: bold;
        }

        .nav-link:hover {
            color: #41b979;
        }

        /* 상품 상세 페이지 */
        .product-details {
            display: flex;
            padding: 40px;
            justify-content: space-between;
            position: relative;
        }

        /* 상품 이미지 배경 */
        .product-image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8f8f5;
            border-radius: 10px;
            padding: 30px;
            width: 600px;
            height: 600px;
            margin: 0 auto;
        }

        .product-image {
            max-width: 500px;
            max-height: 500px;
            object-fit: cover;
            border-radius: 10px;
        }

        /* 중앙 얇은 수직선 */
        .divider {
            position: absolute;
            left: 50%;
            top: 0;
            bottom: 0;
            width: 1px;
            background-color: #ddd;
            transform: translateX(-50%);
            height: 100%;
        }

        /* 수평선 스타일 */
        hr.horizontal-divider {
            margin: 20px 0;
            border: 0;
            border-top: 1px solid #ddd;
            margin-left: auto;
            margin-right: auto;
            opacity: 0.7;
            width: 90%;
        }

        /* 설명과 정보 */
        .product-info {
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            padding-left: 40px;
        }

        .product-title {
            margin-bottom: 30px;
        }

        .product-description {
            margin-bottom: 30px;
        }

        .size-select {
            margin-bottom: 30px;
        }

        .product-specs {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .product-specs div {
            text-align: center;
            flex: 1;
            padding: 0 10px;
            border-right: 1px solid #ddd;
        }

        .product-specs div:last-child {
            border-right: none;
        }

        .product-specs span {
            display: block;
            font-weight: bold;
        }

        .product-specs .value {
            margin-top: 5px;
            font-size: 1.1rem;
            color: #333;
        }

        /* buyButtonTest.jsp 파일 포함 전후 공백 추가 */
        .buy-button {
            margin-bottom: 30px;
            margin-top: 30px;
        }

        /* 찜 목록 버튼 스타일 */
        .wishlist-button {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #fff;
            color: #333;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 50px;
            padding: 15px 30px;
            font-size: 1.2rem;
            margin-top: 20px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .wishlist-button i {
            margin-right: 10px;
        }

        .wishlist-button:hover {
            background-color: #f8f8f8;
            border-color: #333;
        }

        /* 푸터 스타일 */
        .footer {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            margin-top: 50px;
        }

        .footer a {
            color: #fff;
            margin: 0 10px;
            font-weight: bold;
        }

        .footer a:hover {
            color: #41b979;
        }

        /* 반응형 처리 */
        @media (max-width: 768px) {
            .product-details {
                flex-direction: column;
                height: auto;
            }

            .divider {
                display: none;
            }

            .product-image-container, .product-info {
                width: 100%;
            }

            .product-image {
                max-width: 100%;
                max-height: 300px;
            }

            .product-info {
                padding-left: 0;
            }

            .product-specs {
                flex-direction: column;
            }

            .product-specs div {
                padding: 10px 0;
            }
        }

        /* Price History 섹션 스타일 (ph- 접두사 추가) */
        .ph-container {
            display: flex;
            flex-direction: column;
            padding: 40px 20px;
            background-color: white; /* 배경색을 흰색으로 변경 */
            max-width: 600px; /* 상품 이미지 컨테이너와 동일한 너비 */
            transform: translateX(10px); /* 왼쪽으로 150px 이동 (조정 필요) */
            position: relative; /* 상대 위치 설정 */
            z-index: 1; /* 다른 요소들 위에 표시 */

        }

        .ph-frame {
            border: 2px solid #d1d1d1;
            border-radius: 10px;
            padding: 20px;
            background-color: white; /* 배경색 흰색으로 설정 */
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .ph-button-group {
            display: flex;
            width: 100%;
            border: 1px solid #d1d1d1;
            border-radius: 5px;
            overflow: hidden;
            background-color: white; /* 회색 배경 제거 */
            margin-bottom: 20px;
        }

        .ph-button-group button {
            padding: 10px 0;
            border: none;
            background-color: white;
            color: #333;
            cursor: pointer;
            outline: none;
            transition: background-color 0.3s, color 0.3s;
            font-weight: bold;
            flex-grow: 1;
        }

        .ph-button-group button.active {
            background-color: #222;
            color: white;
        }

        .ph-price-chart {
            width: 100%; /* 프레임 너비에 맞춤 */
            height: 300px; /* 높이를 줄임 */
            background-color: white; /* 배경색 흰색으로 설정 */
        }

        @media (max-width: 768px) {
            .ph-container {
                padding: 20px 0;
                max-width: 100%;
                transform: translateX(0); /* 모바일에서는 이동하지 않음 */
            }

            .ph-price-chart {
                height: 250px; /* 모바일에서 차트 높이 축소 */
            }
        }
    </style>
</head>
<body>

<!-- 메인 컨테이너 -->
<div class="main-container">

    <!-- 헤더 -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">Kream Clone</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">My Page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sell</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 메인 상품 상세 컨텐츠 -->
    <div class="product-details">
        <div class="product-image-container">
            <img src="https://via.placeholder.com/350" class="product-image" alt="상품 이미지">
        </div>

        <div class="divider"></div>

        <div class="product-info">
            <h1 class="product-title">상품 이름</h1>
            <p class="product-description">이곳에 상품에 대한 상세 설명을 추가하세요.</p>

            <div class="size-select">
                <label for="size" class="form-label"><strong>사이즈 선택</strong></label>
                <select class="form-select" id="size">
                    <option value="all">모든 사이즈</option>
                    <option value="230">230</option>
                    <option value="240">240</option>
                    <option value="250">250</option>
                    <option value="260">260</option>
                    <option value="270">270</option>
                </select>
            </div>

            <div class="product-specs">
                <div>
                    <span>최근 거래가</span>
                    <span class="value">120,000원</span>
                </div>
                <div>
                    <span>발매가</span>
                    <span class="value">100,000원</span>
                </div>
                <div>
                    <span>모델 번호</span>
                    <span class="value">ABC123</span>
                </div>
                <div>
                    <span>출시일</span>
                    <span class="value">2024-01-01</span>
                </div>
                <div>
                    <span>대표 색상</span>
                    <span class="value">검정</span>
                </div>
            </div>

            <div class="buy-button">
                <jsp:include page="buyButtonTest.jsp" />
            </div>

            <!-- 찜 목록 버튼 추가 -->
            <button class="wishlist-button" id="wishlistButton">
                <i class="bi bi-bookmark" id="wishlistIcon"></i>찜 목록에 추가
            </button>
        </div>
    </div>

    <!-- 수평선 추가 -->
    <hr class="horizontal-divider">

    <!-- Price History 섹션 추가 -->
    <div class="ph-container">
        <div class="ph-frame">
            <!-- 버튼을 클릭하면 특정 기간의 데이터를 로드하는 함수 호출 -->
            <div class="ph-button-group">
                <button id="ph-btn-1month" class="active" onclick="ph_loadData('1month', this)">1개월</button>
                <button id="ph-btn-3months" onclick="ph_loadData('3months', this)">3개월</button>
                <button id="ph-btn-6months" onclick="ph_loadData('6months', this)">6개월</button>
            </div>

            <canvas id="ph-priceChart" class="ph-price-chart"></canvas> <!-- 차트를 그릴 캔버스 요소 -->
        </div>
    </div>

    <!-- 푸터 -->
    <footer class="footer">
        <div class="container">
            <p>© 2024 Kream Clone. All Rights Reserved.</p>
            <p><a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </div>
    </footer>

</div>

<!-- 스크립트로 아이콘 변경 기능 추가 -->
<script>
    document.getElementById('wishlistButton').addEventListener('click', function() {
        var icon = document.getElementById('wishlistIcon');
        icon.classList.toggle('bi-bookmark-fill');
        icon.classList.toggle('bi-bookmark');
    });

    // Price History 섹션 스크립트
    let ph_chartInstance = null; // 차트 인스턴스를 저장할 변수

    function ph_loadData(period, button) { // 데이터를 로드하는 함수, 기간을 매개변수로 받음
        // 모든 버튼의 활성화 클래스 제거
        $('.ph-button-group button').removeClass('active');
        // 클릭한 버튼에 활성화 클래스 추가
        $(button).addClass('active');

        $.ajax({
            url: `/priceHistory?productId=1&period=${period}`, // 서버로부터 데이터를 요청
            type: 'GET', // 요청 방식
            dataType: 'json', // 서버가 반환하는 데이터 형식
            success: function(data) { // 데이터가 성공적으로 로드된 경우
                // 날짜를 MM/DD 형식으로 변환
                const labels = data.map(item => { // 각 데이터 항목의 날짜를 포맷
                    const date = new Date(item.date); // item.date를 Date 객체로 변환
                    return `${date.getMonth() + 1}/${date.getDate()}`; // 월/일 형식으로 포맷
                });
                const prices = data.map(item => item.price); // 가격 배열 생성
                const ctx = document.getElementById('ph-priceChart').getContext('2d'); // 캔버스의 2D 컨텍스트 가져오기

                // 기존 차트가 있으면 삭제
                if (ph_chartInstance) { // 이미 차트가 존재하는 경우
                    ph_chartInstance.destroy(); // 차트 인스턴스 삭제
                }

                // 새로운 차트 인스턴스 생성
                ph_chartInstance = new Chart(ctx, {
                    type: 'line', // 차트 유형 설정 (선형 차트)
                    data: {
                        labels: labels, // X축 레이블 (날짜)
                        datasets: [{
                            label: 'Price', // 데이터셋 레이블
                            data: prices, // Y축 데이터 (가격)
                            borderColor: 'rgba(34, 34, 34, 1)', // 선 색상 (검은색)
                            borderWidth: 2, // 선 두께
                            pointRadius: 0, // 데이터 포인트 동그라미 제거
                            fill: false // 차트 배경 채우기 비활성화
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true, // 비율 유지
                        plugins: {
                            legend: {
                                display: true,
                                labels: {
                                    color: '#333'
                                }
                            }
                        },
                        scales: {
                            x: {
                                ticks: {
                                    color: '#333'
                                },
                                grid: {
                                    color: 'rgba(0, 0, 0, 0.1)'
                                }
                            },
                            y: {
                                ticks: {
                                    color: '#333'
                                },
                                grid: {
                                    color: 'rgba(0, 0, 0, 0.1)'
                                }
                            }
                        }
                    }
                });
            },
            error: function(xhr, status, error) { // 에러 처리
                console.error('데이터 로드 중 오류 발생:', error); // 에러 로그 출력
            }
        });
    }

    // 페이지가 로드될 때 기본 1개월 데이터를 로드
    $(document).ready(function() {
        ph_loadData('1month', $('#ph-btn-1month')[0]); // 기본적으로 1개월 데이터를 로드하고 버튼 활성화
    });
</script>

</body>
</html>
