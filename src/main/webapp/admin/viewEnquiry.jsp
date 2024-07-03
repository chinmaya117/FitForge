<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Enquiry</title>
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
    
    <%
		String msg = request.getParameter("msg");
		if ("deleted".equals(msg)) {
	%>
	<script>
		alert("Deleted Successfully..");
		window.location.assign("viewEnquiry.jsp");
	</script>
	<%
		}
	%>
	
    <div class="container mt-5">
        <h4 class="text-center" style="color: #1e90ff;">View Enquiry</h4>
        <br>
        <table class="table table-bordered" id="example">
            <thead class="bg-light">
                <tr>
                    <th style="width: 10%;">S.No</th>
					<th style="width: 20%;">Name</th>
					<th style="width: 20%;">Date</th>
					<th style="width: 20%;">Contact Number</th>
					<th style="width: 20%;">Email ID</th>
					<th style="width: 10%;">Age</th>
					<th style="width: 10%;">Gender</th>
					<th style="width: 20%;">Plan</th>
					<th style="width: 20%;">Joined</th>
					<th style="width: 20%;">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from enquiry");
                        int i = 0;
                        while (rs.next()) {
                            i++;
                %>
                            <tr>
                                <td><%=i%></td>
				                <td><%=rs.getString("name")%></td>
				                <td><%=rs.getString("joindate")%></td>
				                <td><%=rs.getString("mobileNumber")%></td>
				                <td><%=rs.getString("email")%></td>
				                <td><%=rs.getString("age")%></td>
				                <td><%=rs.getString("gender")%></td>
				                <td><%=rs.getString("plan")%></td>
				                <td><%=rs.getString("joined")%></td>
					<td>
						<form method="post" action="UpdateEnquiryServlet"
							style="display: inline-block;">
							<input type="hidden" name="id" value="<%=rs.getString("id")%>">
							<button type="submit" class="btn btn-sm btn-primary"
								name="increment">
								<i class="fas fa-plus"></i>
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