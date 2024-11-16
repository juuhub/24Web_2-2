<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-08
  Time: 오후 6:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP CRUD</title>
    <!-- Bootstrap CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 푸터를 고정시키기 위한 스타일 */
        body {
            margin-bottom: 70px; /* 푸터 크기만큼 여백을 추가 */
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #343a40; /* Dark background color */
            color: white;
            text-align: center;
            padding: 10px 0;
            z-index: 1000; /* 푸터가 다른 요소들보다 위에 오도록 */
        }
    </style>
</head>
<body>

<!-- 푸터 -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-4 text-center text-md-start mb-2 mb-md-0">
                <p class="mb-0">&copy; 2024 Company, Inc</p>
            </div>
            <div class="col-12 col-md-4 text-center mb-2 mb-md-0">
                <a href="/" class="text-white text-decoration-none">
                    <i class="bi bi-bootstrap" style="font-size: 2rem;"></i>
                </a>
            </div>
            <div class="col-12 col-md-4 text-center text-md-end">
                <ul class="nav justify-content-center justify-content-md-end">
                    <li class="nav-item"><a class="nav-link text-white px-2" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-white px-2" href="#">Features</a></li>
                    <li class="nav-item"><a class="nav-link text-white px-2" href="#">Pricing</a></li>
                    <li class="nav-item"><a class="nav-link text-white px-2" href="#">FAQs</a></li>
                    <li class="nav-item"><a class="nav-link text-white px-2" href="#">About</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap JavaScript 및 Popper.js 추가 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>
</body>
</html>