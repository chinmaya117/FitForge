<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Attendance</title>
<%@ include file="allCss.jsp"%>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #e0ffff;
	background-size: 100% 100%;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container mt-5">
		<h4 class="text-center" style="color: #1e90ff;">View Daily Attendance</h4>
		<br>
		<div class="text-center" style="color: #1e90ff;">
		<form method="post" action="<%= request.getRequestURI() %>">
			<label>Select Day:</label> <select name="selectedDay">
				<%
                    for (int day = 1; day <= 30; day++) {
                %>
				<option value="<%=day%>"
					<%= (request.getParameter("selectedDay") != null && Integer.parseInt(request.getParameter("selectedDay")) == day) ? "selected" : "" %>>
					<%=day%>/12/2023</option>
				<%
                    }
                %>
			</select>
			<br>
			<button type="submit" class="btn btn-sm btn-primary"
				name="viewAttendance">View</button>
		</form>
		</div>
		<br>

		<table class="table table-bordered" id="example">
			<thead class="bg-light">
				<tr>
					<th style="width: 20%;">S.No</th>
					<th style="width: 40%;">Name</th>
					<th style="width: 20%;">Present</th>
					<th style="width: 20%;">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        int selectedDay = (request.getParameter("selectedDay") != null) ? Integer.parseInt(request.getParameter("selectedDay")) : 1;
                        ResultSet rs = st.executeQuery("select * from attend");
                        int i = 0;
                        while (rs.next()) {
                            i++;
                %>
				<tr>
					<td><%=i%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("day"+selectedDay)%></td>
					<td>
						<form method="post" action="UpdateAttendServlet" style="display: inline-block;">
							<input type="hidden" name="id" value="<%=rs.getString("id")%>">
							<input type="hidden" name="selectedDay" value="<%=selectedDay%>">
							<button type="submit" class="btn btn-sm btn-primary"
								name="increment">
								<i class="fas fa-plus"></i>
							</button>
						</form>
						<form method="post" action="DeleteAttendServlet" style="display: inline-block;">
							<input type="hidden" name="id" value="<%=rs.getString("id")%>">
							<input type="hidden" name="selectedDay" value="<%=selectedDay%>">
							<button type="submit" class="btn btn-sm btn-primary"
								name="increment">
								<i class="fas fa-minus"></i>
							</button>
						</form>
					</td>
				</tr>
				<%
                        }
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
			</tbody>
		</table>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
