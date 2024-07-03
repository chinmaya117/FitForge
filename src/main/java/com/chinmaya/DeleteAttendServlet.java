package com.chinmaya;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteAttendServlet")
public class DeleteAttendServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String selectedDay = request.getParameter("selectedDay");

        PrintWriter out = response.getWriter();

        try {
            Connection con = ConnectionProvider.getCon();
            String updateQuery = "UPDATE attend SET day" + selectedDay + " = 0 WHERE id = ?";
            PreparedStatement pst = con.prepareStatement(updateQuery);
            pst.setString(1, id);
            pst.executeUpdate();

            response.sendRedirect("viewAttendance.jsp?selectedDay=" + selectedDay);
        } catch (Exception e) {
            out.println(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

