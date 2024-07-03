<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Equipment</title>
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
		alert("Equipment has been Updated..");
		window.location.assign("viewEquipment.jsp");
	</script>
	<%
		}
	%>
	<%
		if ("invalid".equals(msg)) {
	%>
	<script>
		alert("Something went wrong! Try Again..");
		window.location.assign("editEquipment.jsp");
	</script>
	<%
		}
	%>


	<%
		String id = request.getParameter("id");
		String pname = "";
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from equipment where id=" + id + "");
			while (rs.next()) {
				pname = rs.getString(2);
	%>

	<div class="container">
		<div class="card">
			<div class="text-center">
				<h3 class="heading" style="color: #1e90ff;">Edit Equipment Data</h3>
			</div>
			<br>
			<form action="EditEquipmentServlet" method="post">

				<div class="form-group">
					<label for="inputAddress">Equipment Name</label> <input type="text"
						name="ename" class="form-control" id="inputAddress"
						placeholder="Enter New Plan Name" value="<%=rs.getString(2)%>"
						required>
				</div>

				<div class="form-group">
					<label for="inputAddress">Price</label> <input type="number"
						name="price" class="form-control" id="inputAddress"
						placeholder="Enter Amount(In Rs.)" value="<%=rs.getString(3)%>"
						required>
				</div>

				<div class="form-group">
					<label for="inputAddress">Unit</label> <input type="number"
						name="unit" class="form-control" id="inputAddress"
						placeholder="Enter Duration(In Month)"
						value="<%=rs.getString(4)%>" required>
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