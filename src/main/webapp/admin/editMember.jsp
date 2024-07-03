<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Member</title>
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
		alert("Member has been Updated..");
		window.location.assign("viewMember.jsp");
	</script>
	<%
		}
	%>
	<%
		if ("invalid".equals(msg)) {
	%>
	<script>
		alert("Something went wrong! Try Again..");
		window.location.assign("editMember.jsp");
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
			ResultSet rs = st.executeQuery("select * from member where id=" + id + "");
			while (rs.next()) {
				name = rs.getString(2);
	%>

	<div class="container">
		<div class="card">

			<div class="text-center">
				<h3 class="heading" style="color: #1e90ff;">Edit Member Data</h3>
			</div>
			<br>
			<form action="EditMemberServlet" method="post"
				onsubmit="return MobileValidate()">

				<div class="form-group">
					<label for="inputAddress">Name</label> <input type="text"
						name="name" class="form-control" id="inputAddress"
						placeholder="Enter Name" value="<%=rs.getString(2)%>" required>
				</div>

				<div class="form-group">
					<label for="inputAddress">Contact Number</label> <input
						type="number" name="mobileNumber" class="form-control"
						id="inputMob" placeholder="Enter Contact Number"
						value="<%=rs.getString(3)%>" required>
				</div>

				<div class="form-group">
					<label for="exampleInputEmail1">Email</label> <input type="email"
						name="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter Email"
						value="<%=rs.getString(4)%>" required>
				</div>

				<div class="form-group">
					<label for="inputAddress">Initial Amount</label> <input
						type="number" name="initamount" class="form-control"
						id="inputAddress" placeholder="Enter Initial Amount(In Rs.)"
						value="<%=rs.getString(8)%>" required>
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

	<script type="text/javascript">
		function MobileValidate() {
			var mobileNumber = document.getElementById("inputMob").value;
			var mobileNumberTenDigit = /^\d{10}$/;
			if (mobileNumber != '') {
				if (mobileNumber.match(mobileNumberTenDigit)) {
					return true;
				} else {
					alert("Enter Ten Digit Number");
					return false;
				}
			}
		}
	</script>

	<%@include file="footer.jsp"%>

</body>
</html>