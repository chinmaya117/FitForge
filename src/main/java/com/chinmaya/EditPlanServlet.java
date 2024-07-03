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

@WebServlet("/EditPlanServlet")
public class EditPlanServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        int id = Integer.parseInt(request.getParameter("id"));
        String pname = request.getParameter("pname");
        String amount = request.getParameter("amount");
        String duration = request.getParameter("duration");

        try {
            // Get a database connection
            Connection con = ConnectionProvider.getCon();

            // Prepare and execute the update statement
            PreparedStatement ps = con.prepareStatement("update plan set pname=?, amount=?, duration=? where id=?");
            ps.setString(1, pname);
            ps.setString(2, amount);
            ps.setString(3, duration);
            ps.setInt(4, id);

            // Execute the update
            int rowsAffected = ps.executeUpdate();

            // Check if the update was successful
            if (rowsAffected > 0) {
                // Redirect to editPlan.jsp with a success message
                response.sendRedirect("editPlan.jsp?msg=valid");
            } else {
                // Redirect to editPlan.jsp with an error message (if update failed)
                response.sendRedirect("editPlan.jsp?msg=invalid");
            }
        } catch (SQLException e) {
            // Log the exception (consider using a logging framework)
            e.printStackTrace();

            // Redirect to editPlan.jsp with an error message
            response.sendRedirect("editPlan.jsp?msg=invalid");
        } catch (Exception e) {
            // Log the exception (consider using a logging framework)
            e.printStackTrace();

            // Redirect to editPlan.jsp with an error message
            response.sendRedirect("editPlan.jsp?msg=invalid");
        }
    }
}

