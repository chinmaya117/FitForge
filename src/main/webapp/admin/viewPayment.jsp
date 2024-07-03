<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Monthly Payments</title>
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
        <table class="table table-bordered" id="example">
            <thead class="bg-light">
                <tr>
                    <th style="width: 10%;">S.No</th>
					<th style="width: 20%;">Name</th>
					<th style="width: 20%;">Month</th>
					<th style="width: 20%;">Amount Paid</th>
					<th style="width: 20%;">Dues</th>
					<th style="width: 10%;">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from payment");
                        int i = 0;
                        while (rs.next()) {
                            i++;
                %>
                            <tr>
                                <td><%=i%></td>
				                <td><%=rs.getString("name")%></td>
				                <td><%=rs.getString("month")%></td>
				                <td><%=rs.getString("paid")%></td>
				                <td><%=rs.getString("left")%></td>
				                <td>
				                <a href="editPayment.jsp?id=<%=rs.getString("id")%>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></a>
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