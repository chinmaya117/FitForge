<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Equipment</title>
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
                window.location.assign("viewEquipment.jsp");
            </script>
        <%
            }
            if ("invalid".equals(msg)) {
        %>
            <script>
                alert("Something went wrong! Try Again..");
                window.location.assign("addEquipment.jsp");
            </script>
        <%
            }
        %>
        
        <div class="container">
                <div class="card">
                        <div class="text-center">
                            <h3 class="heading" style="color: #1e90ff;">Add Equipment</h3>
                        </div>
                        <br>
                        <form action="AddEquipmentServlet" method="post">
                            <div class="form-group">
                                <label for="inputAddress">Equipment Name</label>
                                <input type="text" name="ename" class="form-control" id="inputAddress" placeholder="Enter Equipment Name" required>
                            </div>

                            <div class="form-group">
                                <label for="inputAddress">Price</label>
                                <input type="number" name="price" class="form-control" id="inputAddress" placeholder="Enter Price(In Rs.)" required>
                            </div>

                            <div class="form-group">
                                <label for="inputAddress">Units</label>
                                <input type="number" name="unit" class="form-control" id="inputAddress" placeholder="Enter Unit(s)" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Purchase Date</label>
                                <input type="date" id="purchasedate" name="purchasedate" class="form-control form-control-sm" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Description</label>
                                <textarea name="description" placeholder="Describe About Equipment" rows="4" cols="14" class="form-control" required></textarea>
                            </div>

                            <hr>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" style="width: 350px;">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <%@include file="footer.jsp"%>
</body>
</html>