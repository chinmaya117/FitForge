package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditPaymentServlet")
public class EditPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String month = request.getParameter("month");
        String paid = request.getParameter("paid");
        String left = request.getParameter("left");

        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("UPDATE payment SET name=?, month=?, paid=?, left=? WHERE id=?");
            ps.setString(1, name);
            ps.setString(2, month);
            ps.setString(3, paid);
            ps.setString(4, left);
            ps.setInt(5, id);
            ps.executeUpdate();

            response.sendRedirect("editPayment.jsp?msg=valid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editPayment.jsp?msg=invalid");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

