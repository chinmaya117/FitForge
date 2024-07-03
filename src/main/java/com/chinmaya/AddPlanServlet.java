package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPlanServlet")
public class AddPlanServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String pname = request.getParameter("pname");
        String amount = request.getParameter("amount");
        String duration = request.getParameter("duration");

        // Check if the parameters are not null or empty
        if (pname != null && amount != null && duration != null
                && !pname.isEmpty() && !amount.isEmpty() && !duration.isEmpty()) {
            try {
                // Get a database connection
                Connection con = ConnectionProvider.getCon();

                // Prepare and execute the SQL statement
                String sql = "INSERT INTO plan (pname, amount, duration) VALUES (?, ?, ?)";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, pname);
                    ps.setString(2, amount);
                    ps.setString(3, duration);

                    // Execute the update
                    int rowsAffected = ps.executeUpdate();

                    // Check if the update was successful
                    if (rowsAffected > 0) {
                        // Redirect to addPlan.jsp with a success message
                        response.sendRedirect("addPlan.jsp?msg=valid");
                    } else {
                        // Redirect to addPlan.jsp with an error message
                        response.sendRedirect("addPlan.jsp?msg=invalid");
                    }
                }
            } catch (SQLException e) {
                // Log the exception (consider using a logging framework)
                e.printStackTrace();

                // Redirect to addPlan.jsp with an error message
                response.sendRedirect("addPlan.jsp?msg=invalid");
            } catch (Exception e) {
                // Log the exception (consider using a logging framework)
                e.printStackTrace();

                // Redirect to addPlan.jsp with an error message
                response.sendRedirect("addPlan.jsp?msg=invalid");
            }
        } else {
            // Redirect to addPlan.jsp with an error message for missing or empty parameters
            response.sendRedirect("addPlan.jsp?msg=invalid");
        }
    }
}
