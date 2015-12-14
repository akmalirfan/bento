<%-- 
    Document   : header_admin
    Created on : Dec 13, 2015, 9:13:30 PM
    Author     : V5-473PG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="brand">Bento Car Rental</div>

<!-- Navigation -->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
            <a class="navbar-brand" href="admin_home.jsp">Bento Car Rental</a>

        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="admin_home.jsp">Home</a>
                </li>
                <li>
                    <a href="admin_manageAccount.jsp">Manage Account</a>
                </li>
                <li>
                    <a href="admin_manageBooking.jsp">Manage Booking</a>
                </li>
                <li>
                    <a href="admin_manageCar.jsp">Manage Cars</a>
                </li>
                <li>
                    <a href="admin_viewfeedback.jsp">View Feedback</a>
                </li>
                
                <li><strong style="margin-left:15px;"><?php echo $_SESSION["username"] ?>(<a href="logout.jsp">Logout</a>)</strong></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
