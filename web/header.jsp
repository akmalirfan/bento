<%@page import="common.ResultList"%>
<%@page import="common.ViewPermission"%>
<%@page import="common.DB"%>
<%@page import="java.util.ArrayList, common.Page" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userType = "Guest";
    boolean isLoggedIn = false;
    if (session.getAttribute("userType") != null) {
        userType = (String) session.getAttribute("userType");
        isLoggedIn = true;
    }
    
    // HEADER PAGE TO BE INCLUDED IN ALL PAGES
    // FOR AUTHENTICATION CHECK, USE auth.jsp
    //
    // Sample Usage:
    // In a page where you want to include this file, add
    // <jsp:include page="../header.jsp"/> if inside one folder in and
    // <jsp:include page="header.jsp"/> if in the same directory as this file
    //
    // MAKE SURE TO INCLUDE THIS FILE BEFORE YOUR 
    // <div class="container"></div> TAGS
    // 
    
    // Example output: index.jsp
    String currentPageNameWithSlash = request.getServletPath();
    String currentPageLoaded = currentPageNameWithSlash.substring(currentPageNameWithSlash.lastIndexOf("/")+1); 
    
    ArrayList<Page> pages = new ArrayList();
    
    // add pages to arraylist
    // Pages constructor: <userType> <fileName> <pageTitle>
    pages.add(new Page("all", request.getContextPath() + "/index.jsp", "Home"));
    
    
    //pages.add(new Page("root", request.getContextPath() + "/root/viewLecturers.jsp", "Lecturers"));
    
    String viewPermissionAttribute = "Guest";
    
    /*if (session.getAttribute("viewPermission") != null) {
        ViewPermission a = ViewPermission.valueOf(session.getAttribute("viewPermission").toString());
        viewPermissionAttribute = a.toString();
    }*/
%>
<!DOCTYPE html>
<html>
    <% if (isLoggedIn) { %>
    <div class="brand">Bento Car Rental
        <h1 align="right">
            <a href="user_myaccount.jsp" style="color:white;">Hi, <%= session.getAttribute("User") %></a> |
            <a href="LogoutServlet" style="color:white;">Logout</a>
        </h1>
    </div>
    <% } else { %>
    <div class="brand">Bento Car Rental
        <h1 align="right">
            <a href="signup.jsp" style="color:white;">Sign Up</a> |
            <a href="login.jsp" style="color:white;">Login</a>
        </h1>
    </div>
    <% } %>

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
                <a class="navbar-brand" href="index.jsp">Bento Car Rental</a>

            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="ourvehicle.jsp">Our Vehicles</a>
                    </li>
                    <li>
                        <a href="login.jsp">Reservation</a>
                    </li>
                    <li>
                        <a href="feedbacks.jsp">Feedback</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
