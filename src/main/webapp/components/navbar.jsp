<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FitForge</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.dataTables.min.css">

<style>
.navbar {
	background-color: #00bfff;
}

.navbar-nav .dropdown-menu {
	margin-top: 0;
}

.navbar-nav .dropdown-menu a {
	color: #333;
}

.navbar-nav .dropdown-menu a:hover {
	background-color: #f8f9fa;
}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<a class="navbar-brand" href="index.jsp">FitForge</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
				<li class="nav-item"><a class="nav-link" href="about.jsp"><i
						class="fas fa-address-card"></i> About</a></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp"><i
						class="fas fa-address-book"></i> Contact Us</a></li>
			</ul>
		</div>
	</nav>

	<div class="container-fluid" style="margin-top: 20px;">
		<table id="example" class="display">
		</table>
	</div>

</body>
</html>
