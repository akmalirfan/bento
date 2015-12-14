<%-- 
    Document   : addnewuser
    Created on : Dec 12, 2015, 12:09:22 PM
    Author     : Nur Husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    String phone    = request.getParameter("phone");
    String email    = request.getParameter("email");
    String address  = request.getParameter("address");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/bento_car_rental",
            "root", " ");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("INSERT INTO user (username, password, phone, email, address) " +
                             "VALUES ('" + username + "','" + password + "','" + phone + "','" + email + "','" + address + "', ");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
        out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("signup.jsp");
        out.print ("Unsuccesfull signup. Sorry. Please try again. ");
    }
%>