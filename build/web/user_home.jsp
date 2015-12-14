<%-- 
    Document   : user_home
    Created on : Dec 13, 2015, 11:04:03 PM
    Author     : zeeZiha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<?php
session_start();

$valid_session = isset($_SESSION['level']) ? $_SESSION['level'] == "1" : FALSE;

if($valid_session){ ?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <jsp:include page="all_include.html"/>
    </head>

    <body>

    <jsp:include page="header_user.jsp"/>

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

    <?php
}
else{
    echo "<div align='center'><h1 style='color:red'>You Have No Permission To Enter This Page</h1></div>";
    header('Refresh: 2; URL=index.php');
    exit();
}
?>

