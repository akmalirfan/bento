<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page= "all_include.html" />
</head>
<body>
    <jsp:include page="header.jsp"/>

    <%
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bento_car_rental", "root", "");

            Statement statement = connection.createStatement();

            //String id = request.getParameter("id");  

            ResultSet resultset = 
                statement.executeQuery("select image_path,code,rate from car") ; 

            if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. " +
                "Please <A HREF='tryAgain.html'>try again</A>.");
            } else {
        %>

    <div class="container">
        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Our Vehicles</strong>
                    </h2>
                    <hr>
                </div>
                <div class="row" align="center">
               
                    
                    <div class="col-md-12">
                        <% 
                                while(resultset.next())
                                {
                        %>
                        <img class="img-responsive img-border-left" src="<%= resultset.getString("image_path") %>" width="100" height="100">
                        <p><strong>Code :</strong> <%= resultset.getString("code") %></p>
                        <p><strong>Rate :</strong> RM<%= resultset.getDouble("rate") %>/hour</p>
                        
                        <% 
           } 
            }
       %>
                    </div>
               
                </div>

            </div>
        </div>
    </div>
                
    <jsp:include page="footer.jsp"/>
</body>
</html>
