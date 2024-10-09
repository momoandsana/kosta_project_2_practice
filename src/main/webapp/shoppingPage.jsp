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
            position: relative;
            max-width: 600px;
            margin: 0 auto;
            left: 25%; /* 화면의 왼쪽으로부터 15% 떨어진 위치 */
            padding: 40px 20px;
            background-color: white;
            z-index: 1;
        }


        .ph-frame {
            border: 2px solid #d1d1d1;
            border-radius: 10px;
            padding: 20px;
            background-color: white;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .ph-button-group {
            display: flex;
            width: 100%;
            border: 1px solid #d1d1d1;
            border-radius: 5px;
            overflow: hidden;
            background-color: white;
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
            width: 100%;
            height: 300px;
            background-color: white;
        }

        @media (max-width: 768px) {
            .ph-container {
                padding: 20px 0;
                max-width: 100%;
                transform: translateX(0);
            }

            .ph-price-chart {
                height: 250px;
            }
        }
    </style>
</head>
<body>

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
            <img src="/images/신발1.webp" class="product-image" alt="상품 이미지">
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

            <button class="wishlist-button" id="wishlistButton">
                <i class="bi bi-bookmark" id="wishlistIcon"></i>찜 목록에 추가
            </button>
        </div>
    </div>

    <hr class="horizontal-divider">

    <!-- Price History 섹션 추가 -->
    <div class="ph-container">
        <div class="ph-frame">
            <div class="ph-button-group">
                <button id="ph-btn-1month" class="active" onclick="ph_loadData('1month', this)">1개월</button>
                <button id="ph-btn-3months" onclick="ph_loadData('3months', this)">3개월</button>
                <button id="ph-btn-6months" onclick="ph_loadData('6months', this)">6개월</button>
            </div>

            <canvas id="ph-priceChart" class="ph-price-chart"></canvas>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p>© 2024 Kream Clone. All Rights Reserved.</p>
            <p><a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </div>
    </footer>

</div>

<script>
    document.getElementById('wishlistButton').addEventListener('click', function() {
        var icon = document.getElementById('wishlistIcon');
        icon.classList.toggle('bi-bookmark-fill');
        icon.classList.toggle('bi-bookmark');
    });

    let ph_chartInstance = null;

    function ph_loadData(period, button) {
        $('.ph-button-group button').removeClass('active');
        $(button).addClass('active');

        $.ajax({
            url: `/priceHistory?productId=1&period=${period}`,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                const labels = data.map(item => {
                    const date = new Date(item.date);
                    return `${date.getMonth() + 1}/${date.getDate()}`;
                });
                const prices = data.map(item => item.price);
                const ctx = document.getElementById('ph-priceChart').getContext('2d');

                if (ph_chartInstance) {
                    ph_chartInstance.destroy();
                }

                ph_chartInstance = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Price',
                            data: prices,
                            borderColor: 'rgba(34, 34, 34, 1)',
                            borderWidth: 2,
                            pointRadius: 0,
                            fill: false
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
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
            error: function(xhr, status, error) {
                console.error('데이터 로드 중 오류 발생:', error);
            }
        });
    }

    $(document).ready(function() {
        ph_loadData('1month', $('#ph-btn-1month')[0]);
    });
</script>

</body>
</html>
