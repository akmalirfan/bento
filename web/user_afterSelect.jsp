<%-- 
    Document   : user_afterSelect
    Created on : Jan 7, 2016, 9:50:24 AM
    Author     : Akmal Irfan
--%>
<%@page import="common.ResultList"%>
<%@page import="common.DB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="all_include.html" />
        <title>Reservation confirmed</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="container">
            <%
                String sql = "INSERT INTO bookedcar (car_id, user_id, pick_up_location, drop_off_location, pickup_date, pickoff_date, pickup_time, pickoff_time) VALUES (?,?,?,?,?,?,?,?)";

                try {
                    PreparedStatement pstmt = DB.getConnection().prepareStatement(sql);
                    pstmt.setString(1, request.getParameter("car_id"));
                    pstmt.setString(2, session.getAttribute("UserID").toString());
                    pstmt.setString(3, request.getParameter("pul"));
                    pstmt.setString(4, request.getParameter("dol"));
                    pstmt.setString(5, request.getParameter("pud"));
                    pstmt.setString(6, request.getParameter("pod"));
                    pstmt.setString(7, request.getParameter("put"));
                    pstmt.setString(8, request.getParameter("pot"));
                    pstmt.executeUpdate();

                    pstmt.close();
                } catch (SQLException se) {
                    System.out.println(se);
                }
            %>
            <div class="box">
                <h1>Reservation confirmed</h1>
                
                <p><b>Pick-up location:</b> <%=request.getParameter("pul")%></p>
                <p><b>Drop-off location:</b> <%=request.getParameter("dol")%></p>
                <p><b>Pick-up date:</b> <%=request.getParameter("pud")%></p>
                <p><b>Pick-off date:</b> <%=request.getParameter("pod")%></p>
                <p><b>Pick-up time:</b> <%=request.getParameter("put")%></p>
                <p><b>Pick-off time:</b> <%=request.getParameter("pot")%></p>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
    </body>
</html>