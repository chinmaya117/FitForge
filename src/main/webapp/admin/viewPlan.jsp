<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Plans</title>
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
		window.location.assign("viewPlan.jsp");
	</script>
	<%
		}
	%>
	
    <div class="container mt-5">
        <h4 class="text-center" style="color: #1e90ff;">View Plans</h4>
        <br>
        <table class="table table-bordered" id="example">
            <thead class="bg-light">
                <tr>
                    <th style="width: 15%;">S.No</th>
                    <th style="width: 25%;">Plan Name</th>
                    <th style="width: 15%;">Amount (Rs.)</th>
                    <th style="width: 30%;">Duration (Months)</th>
                    <th style="width: 15%;">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from plan");
                        int i = 0;
                        while (rs.next()) {
                            i++;
                %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=rs.getString("pname")%></td>
                                <td><%=rs.getString("amount")%></td>
                                <td><%=rs.getString("duration")%></td>
                                <td>
                                    <a href="editPlan.jsp?id=<%=rs.getString("id")%>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></a>
                                    <form action="DeletePlanServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                                        <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></button>
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
