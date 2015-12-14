<%-- 
    Document   : index
    Created on : Nov 29, 2015, 2:31:19 PM
    Author     : Akmal Irfan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student records</title>
    </head>
    <body>
        <form>
            <input type="text" name="name" placeholder="Name">
            <input type="text" name="matricNo" placeholder="Matric number">
            <input type="email" name="email" placeholder="Email">
            <input type="submit" name="submit">
        </form>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:8080/bento_car_rental";
                
                Connection conn = DriverManager.getConnection(url, "root", "");
                out.println("DB connection ok");
                /*
                if (request.getParameter("submit") != null) {
                    String name = request.getParameter("name");
                    String matricNo = request.getParameter("matricNo");
                    String email = request.getParameter("email");

                    PreparedStatement updatestud = conn.prepareStatement("INSERT INTO stud VALUES (?,?,?)");
                    updatestud.setString(1, name);
                    updatestud.setString(2, matricNo);
                    updatestud.setString(3, email);
                    updatestud.executeUpdate();
                    updatestud.close();
                }
                
                String query = "SELECT * FROM stud";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                
                out.println("<table>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString(1) + "</td>");
                    out.println("<td>" + rs.getString(2) + "</td>");
                    out.println("<td>" + rs.getString(3) + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                
                stmt.close();*/
                conn.close();
            } catch (Exception ex) {
                System.out.println(ex);
            }
        %>
    </body>
</html>
