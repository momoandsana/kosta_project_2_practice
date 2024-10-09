<%@ page contentType="text/html; charset=UTF-8" language="java" %> <!-- JSP 페이지 설정: 콘텐츠 유형 및 문자 인코딩 설정 -->
<!DOCTYPE html>
<html lang="ko"> <!-- 문서 타입 정의 및 언어 설정 -->
<head>
    <meta charset="UTF-8"> <!-- 페이지 문자 인코딩 설정 -->
    <title>Price History</title> <!-- 페이지 제목 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script> <!-- Chart.js 라이브러리 로드 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 로드 -->
    <style>
        /* 전체 중앙 정렬 */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            background-color: #f5f5f5; /* 크림 테마에 맞춘 배경 색상 */
        }

        /* 버튼 스타일 */
        button {
            padding: 10px 20px;
            margin: 0;
            border: 1px solid #d1d1d1;
            background-color: white;
            color: #333;
            cursor: pointer;
            outline: none;
            transition: background-color 0.3s, color 0.3s;
            font-weight: bold;
        }

        /* 활성화된 버튼 스타일 */
        .active {
            background-color: #222; /* 크림 사이트의 다크 테마 */
            color: white; /* 활성화된 버튼의 텍스트 색상 */
        }

        /* 버튼들이 서로 붙어있는 스타일 */
        button:not(:last-child) {
            border-right: none; /* 마지막 버튼이 아니면 오른쪽 테두리 제거 */
        }

        /* 버튼 그룹 스타일 */
        .button-group {
            display: inline-flex; /* 버튼들이 나란히 붙게 설정 */
            border: 1px solid #d1d1d1; /* 그룹에 테두리 적용 */
            border-radius: 5px;
            overflow: hidden;
            position: relative;
            top: -30px; /* 버튼이 프레임 위에 위치하도록 조정 */
            background-color: #f5f5f5;
        }

        /* 프레임 테두리 */
        .frame {
            border: 2px solid #d1d1d1;
            border-radius: 10px;
            padding: 20px;
            background-color: white;
            position: relative;
            width: 650px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* 차트 컨테이너 */
        #priceChart {
            max-width: 600px;
            margin-top: 10px;
        }

    </style>
</head>
<body>

<div class="button-group">
    <!-- 버튼을 클릭하면 특정 기간의 데이터를 로드하는 함수 호출 -->
    <button id="btn-1month" class="active" onclick="loadData('1month', this)">1개월</button>
    <button id="btn-3months" onclick="loadData('3months', this)">3개월</button>
    <button id="btn-6months" onclick="loadData('6months', this)">6개월</button>
</div>

<div class="frame">
    <canvas id="priceChart"></canvas> <!-- 차트를 그릴 캔버스 요소 -->
</div>

<script>
    let chartInstance = null; // 차트 인스턴스를 저장할 변수

    function loadData(period, button) { // 데이터를 로드하는 함수, 기간을 매개변수로 받음
        // 모든 버튼의 활성화 클래스 제거
        $('.button-group button').removeClass('active');
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
                const ctx = document.getElementById('priceChart').getContext('2d'); // 캔버스의 2D 컨텍스트 가져오기

                // 기존 차트가 있으면 삭제
                if (chartInstance) { // 이미 차트가 존재하는 경우
                    chartInstance.destroy(); // 차트 인스턴스 삭제
                }

                // 새로운 차트 인스턴스 생성
                chartInstance = new Chart(ctx, {
                    type: 'line', // 차트 유형 설정 (선형 차트)
                    data: {
                        labels: labels, // X축 레이블 (날짜)
                        datasets: [{
                            label: 'Price', // 데이터셋 레이블
                            data: prices, // Y축 데이터 (가격)
                            borderColor: 'rgba(34, 34, 34, 1)', // 크림 사이트의 테마에 맞춘 선 색상 (검은색)
                            borderWidth: 2, // 선 두께
                            pointRadius: 0 // 데이터 포인트 동그라미를 없애기 위해 radius를 0으로 설정
                        }]
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
        loadData('1month', $('#btn-1month')[0]); // 기본적으로 1개월 데이터를 로드하고 버튼 활성화
    });
</script>

</body>
</html>
