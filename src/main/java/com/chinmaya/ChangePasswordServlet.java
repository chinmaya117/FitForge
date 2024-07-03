package com.chinmaya;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!confirmPassword.equals(newPassword)) {
            response.sendRedirect("changePassword.jsp?msg=notMatch");
        } else {
            int check = 0;
            try {
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM admin WHERE email='" + email + "' AND password='" + oldPassword + "'");
                while (rs.next()) {
                    check = 1;
                    st.executeUpdate("UPDATE admin SET password='" + newPassword + "' WHERE email='" + email + "'");
                    response.sendRedirect("changePassword.jsp?msg=done");
                }
                if (check == 0) {
                    response.sendRedirect("changePassword.jsp?msg=wrong");
                }
            } catch (Exception e) {
                System.out.println(e);
                response.sendRedirect("changePassword.jsp?msg=error");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

