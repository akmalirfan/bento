<%-- 
    Document   : admin_manageAccount
    Created on : Dec 13, 2015, 10:26:50 PM
    Author     : zeeZiha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<?php
session_start();

$valid_session = isset($_SESSION['level']) ? $_SESSION['level'] == "0" : FALSE;

if($valid_session){ ?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <jsp:include page="all_include.html"/>
    </head>

    <body>

        <jsp:include page="footer.jsp"/>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Manage Account</strong>
                    </h2>
                    <hr>

                    <?php
                    include "db_connect.php";

                    $id = $_SESSION["id"];

                    $sql = "select * from user where level='1'";
                    $result = $conn->query($sql);

                   ?>
                    <div class="table-responsive">
                    <table class="table">
                                <tr>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>Phone Number</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    
                                </tr>
                    <?php
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <td><?php echo $row["username"] ?></td>
                                    <td><?php echo $row["password"] ?></td>
                                    <td><?php echo $row["phone"] ?></td>
                                    <td><?php echo $row["email"] ?></td>
                                    <td><?php echo $row["address"] ?></td>
                                    
                                </tr>

                            <?php
                        }
                    }
                    ?>
                    </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="footer.jsp"/>
    </body>

    </html>
    <?php
    $conn->close();
}
else{
    echo "<div align='center'><h1 style='color:red'>You Have No Permission To Enter This Page</h1></div>";
    header('Refresh: 2; URL=index.php');
    exit();
}
?>
