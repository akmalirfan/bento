<%-- 
    Document   : signup
    Created on : Dec 12, 2015, 11:47:33 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="all_include.html"/>
    <title>Sign Up</title>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="container">

    <div class="row">
        <div class="box">
            <div class="col-lg-12">
                <hr>
                <h2 class="intro-text text-center">
                    <strong>Sign Up</strong>
                </h2>
                <hr>
            </div>
            <div class="login">
                <div class="login-screen">
                    <div class="app-title">
                    </div>
                    <div class="login-form">
                        <form name="signup" action="AddNewUserServlet"  method="post">
                            <div class="control-group">
                                <div align="left">
                                    <strong style="font-size:16px;">Username</strong>
                                </div>
                                <input name="username" type="text" class="login-field form-control" placeholder="Your Username" required>
                            </div>
                            <div class="control-group">
                                <div align="left">
                                    <strong style="font-size:16px;">Password</strong>
                                </div>
                                <input name="password" type="password" class="login-field form-control" placeholder="Your Password" required>
                            </div>
                            <div class="control-group">
                                <div align="left">
                                    <strong style="font-size:16px;">Phone Number</strong>
                                </div>
                                <input name="phone" type="text" class="login-field form-control" placeholder="Your Phone Number" required>
                            </div>
                            <div class="control-group">
                                <div align="left">
                                    <strong style="font-size:16px;">Email</strong>
                                </div>
                                <input name="email" type="email" class="login-field form-control" placeholder="Your Email" required>
                            </div>
                            <div class="form-group">
                                <div align="left">
                                    <strong style="font-size:16px;">Address</strong>
                                </div>
                                <textarea class="form-control" name="address" rows="5" id="address" placeholder="Your Address" required></textarea>
                            </div><br>
                            <input class="btn btn-primary btn-large btn-block" type="submit" name="submit" value="Sign Up"><br>
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
