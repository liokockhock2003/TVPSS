<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS - Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.login-container {
	background-color: white;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
}

.logo {
	text-align: center;
	margin-bottom: 2rem;
}

.logo h1 {
	font-size: 2.5rem;
	font-weight: bold;
	color: #333;
	margin: 0;
}

.form-control {
	padding: 0.75rem 1rem;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 1rem;
}

.btn-login {
	background-color: #9c27b0;
	color: white;
	padding: 0.75rem;
	border: none;
	border-radius: 8px;
	width: 100%;
	font-weight: 500;
	margin-top: 1rem;
	transition: background-color 0.3s ease;
}

.btn-login:hover {
	background-color: #7b1fa2;
	color: white;
}

.alert {
	border-radius: 8px;
	margin-bottom: 1rem;
}

.form-label {
	color: #333;
	font-weight: 500;
	margin-bottom: 0.5rem;
}

.remember-me {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	margin: 1rem 0;
}

.remember-me input[type="checkbox"] {
	width: 16px;
	height: 16px;
}
</style>
</head>
<body>
	<div class="login-container">
		<div class="logo">
			<h1>TVPSS</h1>
		</div>

		<c:if test="${not empty error}">
			<div class="alert alert-danger" role="alert">${error}</div>
		</c:if>

		<c:if test="${not empty msg}">
			<div class="alert alert-success" role="alert">${msg}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/login" method="post">
			<div class="mb-3">
				<label for="username" class="form-label">Username</label> <input
					type="text" class="form-control" id="username" name="username"
					required>
			</div>

			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password" name="password"
					required>
			</div>

			<div class="remember-me">
				<input type="checkbox" id="remember-me" name="remember-me">
				<label for="remember-me">Remember me</label>
			</div>

			<button type="submit" class="btn btn-login">Login</button>
		</form>

		<div class="mt-3 text-center">
			<span>Don't have an account? </span> <a
				href="${pageContext.request.contextPath}/register"
				class="text-purple-600">Register here</a>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>