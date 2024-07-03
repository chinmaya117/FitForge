<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Page</title>
<%@include file="components/allCss.jsp"%>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #e0ffff;
	background-size: 100% 100%;
}

.about-header {
	padding: 20px;
	text-align: center;
	color: #333;
}

.about-content {
	padding: 10px;
	text-align: justify;
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="about-header">
		<h1 class="heading" style="color: #1e90ff;">About Us</h1>
	</div>
	<div class="container">
		<div class="about-content">
			<p>Welcome to FitForge, where your journey to a healthier and
				fitter you begins! Our state-of-the-art gym is designed to cater to
				individuals of all fitness levels, from beginners to seasoned
				athletes. With a spacious and well-equipped facility, we offer a
				diverse range of workout options, including cutting-edge fitness
				equipment, group classes, and personalized training programs.</p>
			<p>At FitForge, we prioritize a holistic approach to wellness,
				focusing not only on physical strength but also on mental
				well-being. Our expert trainers are dedicated to providing guidance
				and support, ensuring you reach your fitness goals in a safe and
				effective manner. Whether you're looking to build muscle, improve
				cardiovascular health, or simply enjoy a stress-relieving workout,
				our gym has something for everyone.</p>
			<p>Join our vibrant fitness community, where motivation and
				encouragement thrive. Our modern and clean environment, coupled with
				a friendly atmosphere, makes FitForge the perfect place to embark on
				your fitness journey. Elevate your workout experience with us and
				embrace a healthier, more active lifestyle. Your transformation
				starts here at FitForge – where fitness meets fulfillment!</p>
		</div>
	</div>

	<%@include file="components/footer.jsp"%>
	
</body>
</html>
