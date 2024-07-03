package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditMaintenanceServlet")
public class EditMaintenanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String ename = request.getParameter("ename");
        String problem = request.getParameter("problem");
        String status = request.getParameter("status");

        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("UPDATE maintain SET ename=?, problem=?, status=? WHERE id=?");
            ps.setString(1, ename);
            ps.setString(2, problem);
            ps.setString(3, status);
            ps.setInt(4, id);
            ps.executeUpdate();

            response.sendRedirect("editMaintenance.jsp?msg=valid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editMaintenance.jsp?msg=invalid");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

