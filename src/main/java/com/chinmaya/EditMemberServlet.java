package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditMemberServlet")
public class EditMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String mobileNumber = request.getParameter("mobileNumber");
        String email = request.getParameter("email");
        String initamount = request.getParameter("initamount");

        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("UPDATE member SET name=?, mobileNumber=?, email=?, initamount=? WHERE id=?");
            ps.setString(1, name);
            ps.setString(2, mobileNumber);
            ps.setString(3, email);
            ps.setString(4, initamount);
            ps.setInt(5, id);
            ps.executeUpdate();
            response.sendRedirect("editMember.jsp?msg=valid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editMember.jsp?msg=invalid");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

