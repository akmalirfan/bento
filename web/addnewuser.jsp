<%-- 
    Document   : addnewuser
    Created on : Dec 12, 2015, 12:09:22 PM
    Author     : Nur Husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>

<%
   
    Connection con;
    Statement stmt;
    try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/bento_car_rental","root", "");
     Statement st = conn.createStatement(); 
    
    //ResultSet rs;
    String query = "INSERT INTO user (username, password, phone, email, address) " +
                             "VALUES (?,?,?,?,?)";
    
    PreparedStatement st2 = conn.prepareStatement(query);
     st2.setString(1,request.getParameter("username")); 
     st2.setString(2,request.getParameter("password")); 
     st2.setString(3,request.getParameter("phone")); 
     st2.setString(4,request.getParameter("email"));
     st2.setString(5,request.getParameter("address")); 
     st2.executeUpdate();
     
    
    st.executeUpdate("INSERT INTO user (username, password, phone, email, address) " +
                             "VALUES (?,?,?,?,?)");
     
     
    }
    catch (Exception ex)
    {
        ex.printStackTrace();
        response.sendRedirect("login.jsp");
    }
    
    
%>