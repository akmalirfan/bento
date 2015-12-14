<%-- 
    Document   : Login
    Created on : Dec 12, 2015, 11:29:22 AM
    Author     : Nur Husna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="all_include.html"/>
        
    </head>
    <body>
        
         <jsp:include page="header.jsp"/>
         
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
                <div class="login">
                    <div class="login-screen">
                        <div class="app-title">
                        </div>
                        <div class="login-form">
                            <form name="form1" action="checklogin.php" method="post">
                                <div class="control-group">
                                    <div align="left">
                                        <strong style="font-size:16px;">Username</strong>
                                    </div><br>
                                    <input name="username" type="text" class="login-field form-control" placeholder="Your Username" required>
                                    <label class="login-field-icon fui-user" for="login-name"></label>
                                </div>
                                <div class="control-group">
                                    <div align="left">
                                        <strong style="font-size:16px;">Password</strong>
                                    </div><br>
                                    <input name="password" type="password" class="login-field form-control" placeholder="Your Password" required>
                                    <label class="login-field-icon fui-lock" for="login-pass"></label>
                                </div><br>
                                <input class="btn btn-primary btn-large btn-block" type="submit" name="submit" value="Log In"><br>
                                Not a member? <a href="signup.php">Create an account free</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <jsp:include page="footer.jsp"/>
         
    </body>
</html>
