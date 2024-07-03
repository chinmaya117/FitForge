package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddMemberServlet")
public class AddMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String mobileNumber = request.getParameter("mobileNumber");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String mplan = request.getParameter("mplan");
        String joindate = request.getParameter("joindate");
        String initamount = request.getParameter("initamount");

        try {
            Connection con = ConnectionProvider.getCon();
            String sql = "INSERT INTO member(name, mobileNumber, email, gender, mplan, joindate, initamount) VALUES (?, ?, ?, ?, ?, ?, ?)";
            String sql2 = "INSERT INTO attend(name) VALUES (?)";
            String sql3 = "INSERT INTO payment(name) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(sql);
            PreparedStatement ps2 = con.prepareStatement(sql2);
            PreparedStatement ps3 = con.prepareStatement(sql3);

            ps.setString(1, name);
            ps2.setString(1, name);
            ps3.setString(1, name);
            ps.setString(2, mobileNumber);
            ps.setString(3, email);
            ps.setString(4, gender);
            ps.setString(5, mplan);
            ps.setString(6, joindate);
            ps.setString(7, initamount);
            ps.executeUpdate();
            ps2.executeUpdate();
            ps3.executeUpdate();
            
            response.sendRedirect("addMember.jsp?msg=valid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addMember.jsp?msg=invalid");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

