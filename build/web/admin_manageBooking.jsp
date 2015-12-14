<%-- 
    Document   : admin_manageBooking
    Created on : Dec 13, 2015, 10:21:43 PM
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

        <jsp:include page="header.jsp"/>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Manage Booking</strong>
                    </h2>
                    <hr>

                   <?php
                    include "db_connect.php";

                    $id = $_SESSION["id"];

                    $sql = "select * from bookedcar";
                    $result = $conn->query($sql);

                   ?>
                    <div class="table-responsssive">
                    <table class="table">
                            <tr>
                                <th>Vehicle Code</th>
                                <th>Customer Name</th>
                                <th>Pickup Location</th>
                                <th>Drop off Location</th>
                                <th>Pickup Date</th>
                                <th>Pickup Time</th>
                                <th>Drop Off Date</th>
                                <th>Drop Off Time</th>
                            </tr>
                            <?php
                            if ($result->num_rows > 0) {
                                while ($row = $result->fetch_assoc()) {
                                    ?>
                                    <tr>
                                        <td>
                                          <?php
                                             $car_id = $row["car_id"]; 
                                             $sql2 = "select * from car where id='$car_id'";
                                             $result2 = $conn->query($sql2);
                                             
                                            if ($result2->num_rows > 0) {
                                                while ($row2 = $result2->fetch_assoc()) {
                                                   $car_code = $row2["code"];
                                                }
                                            }
                                            echo $car_code;
                                          ?>
                                        </td>
                                        <td>
                                            <?php
                                                 $user_id = $row["user_id"]; 
                                                 $sql3 = "select * from user where id='$user_id'";
                                                 $result3 = $conn->query($sql3);
                                                 
                                                if ($result3->num_rows > 0) {
                                                    while ($row3 = $result3->fetch_assoc()) {
                                                       $customer_name = $row3["username"];
                                                    }
                                                }
                                                echo $customer_name;
                                            ?>
                                        </td>
                                        <td><?php echo $row["pick_up_location"] ?></td>
                                        <td><?php echo $row["drop_off_location"] ?></td>
                                        <td><?php echo $row["pickup_date"] ?></td>
                                        <td><?php echo $row["pickoff_date"] ?></td>
                                        <td><?php echo $row["pickup_time"] ?></td>
                                        <td><?php echo $row["pickoff_time"] ?></td>
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
