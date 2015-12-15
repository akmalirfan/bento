<%@page import="common.ResultList"%>
<%@page import="common.ViewPermission"%>
<%@page import="common.DB"%>
<%@page import="java.util.ArrayList, common.Page" %>
<%
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
    
    boolean isLoggedIn = false;
    
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div class="container">

    <nav class="navbar navbar-default">
        <div class="container-fluid">

            <div class="collapse navbar-collapse" id="utm-cfms-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    
                    <%  // Full credit to Lo King Wei for below piece of code
                        for (int i = 0; i < pages.size(); ++i) {
                            Page p = pages.get(i);
                            
                            // Determine if user is logged in
                            if (p.getAllowedUser().equals(session.getAttribute("userType"))) {
                                isLoggedIn = true;
                            }
                            
                            if (p.getAllowedUser().equals(session.getAttribute("userType")) || p.getAllowedUser().equals("all")) {
                                if (p.getFileName().contains(currentPageLoaded)) {
                    %>
                                    <li class="active"><a href="<%=p.getFileName()%>"><%=p.getPageTitle()%> <span class="sr-only">(current)</span></a></li>
                    <%  
                                } else { 
                    %>
                                    <li><a href="<%=p.getFileName()%>"><%=p.getPageTitle()%></a></li>
                    <%
                                } 
                            }
                        }
                    %>
                    
                    <%
                        if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("root")) {
                    %> 
                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                            Courses<span class="caret"></span>
                                        </a>
                                        <ul class ="dropdown-menu">
                                            <li><a href="<%=request.getContextPath()%>/root/viewCourses.jsp">All Courses</a></li>
                                            <li><a href="<%=request.getContextPath()%>/root/createOfferedCourse.jsp">Offered Course</a></li>
                                        </ul>
                                    </li>
                    <%
                        }
                    %>
                </ul>
                
                <% if (isLoggedIn) { %>
                    <ul class="nav navbar-nav navbar-right">
                        <% if (session.getAttribute("viewPermission") != null) { %>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-user" aria-hidden="true" style="padding-right: 5px"></span>
                                <%=session.getAttribute("name").toString()%>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Viewing as: <%=viewPermissionAttribute%></a></li>
                                <li role="separator" class="divider"></li>
                                
                                <li>
                                    <a href="<%=request.getContextPath()%>/LogoutServlet">
                                        <span class="glyphicon glyphicon-off" style="padding-right: 10px;"></span>Log Out
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <% } %>
                    </ul>
                <% } %>

            </div>
        </div>
    </nav>
</div>
