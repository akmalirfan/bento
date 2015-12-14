<%-- 
    Document   : aboutUs
    Created on : Dec 13, 2015, 10:32:00 PM
    Author     : zeeZiha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="all_include.html"/>
</head>

<body>

    <?php
        session_start();

        if(isset($_SESSION["level"])){
            <jsp:include page="header_user.jsp"/>
        }
        else{
            <jsp:include page="header.jsp"/>
        }
    ?>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Our
                        <strong>Team</strong>
                    </h2>
                    <hr>
                </div>
                <div class="row" style="padding-left:15%;padding-right:15%;">
                    <div class="col-sm-6 text-center">
                        <img src="img/yana.jpg" alt="" width="350" height="250" class="img-responsive">
                        <h3>NOOR Dyana Kaseharom</h3>
                    </div>
                    <div class="col-sm-6 text-center">
                        <img src="img/IMG-20150311-WA0059.jpg" alt="" width="350" height="250" class="img-responsive">
                        <h3>Nor Ziha Salikin</h3>
                    </div>
                </div><br>

                <div class="row" style="padding-left:15%;padding-right:15%;">
                    <div class="col-sm-6 text-center">
                        <img src="img/IMG-20150311-WA0030.jpg" alt="" width="350" height="250" class="img-responsive">
                        <h3>Nur Husna MOHAMAD HASBULLAH</h3>
                    </div>
                    <div class="col-sm-6 text-center">
                        <img src="img/sam.jpg" alt="" width="350" height="250" class="img-responsive">
                        <h3>Nurul Syamira MOHD ARIFF</h3>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>

    </div>

    <jsp:include page="footer.jsp"/>

</body>

</html>

