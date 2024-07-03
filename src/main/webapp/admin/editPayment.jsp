<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Payment</title>
<%@include file="allCss.jsp"%>

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
	<%@include file="navbar.jsp"%><br>

	<%
	String msg = request.getParameter("msg");
	if ("valid".equals(msg)) {
	%>
	<script>
		alert("Payment has been Updated..");
		window.location.assign("viewPayment.jsp");
	</script>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<script>
		alert("Something went wrong! Try Again..");
		window.location.assign("editPayment.jsp");
	</script>
	<%
	}
	%>



	<%
	String id = request.getParameter("id");
	String name = "";
	try {
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from payment where id=" + id + "");
		while (rs.next()) {
			name = rs.getString(2);
	%>

	<div class="container">
		<div class="card">
			<div class="text-center">
				<h3 class="heading" style="color: #1e90ff;">Edit Payment</h3>
			</div>
			<br>
			<form action="EditPaymentServlet" method="post">

				<div class="form-group">
					<label for="inputAddress">Name</label> <input type="text"
						name="name" class="form-control" id="inputAddress"
						placeholder="Enter Name" value="<%=rs.getString(2)%>" required>
				</div>
				
				<div class="form-group">
					<label for="inputAddress">Month</label> <input type="text"
						name="month" class="form-control" id="inputAddress"
						placeholder="Enter Month" value="<%=rs.getString(3)%>" required>
				</div>

				<div class="form-group">
					<label for="inputAddress">Amount Paid</label> <input type="number"
						name="paid" class="form-control" id="inputAddress"
						placeholder="Enter Paid Amount" value="<%=rs.getString(4)%>"
						required>
				</div>

				<div class="form-group">
					<label for="inputAddress">Dues</label> <input type="number"
						name="left" class="form-control" id="inputAddress"
						placeholder="Enter Left Amount" value="<%=rs.getString(5)%>" required>
				</div>
				<hr>
				<input type="hidden" name="id" value="<%=rs.getString("id")%>">
				<div class="text-center">
					<button type="submit" class="btn btn-primary" style="width: 350px;">Submit</button>
				</div>
			</form>
		</div>
	</div>

	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>

	<%@include file="footer.jsp"%>

</body>
</html>