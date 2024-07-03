package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePlanServlet")
public class DeletePlanServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameter from the request
        String id = request.getParameter("id");

        try {
            // Get a database connection
            Connection con = ConnectionProvider.getCon();

            // Create a statement and execute the delete query
            Statement st = con.createStatement();
            int rowsAffected = st.executeUpdate("delete from plan where id='" + id + "'");

            // Check if the delete was successful
            if (rowsAffected > 0) {
                // Redirect to viewPlan.jsp with a success message
                response.sendRedirect("viewPlan.jsp?msg=deleted");
            } else {
                // Redirect to viewPlan.jsp with an error message (if deletion failed)
                response.sendRedirect("viewPlan.jsp?msg=delete_failed");
            }
        } catch (SQLException e) {
            // Log the exception (consider using a logging framework)
            e.printStackTrace();

            // Redirect to viewPlan.jsp with an error message
            response.sendRedirect("viewPlan.jsp?msg=delete_failed");
        } catch (Exception e) {
            // Log the exception (consider using a logging framework)
            e.printStackTrace();

            // Redirect to viewPlan.jsp with an error message
            response.sendRedirect("viewPlan.jsp?msg=delete_failed");
        }
    }
}
