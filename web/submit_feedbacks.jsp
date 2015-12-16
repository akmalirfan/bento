<%-- 
    Document   : submit_feedbacks
    Created on : Dec 16, 2015, 1:14:27 AM
    Author     : zeeZiha
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
    String query = "INSERT INTO feedback (Question1,Question2,Question3,Question4,Question5,Question6,Question7,themessage)" +
                             "VALUES (?,?,?,?,?,?,?,?)";
    PreparedStatement st2 = conn.prepareStatement(query);
     st2.setString(1,request.getParameter("Question1")); 
     st2.setString(2,request.getParameter("Question2")); 
     st2.setString(3,request.getParameter("Question3")); 
     st2.setString(4,request.getParameter("Question4"));
     st2.setString(5,request.getParameter("Question5"));
     st2.setString(6,request.getParameter("Question6"));
     st2.setString(7,request.getParameter("Question7"));
     st2.setString(8,request.getParameter("themessage"));
     st2.executeUpdate();
     
    
    st.executeUpdate("INSERT INTO user (Question1,Question2,Question3,Question4,Question5,Question6,Question7,themessage) " +
                             "VALUES (?,?,?,?,?,?,?,?)");
     
     
    }
    catch (Exception ex)
    {
        ex.printStackTrace();
        response.sendRedirect("index.jsp");
    }
    
    
%>