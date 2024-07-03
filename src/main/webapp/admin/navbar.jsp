<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FitForge</title>
    
    <script>
    $(document).ready(function () {
        $('#example').DataTable({
            dom: 'Bfrtip',
            buttons: ['copyHtml5', 'excelHtml5', 'pdfHtml5']
        });
    });
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.dataTables.min.css">
    
     <style>
     
        .navbar {
            background-color: #00bfff;
        }
        
        .navbar-nav .dropdown-menu {
            margin-top: 0;
        }

        .navbar-nav .dropdown-menu a {
            color: #333;
        }

        .navbar-nav .dropdown-menu a:hover {
            background-color: #f8f9fa;
        }
    </style>
    
</head>
<body>

<div class="container-fluid" style="height: 0px; background-color: #455a64"></div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="admin_home.jsp">FitForge</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="admin_home.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            </li>
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="planDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Enquiry
                </a>
                <div class="dropdown-menu" aria-labelledby="planDropdown">
                    <a class="dropdown-item" href="addEnquiry.jsp">Add Enquiry</a>
                    <a class="dropdown-item" href="viewEnquiry.jsp">View Enquiry</a>
                </div>
            </li>
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="planDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Plan
                </a>
                <div class="dropdown-menu" aria-labelledby="planDropdown">
                    <a class="dropdown-item" href="addPlan.jsp">Add Plan</a>
                    <a class="dropdown-item" href="viewPlan.jsp">View Plan</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle active" href="#" id="equipmentDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Equipment
                </a>
                <div class="dropdown-menu" aria-labelledby="equipmentDropdown">
                    <a class="dropdown-item" href="addEquipment.jsp">Add Equipment</a>
                    <a class="dropdown-item" href="viewEquipment.jsp">View Equipment</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle active" href="#" id="memberDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Member
                </a>
                <div class="dropdown-menu" aria-labelledby="memberDropdown">
                    <a class="dropdown-item" href="addMember.jsp">Add Member</a>
                    <a class="dropdown-item" href="viewMember.jsp">View Member</a>
                </div>
            </li>
            
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle active" href="#" id="otherDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Others
                </a>
                <div class="dropdown-menu" aria-labelledby="memberDropdown">
                    <a class="dropdown-item" href="viewAttendance.jsp">Daily Attendance</a>
                    <a class="dropdown-item" href="viewMonth.jsp">Monthly Attendance</a>
                    <a class="dropdown-item" href="viewPayment.jsp">Member Payments</a>
                    <a class="dropdown-item" href="viewMaintenance.jsp">Equipment Maintenance</a>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link active" href="logout.jsp">Logout</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="changePassword.jsp">Change Password</a>
            </li>
        </ul>
    </div>
</nav>

</body>
</html>
