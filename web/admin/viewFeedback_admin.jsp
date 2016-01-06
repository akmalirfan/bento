<%@page import="common.ResultList"%>
<%@page import="common.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : viewFeedback_admin
    Created on : Jan 6, 2016, 10:56:07 PM
    Author     : V5-473PG
--%>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <jsp:include page="../inc/all_include.html"/>
    </head>

    <body>

    <jsp:include page="../inc/header.jsp"/>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>View Feedback</strong>
                    </h2>
                    <hr>

                <%
                    String query = "SELECT * FROM feedback";
                    ResultList rl = DB.query(query);

                    if(!rl.next()) {
                        System.out.println("Error in retrieving from feedback.");
                    } else {
                %>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>ID</th>
                                <th>Satisfied service?</th>
                                <th>How many times?</th>
                                <th>Car type?</th>
                                <th>Satisfied car condition?</th>
                                <th>Aspect most satisfied?</th>
                                <th>Most unsatisfied ?</th>
                                <th>Recommend?</th>
                                <th>Comment</th>
                            </tr>
                <%
                        while(rl.next()) {
                %>
                            <tr>
                                <td><%= rl.getString("PK_ID") %></td>
                                <td><%= rl.getString("Question1") %></td>
                                <td><%= rl.getString("Question2") %></td>
                                <td><%= rl.getString("Question3") %></td>
                                <td><%= rl.getString("Question4") %></td>
                                <td><%= rl.getString("Question5") %></td>
                                <td><%= rl.getString("Question6") %></td>
                                <td><%= rl.getString("Question7") %></td>
                                <td><%= rl.getString("themessage") %></td>
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
    