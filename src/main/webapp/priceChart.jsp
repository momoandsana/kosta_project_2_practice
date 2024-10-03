<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Price History</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
</head>
<body>
<div>
  <button onclick="loadData('1month')">1개월</button>
  <button onclick="loadData('3months')">3개월</button>
  <button onclick="loadData('6months')">6개월</button>
</div>

<canvas id="priceChart"></canvas>

<script>
  let chartInstance = null;

  function loadData(period) {
    fetch(`/priceHistory?productId=1&period=${period}`)
            .then(response => {
              if (!response.ok) {
                throw new Error('Network response was not ok');
              }
              return response.json();
            })
            .then(data => {
              // 날짜를 MM/DD 형식으로 변환
              const labels = data.map(item => {
                const date = new Date(item.date); // item.date를 Date 객체로 변환
                return `${date.getMonth() + 1}/${date.getDate()}`; // 월/일 형식으로 포맷
              });
              const prices = data.map(item => item.price);
              const ctx = document.getElementById('priceChart').getContext('2d');

              // 기존 차트가 있으면 삭제
              if (chartInstance) {
                chartInstance.destroy();
              }

              chartInstance = new Chart(ctx, {
                type: 'line',
                data: {
                  labels: labels,
                  datasets: [{
                    label: 'Price',
                    data: prices,
                    borderColor: 'rgba(255, 0, 0, 1)', // 빨간색으로 변경
                    borderWidth: 2
                  }]
                }
              });
            })
            .catch(error => {
              console.error('There was a problem with the fetch operation:', error);
            });
  }

  // 페이지가 로드될 때 기본 1개월 데이터를 로드
  window.onload = function() {
    loadData('1month');
  };
</script>
</body>
</html>
