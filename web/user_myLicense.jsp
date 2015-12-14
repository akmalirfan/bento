<%-- 
    Document   : user_myLicense
    Created on : Dec 13, 2015, 11:09:04 PM
    Author     : zeeZiha
--%>

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
            <div class="col-lg-12">
                <hr>
                <h2 class="intro-text text-center">
                    <strong>My License</strong>
                </h2>
                <hr>
                <?php
                include "db_connect.php";

                $id = $_SESSION["id"];

                $sql = "select * from license where user_id='$id'";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $path = $row["image_path"];
                     ?>
                     <div class="container-fluid" align="center">
                         <strong>License exist</strong><br>
                          <img src="<?php echo $path ?>"/>  
                      </div>
                     <?php 
                    }
                }
        				else if($result->num_rows == 0){
        				?>
                          <div class="container-fluid" align="center">
                           <strong>License not exist</strong>
        				  <form action="User_AddLicense.php" method="post" enctype="multipart/form-data">
                          <strong>File</strong>
                          <input type="file" name="image" accept="image/*">
                          <input type="submit" class="btn btn-success" value="Save"/>
                          </form>
                          </div>   
        				<?php   
        				}
                ?>                
            </div>
        </div>
    </div>

</div>

<jsp:include page="footer.php.jsp"/>
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


