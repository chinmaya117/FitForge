<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<%
		String msg = request.getParameter("msg");
		if ("notMatch".equals(msg)) {
	%>
	<script>
		alert("New password and Confirm password does not match!");
		window.location.assign("changePassword.jsp");
	</script>
	<%
		}
	%>
	<%
		if ("wrong".equals(msg)) {
	%>
	<script>
		alert("Your old Password is wrong!");
		window.location.assign("changePassword.jsp");
	</script>
	<%
		}
	%>
	<%
		if ("done".equals(msg)) {
	%>
	<script>
		alert("Password changed successfully!");
		window.location.assign("../index.jsp");
	</script>

	<%
		}
	%>


	<div class="container mt-5">
		<h1 class="text-success text-center "></h1>
		<div class="col-lg-8 m-auto d-block">
			<div class="card">
				<div class="card-body">

					<h3 class="text-center text-danger">Change Password</h3>
					<br>

					<form action="ChangePasswordServlet" method="post">

						<div class="form-group">
							<label for="inputAddress"><b>Current Password</b></label>
							<div class="col-sm-8">
								<input type="password" name="oldPassword" class="form-control"
									id="inputAddress" placeholder="Enter old Password"
									style="width: 600px;" required>
							</div>
						</div>

						<div class="form-group">
							<label for="inputAddress"><b>New Password</b></label>
							<div class="col-sm-8">
								<input type="password" class="form-control" name="newPassword"
									id="inputAddress" placeholder="Enter New Password"
									style="width: 600px;" required>
							</div>
						</div>

						<div class="form-group">
							<label for="inputAddress"><b>Confirm New Password</b></label>
							<div class="col-sm-8">
								<input type="password" class="form-control"
									name="confirmPassword" id="inputAddress"
									placeholder="Enter New Password Again" style="width: 600px;"
									required>
							</div>
						</div>


						<br>

						<div class="text-center">
							<button type="submit" class="btn btn-primary"
								style="width: 500px;">Submit</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>