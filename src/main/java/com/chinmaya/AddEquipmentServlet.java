package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddEquipmentServlet")
public class AddEquipmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String ename = request.getParameter("ename");
        String price = request.getParameter("price");
        String unit = request.getParameter("unit");
        String purchasedate = request.getParameter("purchasedate");
        String description = request.getParameter("description");

        try {
            Connection con = ConnectionProvider.getCon();
            String sql = "INSERT INTO equipment(ename, price, unit, purchasedate, description) VALUES (?, ?, ?, ?, ?)";
            String sql2 = "INSERT INTO maintain(ename) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(sql);
            PreparedStatement ps2 = con.prepareStatement(sql2);

            ps.setString(1, ename);
            ps2.setString(1, ename);
            ps.setString(2, price);
            ps.setString(3, unit);
            ps.setString(4, purchasedate);
            ps.setString(5, description);
            ps.executeUpdate();
            ps2.executeUpdate();
            
            response.sendRedirect("addEquipment.jsp?msg=valid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addEquipment.jsp?msg=invalid");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

