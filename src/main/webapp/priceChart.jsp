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
    // JSP에서 서버로부터 전달된 데이터를 가져오는 것이 아니라, 서버에 직접 요청하여 데이터를 받아옵니다.
    fetch(`/priceHistory?productId=1&period=${period}`)
            .then(response => {
              if (!response.ok) {
                throw new Error('Network response was not ok');
              }
              return response.json();
            })
            .then(data => {
              const labels = data.map(item => item.date);
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
                    borderColor: 'rgba(75, 192, 192, 1)',
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
