<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<%@include file="components/allCss.jsp"%>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #e0ffff;
	background-size: 100% 100%;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 500px;
	margin: auto;
	text-align: center;
	background-color: #fff;
	padding: 20px;
}

.form-group {
	text-align: left;
}

.btn-primary {
	width: 100%;
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container" style="padding-top: 50px;">
		<div class="card">
			<h3 class="heading" style="color: #1e90ff;">Admin Login</h3>

			<% String msg = request.getParameter("msg");
               if ("exist".equals(msg)) { %>
			<script>
                    alert("Login Successful");
                    window.location.assign("admin/admin_home.jsp");
                </script>
			<% } else if ("notexist".equals(msg)) { %>
			<script>
                    alert("Incorrect Username or Password");
                    window.location.assign("index.jsp");
                </script>
			<% } %>

			<form action="loginServlet" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">Enter Username</label> <input
						type="text" name="email" class="form-control"
						id="exampleInputEmail1" placeholder="Enter Admin Name" required>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Enter Password</label> <input
						type="password" name="password" class="form-control"
						id="exampleInputPassword1" placeholder="Enter Password" required>
				</div>
				<hr>
				<div>
					<button type="submit" class="btn btn-primary">Login</button>
				</div>
			</form>
		</div>
	</div>
	<br>

	<%@include file="components/footer.jsp"%>

</body>
</html>
