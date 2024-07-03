<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us Page</title>
<%@include file="components/allCss.jsp"%>

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #e0ffff;
	background-size: 100% 100%;
}

.contact-header {
	padding: 20px;
	text-align: center;
	color: #333;
}

.zoom {
	transition: transform .1s;
	width: 100px;
	height: 100px;
	margin: 0 auto;
}

.zoom:hover {
	transform: scale(1.2);
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<br>
	<div class="contact-header">
		<h1 class="heading" style="color: #1e90ff;">Contact Us</h1>
	</div>
	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">

			<div class="col-md-3 zoom">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<h4>
							<i class="fas fa-phone"></i> Contact
						</h4>
						<h5 style="color: #1e90ff;">9876543210</h5>
					</div>
				</div>
			</div>


			<div class="col-md-3 zoom">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<h4>
							<i class="fas fa-envelope-open-text"></i> Send Mail
						</h4>
						<h5 style="color: #1e90ff;">fitforge@gmail.com</h5>
					</div>
				</div>
			</div>

			<div class="col-md-3 zoom">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<h4>
							<i class="fas fa-map-marker-alt"></i>Office Address
						</h4>
						<h5 style="color: #1e90ff;">Bhubaneswar, Odisha</h5>
					</div>
				</div>
			</div>

			<div class="col-md-3 zoom">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<h4>
							<i class="fas fa-business-time"></i> Office Hours
						</h4>
						<h5 style="color: #1e90ff;">09:00 Am to 07:00 Pm</h5>
					</div>
				</div>
			</div>

		</div>
	</div>
	<br>
	<br>
	<br>

	<%@include file="components/footer.jsp"%>
	
</body>
</html>