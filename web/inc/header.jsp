<%@page import="common.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String userType = "Guest";
    boolean isLoggedIn = false;
    
    if (session.getAttribute("userType") != null) {
        userType = (String) session.getAttribute("userType");
        isLoggedIn = true;
    }
%>

<header>
    <div class="brand">Bento Car Rental
        <h1 align="right">
    <% if (isLoggedIn) { %>
            <a href="../user_myaccount.jsp" style="color:white;">Hi, <%= session.getAttribute("User") %></a> |
            <a href="../LogoutServlet" style="color:white;">Logout</a>
    <% } else { %>
            <a href="../signup.jsp" style="color:white;">Sign Up</a> |
            <a href="../login.jsp" style="color:white;">Login</a>
    <% } %>
        </h1>
    </div>

    <!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="../index.jsp">Bento Car Rental</a>

            </div>
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="../index.jsp">Home</a>
                    </li>
                    
                    <% if (!userType.equals("admin")) { %>
                    <li>
                        <a href="../ourvehicle.jsp">Our Vehicles</a>
                    </li>
                    <li>
                        <a href="../login.jsp">Reservation</a>
                    </li>
                    <li>
                        <a href="../feedbacks.jsp">Feedback</a>
                    </li>
                    <% } else { %>
                    <li>
                        <a href="../admin/manageAccount.jsp">Users</a>
                    </li>
                    <li>
                        <a href="../admin/manageBooking.jsp">Bookings</a>
                    </li>
                    <li>
                        <a href="../admin/manageCar_admin.jsp">Cars</a>
                    </li>
                    <li>
                        <a href="../admin/viewFeedback_admin.jsp">Feedbacks</a>
                    </li>
                    <% } %>
                    
                    <% if (isLoggedIn) { %>
                    <li>
                        <a href="../LogoutServlet"><strong>Logout (<%= session.getAttribute("User") %>)</strong></a>
                    </li>
                    <% } %>
                </ul>
            </div> <!-- /.navbar-collapse -->
        </div> <!-- /.container -->
    </nav>
</header>