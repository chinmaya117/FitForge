<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.io.IOException"%>

<%
    HttpSession currentSession = request.getSession(false);
    
    // Check if the session is active and the user is logged in
    if (currentSession == null || currentSession.getAttribute("email") == null) {
        response.sendRedirect("../index.jsp");
        return; // Stop processing the rest of the page
    }
%>