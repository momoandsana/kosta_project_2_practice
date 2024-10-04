<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>입찰가 갱신 알림</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        h2 {
            font-size: 24px;
            color: #333;
        }
        p {
            font-size: 18px;
            color: #666;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
        }
        button {
            display: block;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #00D084; /* 민트 그린 */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #00A86B; /* 어두운 민트 */
        }
    </style>
</head>
<body>
<div class="container">
    <h2>입찰가 갱신 알림</h2>
    <p>당신이 제시한 입찰가가 갱신되었습니다!</p>
    <p>자세한 사항은 마이페이지에서 확인하세요.</p>
    <button onclick="window.close()">닫기</button>
</div>
</body>
</html>
