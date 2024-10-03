<%@ page contentType="text/html; charset=UTF-8" language="java" %> <!-- JSP 페이지 설정: 콘텐츠 유형 및 문자 인코딩 설정 -->
<!DOCTYPE html>
<html lang="ko"> <!-- 문서 타입 정의 및 언어 설정 -->
<head>
  <meta charset="UTF-8"> <!-- 페이지 문자 인코딩 설정 -->
  <title>Price History</title> <!-- 페이지 제목 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script> <!-- Chart.js 라이브러리 로드 -->
</head>
<body>
<div>
  <!-- 버튼을 클릭하면 특정 기간의 데이터를 로드하는 함수 호출 -->
  <button onclick="loadData('1month')">1개월</button>
  <button onclick="loadData('3months')">3개월</button>
  <button onclick="loadData('6months')">6개월</button>
</div>

<canvas id="priceChart"></canvas> <!-- 차트를 그릴 캔버스 요소 -->

<script>
  let chartInstance = null; // 차트 인스턴스를 저장할 변수

  function loadData(period) { // 데이터를 로드하는 함수, 기간을 매개변수로 받음
    fetch(`/priceHistory?productId=1&period=${period}`) // 서버로부터 데이터를 요청
            .then(response => {
              if (!response.ok) { // 응답이 정상적이지 않으면
                throw new Error('Network response was not ok'); // 에러 발생
              }
              return response.json(); // JSON 형태로 응답 본문 파싱
            })
            .then(data => { // 데이터가 정상적으로 로드된 경우
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
                    borderColor: 'rgba(255, 0, 0, 1)', // 선 색상 (빨간색)
                    borderWidth: 2, // 선 두께
                    pointRadius: 0 // 데이터 포인트 동그라미를 없애기 위해 radius를 0으로 설정
                  }]
                }
              });
            })
            .catch(error => { // 에러 처리
              console.error('There was a problem with the fetch operation:', error); // 에러 로그 출력
            });
  }

  // 페이지가 로드될 때 기본 1개월 데이터를 로드
  window.onload = function() { // 페이지 로드 이벤트 리스너
    loadData('1month'); // 기본적으로 1개월 데이터를 로드
  };
</script>
</body>
</html>
