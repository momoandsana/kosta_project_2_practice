<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>버튼 토글 예시</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      color: #333;
      margin: 0;
      padding: 20px;
    }
    button {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-top: 10px;
    }
    button:hover {
      background-color: #0056b3;
    }
    #toggleButton {
      display: none; /* 처음에는 보이지 않게 설정 */
    }
  </style>
  <script>
    // 버튼을 토글하는 함수
    function toggleButton() {
      var toggleButton = document.getElementById("toggleButton");
      if (toggleButton.style.display === "none") {
        toggleButton.style.display = "block"; // 버튼 보이기
      } else {
        toggleButton.style.display = "none";  // 버튼 숨기기
      }
    }
  </script>
</head>
<body>

<h1>버튼 토글 예시</h1>

<!-- 이 버튼을 누르면 다른 버튼이 보이거나 숨겨짐 -->
<button onclick="toggleButton()">버튼 보이기/숨기기</button>

<!-- 토글될 버튼 (처음에는 숨겨진 상태) -->
<button id="toggleButton">토글 버튼</button>

</body>
</html>
