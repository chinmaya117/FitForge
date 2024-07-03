package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditEnquiryServlet")
public class EditEnquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String mobileNumber = request.getParameter("mobileNumber");
        String email = request.getParameter("email");
        String age = request.getParameter("age");

        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("UPDATE enquiry SET name=?, mobileNumber=?, email=?, age=? WHERE id=?");
            ps.setString(1, name);
            ps.setString(2, mobileNumber);
            ps.setString(3, email);
            ps.setString(4, age);
            ps.setInt(5, id);
            ps.executeUpdate();
            response.sendRedirect("editEnquiry.jsp?msg=valid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editEnquiry.jsp?msg=invalid");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
