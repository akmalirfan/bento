<%-- 
    Document   : user_checkavailablecar
    Created on : Jan 6, 2016, 10:48:03 PM
    Author     : Syamira Ariff
--%>
<%@page import="common.ResultList"%>
<%@page import="common.DB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="all_include.html" />
        <title>Available cars</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="container">
            <div class="row">
                <div class="box">
                    <div class="col-lg-12">
                        <hr>
                        <h2 class="intro-text text-center">
                            <strong>Available Car</strong>
                        </h2>
                        <hr>

                    <%
                        String query = "SELECT * FROM car";
                        ResultList rs = DB.query(query);

                        if(!rs.next()) {
                            System.out.println("Error in retrieving from car.");
                        } else {
                            String car_id = rs.getString("id");
                            String user_id = session.getAttribute("UserID").toString();
                            String pick_up_location = request.getParameter("pick_up_location");
                            String drop_off_location = request.getParameter("drop_off_location");
                            String pickup_date = request.getParameter("pickup_date");
                            String pickoff_date = request.getParameter("pickoff_date");
                            String pickup_time = request.getParameter("pickup_time");
                            String pickoff_time = request.getParameter("pickoff_time");

                            //String pickup_date_time = "pickup_date pickup_time";
                            //String pickoff_date_time = "pickoff_date pickoff_time";
                            //SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

                            //Date d1 = null;
                            //Date d2 = null;

                            //d1 = format.parse(pickup_date_time);
                            //d2 = format.parse(pickoff_date_time);




                            //in milliseconds
                            //long diff = d2.getTime() - d1.getTime();

                            //long diffHours = diff / (60 * 60 * 1000) % 24;

                            //String qInsert="INSERT INTO bookedcar (pick_up_location,drop_off_location,pickup_date,pickoff_date,pickup_time,pickoff_time)"
                            //            + "VALUES (?,?,?,?,?,?)";
                            /*
                            String qInsert="INSERT INTO bookedcar (car_id, user_id, pick_up_location, drop_off_location, pickup_date, pickoff_date, pickup_time, pickoff_time) VALUES (?,?,?,?,?,?,?,?)";

                            try {
                                PreparedStatement pstmt = DB.getConnection().prepareStatement(qInsert);
                                pstmt.setString(1, car_id);
                                pstmt.setString(2, user_id);
                                pstmt.setString(3, pick_up_location);
                                pstmt.setString(4, drop_off_location);
                                pstmt.setString(5, pickup_date);
                                pstmt.setString(6, pickoff_date);
                                pstmt.setString(7, pickup_time);
                                pstmt.setString(8, pickoff_time);
                                pstmt.executeUpdate();

                                pstmt.close();
                            } catch (SQLException se) {
                                System.out.println(se);
                            }*/
                    %>
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th>Code</th>
                                    <th>Model</th>
                                    <th>Reg No</th>
                                    <th>Rate per hour (RM)</th>
                                    <th>image</th>
                                    <th>Action</th>
                                </tr>
                    <%
                            while(rs.next()){
                    %>
                                <tr>
                                    <td><%= rs.getString("code") %></td>
                                    <td><%= rs.getString("model") %></td>
                                    <td><%= rs.getString("reg_no") %></td>
                                    <td><%= rs.getString("rate") %></td>
                                    <td>
                                        <img src="<%= rs.getString("image_path") %>" height="70" width="100">
                                    </td>
                                    <td>
                                        <a href="user_afterSelect.jsp?car_id=<%= rs.getString("id") %>&pul=<%=pick_up_location%>&dol=<%=drop_off_location%>&pud=<%=pickup_date%>&pod=<%=pickoff_date%>&put=<%=pickup_time%>&pot=<%=pickoff_time%>" class="btn btn-primary">Select</a>
                                    </td>
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

        <jsp:include page="footer.jsp" />
    </body>
</html>
    


