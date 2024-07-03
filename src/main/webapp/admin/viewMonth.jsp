<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Monthly Attendance</title>
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
        <h4 class="text-center" style="color: #1e90ff;">View Monthly Payments</h4>
        <br>
		<div class="text-center" style="color: #1e90ff;">
		<form method="post" action="<%= request.getRequestURI() %>">
			<label>Select Month:</label> <select name="selectedMonth">
		<%--    <option>January</option>
				<option>February</option>
				<option>March</option>
				<option>April</option>
				<option>May</option>
				<option>June</option>
				<option>July</option>
				<option>August</option>
				<option>September</option>
				<option>October</option>
				<option>November</option> --%>
				<option>July</option>
			</select>
			<br>
			<button type="submit" class="btn btn-sm btn-primary"
				name="viewMonth">View</button>
		</form>
		</div>
		<br>
        <table class="table table-bordered" id="example">
            <thead class="bg-light">
                <tr>
                    <th style="width: 20%;">S.No</th>
                    <th style="width: 50%;">Name</th>
                    <th style="width: 30%;">Total Presents</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM attend");
                        int i = 0;
                        while (rs.next()) {
                            i++;
                            String name = rs.getString("name");
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=name%></td>
                                <%
                                    int totalPresents = 0;
                                    for (int day = 1; day <= 30; day++) {
                                        if (!rs.getString("day" + day).equals("0")) {
                                            totalPresents++;
                                        }
                                    }
                                %>
                                <td><%=totalPresents%></td>
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
