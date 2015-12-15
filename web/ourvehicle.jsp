<%@page import="common.ResultList"%>
<%@page import="common.DB"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page= "all_include.html" />
</head>
<body>
    <jsp:include page="header.jsp"/>

    <%
        String query = "SELECT image_path, code, rate FROM car";
        ResultList rl = DB.query(query); 

        if(!rl.next()) {
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
                                while(rl.next())
                                {
                        %>
                        <img class="img-responsive img-border-left" src="<%= rl.getString("image_path") %>" width="100" height="100">
                        <p><strong>Code :</strong> <%= rl.getString("code") %></p>
                        <p><strong>Rate :</strong> RM<%= rl.getString("rate") %>/hour</p>
                        
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
