<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Enquiry</title>
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

	<%@include file="navbar.jsp"%>

	<div style="padding-top: 50px;">

		<%
            String msg = request.getParameter("msg");
            if ("valid".equals(msg)) {
        %>
		<script>
                alert("Data Added Successfully..");
                window.location.assign("viewEnquiry.jsp");
            </script>
		<%
            }
            if ("invalid".equals(msg)) {
        %>
		<script>
                alert("Something went wrong! Try Again..");
                window.location.assign("addEnquiry.jsp");
            </script>
		<%
            }
        %>



		<div class="container">
			<div class="card">
				<div class="text-center">
					<h3 class="heading" style="color: #1e90ff;">Add Enquiry</h3>
				</div>
				<br>
				<form action="AddEnquiryServlet" method="post"
					onsubmit="return MobileValidate()">
					<div class="form-group">
						<label for="inputAddress">Name</label> <input type="text"
							name="name" class="form-control" id="inputAddress"
							placeholder="Enter Name" required>
					</div>
					
					<div class="form-group">
						<label for="inputAddress">Enquiry Date</label> <input
							type="date" id="inputdate" name="joindate"
							class="form-control form-control-sm" required>
					</div>

					<div class="form-group">
						<label for="inputAddress">Contact Number</label> <input
							type="number" name="mobileNumber" class="form-control"
							id="inputMob" placeholder="Enter Contact Number" required>
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">Email</label> <input type="email"
							name="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter Email" required>
					</div>

					<div class="form-group">
						<label for="inputAddress">Age</label> <input type="number"
							name="age" class="form-control" id="inputAddress"
							placeholder="Enter Age" required>
					</div>

					<div class="form-group">
						<label for="inputAddress">Gender</label><br>
						<div>
							<input type="radio" name="gender" value="male"> Male <input
								type="radio" name="gender" value="female"> Female
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputAddress">Plan</label>
						<div>
							<select class="custom-select my-1 mr-sm-2" name="mplan"
								id="inlineFormCustomSelectPref" required>
								<option value="">--- Select Plan ---</option>

								<%
										try {
											Connection con = ConnectionProvider.getCon();
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery("select pname from plan");
											while (rs.next()) {
									%>
								<option value="<%=rs.getString("pname")%>"><%=rs.getString("pname")%></option>
								<%
										}
										}

										catch (Exception e) {
											System.out.println(e);
										}
									%>

							</select>
						</div>
					</div>

					<hr>

					<div class="text-center">
						<button type="submit" class="btn btn-primary"
							style="width: 350px;">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>

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