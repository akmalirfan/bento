<%@page import="common.ResultList"%>
<%@page import="common.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : admin_manageAccount
    Created on : Dec 13, 2015, 10:26:50 PM
    Author     : zeeZiha
--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="../inc/all_include.html"/>
    <title>Manage Accounts</title>
</head>
<body>
    <jsp:include page="../inc/header.jsp"/>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Manage Account</strong>
                    </h2>
                    <hr>
                <%
                    String query = "SELECT * FROM user WHERE level=1";
                    ResultList rl = DB.query(query);

                    if(!rl.next()) {
                        System.out.println("Error in retrieving from user.");
                    } else {
                %>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th>Address</th>
                            </tr>
                <%
                        while(rl.next()) {
                %>
                            <tr>
                                <td><%= rl.getString("username") %></td>
                                <td><%= rl.getString("password") %></td>
                                <td><%= rl.getString("phone") %></td>
                                <td><%= rl.getString("email") %></td>
                                <td><%= rl.getString("address") %></td>
                            </tr>
                <%
                        }
                    }
                %>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="../inc/footer.jsp"/>
</body>
</html>
