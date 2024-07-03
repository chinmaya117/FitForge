package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddEnquiryServlet")
public class AddEnquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String joindate = request.getParameter("joindate");
        String mobileNumber = request.getParameter("mobileNumber");
        String email = request.getParameter("email");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String mplan = request.getParameter("mplan");

        try {
            Connection con = ConnectionProvider.getCon();
            String sql = "INSERT INTO enquiry(name, joindate, mobileNumber, email, age, gender, mplan) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, joindate);
            ps.setString(3, mobileNumber);
            ps.setString(4, email);
            ps.setString(5, age);
            ps.setString(6, gender);
            ps.setString(7, mplan);
            ps.executeUpdate();

            response.sendRedirect("addEnquiry.jsp?msg=valid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addEnquiry.jsp?msg=invalid");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

