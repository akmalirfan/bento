<%-- 
    Document   : submit_feedbacks
    Created on : Dec 16, 2015, 1:14:27 AM
    Author     : zeeZiha
--%>

<%@page import="common.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    try {
        String query =
                "INSERT INTO feedback (Question1, Question2, Question3, Question4, Question5, Question6, Question7, themessage)" +
                "VALUES ('" + request.getParameter("Question1")
                + "','" + request.getParameter("Question2")
                + "','" + request.getParameter("Question3")
                + "','" + request.getParameter("Question4")
                + "','" + request.getParameter("Question5")
                + "','" + request.getParameter("Question6")
                + "','" + request.getParameter("Question7")
                + "','" + request.getParameter("themessage") + "')";
        DB.update(query);
        
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
    catch (Exception ex)
    {
        ex.printStackTrace();
        response.sendRedirect("index.jsp");
    }
%>