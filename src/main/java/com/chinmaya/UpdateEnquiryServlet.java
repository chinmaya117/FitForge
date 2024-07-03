package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateEnquiryServlet")
public class UpdateEnquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        try {
            Connection con = ConnectionProvider.getCon();
            String updateQuery = "UPDATE enquiry SET joined = 'Joined' WHERE id = ?";
            PreparedStatement pst = con.prepareStatement(updateQuery);
            pst.setString(1, id);
            pst.executeUpdate();

            response.sendRedirect("viewEnquiry.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewEnquiry.jsp?msg=error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

