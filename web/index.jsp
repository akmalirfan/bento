<%@page import="common.ResultList"%>
<jsp:include page="header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
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
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
    <div class="container">
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
        
        <%
            if (!isLoggedIn) {
        %>
            <div class="col-xs-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Login</strong></h3>
                    </div>
                    <div class="panel-body">

                        <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/LoginServlet">
                            <div class="form-group">
                                <label for="username" class="control-label col-xs-4">Username</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="inputUsername" placeholder="Username" required>
                                </div>
                            </div>
                            <div class="form-group <% if (invalidPassword) out.println("has-error"); %>">
                                <label for="inputPassword" class="control-label col-xs-4">Password</label>
                                <div class="col-xs-8">
                                    <input type="password" class="form-control" name="inputPassword" placeholder="Password" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-offset-8 col-xs-4">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                            </div>
                        </form>
                    </div> <!-- /.panel-body -->
                </div> <!-- /.panel .panel-default -->


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
            </div>
        <%
            }
        %>
                
    </div> <!-- /.container -->
    <%
    String query = "SELECT * FROM user WHERE id=1";
    ResultList rs = DB.query(query);
    rs.next();
    
    out.println(rs.getString("username"));
    %>
    <jsp:include page="all_include.html"/>
    <jsp:include page="header.jsp"/>

    <div class="container">
       <div class="row">
            <div class="box">
                <div class="col-lg-12 text-center">
                    <h2 class="brand-before">
                        <small style="font-size:18px;">Welcome to</small>
                    </h2>
                    <h1 class="brand-name">Bento Car Rental</h1>
                    <hr class="tagline-divider">
                    <h2>
                        <small style="font-size:14px;">By
                            <strong style="font-size:14px;">Bento Team</strong>
                        </small>
                    </h2><br>
                    <div id="carousel-example-generic" class="carousel slide">
                       <!-- Indicators -->
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                           <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                               <img class="img-responsive img-full" src="img/car1.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/car2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/car3.jpg" alt="">
                            </div>
                             <div class="item ">
                                <img class="img-responsive img-full" src="img/myvicar.jpg" alt="">
                            </div>
                             <div class="item ">
                                <img class="img-responsive img-full" src="img/satriacar.jpg" alt="">
                            </div>
                        </div>
                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"/>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    });
    </script>
</body>
</html>
