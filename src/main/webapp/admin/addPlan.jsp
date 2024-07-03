<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Plan</title>
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
                window.location.assign("viewPlan.jsp");
            </script>
        <%
            }
            if ("invalid".equals(msg)) {
        %>
            <script>
                alert("Something went wrong! Try Again..");
                window.location.assign("addPlan.jsp");
            </script>
        <%
            }
        %>

        

        <div class="container">
                <div class="card">
                        <div class="text-center">
                            <h3 class="heading" style="color: #1e90ff;">Add Plan</h3>
                        </div>
                        <br>
                        <form action="AddPlanServlet" method="post">
                            <div class="form-group">
                                <label for="inputPlanName">Plan Name</label>
                                <input type="text" name="pname" class="form-control" id="inputPlanName" placeholder="Enter Plan Name" required>
                            </div>

                            <div class="form-group">
                                <label for="inputAmount">Amount</label>
                                <input type="number" name="amount" class="form-control" id="inputAmount" placeholder="Enter Amount (In Rs.)" required>
                            </div>

                            <div class="form-group">
                                <label for="inputDuration">Duration</label>
                                <input type="number" name="duration" class="form-control" id="inputDuration" placeholder="Enter Duration (In Month)" required>
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
