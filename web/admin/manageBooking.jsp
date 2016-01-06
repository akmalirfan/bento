<%-- 
    Document   : admin_manageBooking
    Created on : Dec 13, 2015, 10:21:43 PM
    Author     : zeeZiha
--%>

<%@page import="common.ResultList"%>
<%@page import="common.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <strong>Manage Booking</strong>
                </h2>
                <hr>
            <%
                String query = "SELECT * FROM bookedcar";
                ResultList rl = DB.query(query);

                if(!rl.next()) {
                    System.out.println("Error in retrieving from feedback.");
                } else {
            %>
                <div class="table-responsssive">
                    <table class="table">
                        <tr>
                            <th>Vehicle Code</th>
                            <th>Customer Name</th>
                            <th>Pickup Location</th>
                            <th>Drop off Location</th>
                            <th>Pickup Date</th>
                            <th>Pickup Time</th>
                            <th>Drop Off Date</th>
                            <th>Drop Off Time</th>
                        </tr>
            <%
                    String car_code = "CAR CODE UNINITIALIZED";
                    String customer_name = "CUSTOMER NAME UNINITIALIZED";

                    while(rl.next()) {
            %>
                        <tr>
                            <td>
                                <%
                                    String car_id = rl.getString("car_id"); 
                                    query = "SELECT * FROM car WHERE id='" + car_id + "'";
                                    ResultList rl2 = DB.query(query);

                                    while(rl2.next()) {
                                        car_code = rl2.getString("code");
                                    }

                                    out.println(car_code);
                                %>
                            </td>
                            <td>
                                <%
                                    String user_id = rl.getString("user_id"); 
                                    query = "SELECT * FROM user WHERE id='" + user_id + "'";
                                    ResultList rl3 = DB.query(query);

                                    while(rl3.next()) {
                                        customer_name = rl3.getString("username");
                                    }

                                    out.println(customer_name);
                                %>
                            </td>
                            <td><%= rl.getString("pick_up_location") %></td>
                            <td><%= rl.getString("drop_off_location") %></td>
                            <td><%= rl.getString("pickup_date") %></td>
                            <td><%= rl.getString("pickoff_date") %></td>
                            <td><%= rl.getString("pickup_time") %></td>
                            <td><%= rl.getString("pickoff_time") %></td>
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