<%-- 
    Document   : user_myaccount
    Created on : Dec 13, 2015, 10:29:53 PM
    Author     : zeeZiha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

    <jsp:include page="header.jsp"/>

<div class="container">

    <div class="row">
        <div class="box">
            <div class="col-lg-12">
                <hr>
                <h2 class="intro-text text-center">
                    <strong>My Account</strong>
                </h2>
                <hr>

                <?php
                include "db_connect.php";

                $id = $_SESSION["id"];

                $sql = "select * from user where id='$id'";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $username = $row["username"];
                        $password = $row["password"];
                        $phone = $row["phone"];
                        $email = $row["email"];
                        $address = $row["address"];
                        ?>

                        <table class="table">
                            <tr>
                                <td></td>
                                <td>
                                    <a href="#" data-toggle="modal" data-target="#editProfile_modal">Edit</a>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Username</strong></td>
                                <td><?php echo $username ?></td>
                            </tr>
                            <tr>
                                <td><strong>Password</strong></td>
                                <td><?php echo $password ?></td>
                            </tr>
                            <tr>
                                <td><strong>Phone Number</strong></td>
                                <td><?php echo $phone ?></td>
                            </tr>
                            <tr>
                                <td><strong>Email</strong></td>
                                <td><?php echo $email ?></td>
                            </tr>
                            <tr>
                                <td><strong>Address</strong></td>
                                <td><?php echo $address ?></td>
                            </tr>
                        </table>
                        <?php
                    }
                }
                ?>
            </div>

            <div class="col-lg-12">
                <hr>
                <h2 class="intro-text text-center">
                    <strong>My Reservation</strong>
                </h2>
                <hr>

                <?php
                $sql = "select * from bookedcar where user_id='$id'";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) { ?>
                   <table class="table">
                    <tr>
                        <th>Vehicle Code</th>
                        <th>Pickup Location</th>
                        <th>Drop off Location</th>
                        <th>Pickup Date</th>
                        <th>Pickup Time</th>
                        <th>Drop Off Date</th>
                        <th>Drop Off Time</th>
                    </tr> 
                    <?php
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
                else{
                    ?>
                    <div align="center">
                        <strong>Not Reserve Yet!</strong>
                    </div>
                    <?php
                }
                ?>
            </table>
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

<div id="editProfile_modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Account Profile</h4>
            </div>
            <div class="modal-body">
                <form action="user_editAccount.php" method="post">
                    <table class="table">
                        <tr>
                            <td><strong>Username</strong></td>
                            <td>
                                <input type="text" name="username" class="form-control" value="<?php echo $username ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Password</strong></td>
                            <td>
                                <input type="text" name="password" class="form-control" value="<?php echo $password ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Phone Number</strong></td>
                            <td>
                                <input type="text" name="phone" class="form-control" value="<?php echo $phone ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Email</strong></td>
                            <td>
                                <input type="text" name="email" class="form-control" value="<?php echo $email ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Address</strong></td>
                            <td>
                                <textarea class="form-control" name="address" rows="5"><?php echo $address ?></textarea>
                            </td>
                        </tr>
                    </table>
                    <div align="center">
                        <button type="submit" class="btn btn-success">Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

