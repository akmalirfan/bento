<%@page import="common.ResultList"%>
<%@ page import ="java.sql.*, common.DB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userType = "Guest";
    boolean isLoggedIn = false;
    if (session.getAttribute("userType") != null) {
        userType = (String) session.getAttribute("userType");
        isLoggedIn = true;
    }
    
    boolean invalidPassword = false;
    
    if (session.getAttribute("Error") != null) {
        if (session.getAttribute("Error").equals("Invalid password.")) {
            invalidPassword = true;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
        <jsp:include page="all_include.html"/>
        
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <%
            String access_error = "Access Error";
            if (session.getAttribute(access_error) != null) { // If there is an error during login
        %>
        
        <div class="alert alert-danger" role="alert">
            <span class="glyphicon glyphicon-remove" aria-hidden="true" style="padding-right: 10px"></span>
            <strong><%=session.getAttribute(access_error) %></strong>
        </div>
        
        <%
            session.removeAttribute(access_error);
            }
        %>
        
        
        <div class="container">
            <div class="row">
                <div class="box">
                    <div class="col-lg-12">
                        <hr>
                        <h2 class="intro-text text-center">
                            <strong>Log In</strong>
                        </h2>
                        <hr>
                    </div>
                    
            <%
                if (!isLoggedIn) {
            %>
                    <div class="login">
                        <div class="login-screen">
                            <div class="app-title">
                            </div>
                            <div class="login-form">
                                <%
                                    String login_error = "Login Error";
                                    if (session.getAttribute(login_error) != null) { // If there is an error during login
                                %>
                                        <div class="alert alert-danger" role="alert">
                                            <span class="glyphicon glyphicon-remove" aria-hidden="true" style="padding-right: 10px"></span>
                                            <strong><%=session.getAttribute(login_error) %></strong>
                                        </div>
                                <%
                                    session.removeAttribute(login_error);
                                    }
                                %>
                                <form name="form1" method="post" action="<%=request.getContextPath()%>/LoginServlet">
                                    <div class="control-group">
                                        <div align="left">
                                            <strong style="font-size:16px;">Username</strong>
                                        </div><br>
                                        <input name="inputUsername" type="text" class="login-field form-control" placeholder="Your Username" required>
                                        <label class="login-field-icon fui-user" for="login-name"></label>
                                    </div>
                                    <div class="control-group">
                                        <div align="left">
                                            <strong style="font-size:16px;">Password</strong>
                                        </div><br>
                                        <input name="inputPassword" type="password" class="login-field form-control" placeholder="Your Password" required>
                                        <label class="login-field-icon fui-lock" for="login-pass"></label>
                                    </div><br>
                                    <input class="btn btn-primary btn-large btn-block" type="submit" name="submit" value="Log In"><br>
                                    Not a member? <a href="signup.php">Create an account free</a>
                                </form>
                            </div>
                        </div>
                    </div>
            <%
                } else {
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
            %>
        
                
            </div>
        </div>
    </div>

     <jsp:include page="footer.jsp"/>
         
    </body>
</html>
