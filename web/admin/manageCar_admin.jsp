<%@page import="common.ResultList"%>
<%@page import="common.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html lang="en">

    <head>
        <jsp:include page="../inc/all_include.html"/>
    </head>

    <body>

    <jsp:include page="../inc/header.jsp"/>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Manage Car</strong>
                    </h2>
                    <hr>

                    <%
                    String query = "SELECT * FROM car";
                    ResultList rl = DB.query(query);

                    if(!rl.next()) {
                        System.out.println("Error in retrieving from car.");
                    } else {
                %>
                    <div align="center">
                      <button class="btn btn-link" data-toggle="modal" data-target="#addCar_modal">Add Car</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Code</th>
                                <th>Model</th>
                                <th>Reg No</th>
                                <th>Rate per hour (RM)</th>
                                <th>image</th>
                                <th>Action</th>
                            </tr>
                            
                          <%
                        while(rl.next()) {
                %>
                            <tr>
                                <td><%= rl.getString("code") %></td>
                                <td><%= rl.getString("model") %></td>
                                <td><%= rl.getString("reg_no") %></td>
                                <td><%= rl.getString("rate") %></td>
                                <td>
                                            <img src="../<%= rl.getString("image_path") %>" height="70" width="100">
                                        </td>
                                        <td>
                                            <button class="btn btn-primary" data-toggle="modal" data-target="#editCar_modal">Edit</button>

                                            <% String id = rl.getString("id"); %>
                                            <a class="btn btn-danger" href="admin_deleteCar.php?id=<%= rl.getString("id") %>">Delete</a>
                                        </td>
                            </tr>
                <%
                        }
                    }
                %>
                         
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="../inc/footer.jsp"/>
    </body>

    </html>
 

<div id="addCar_modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Car</h4>
            </div>
            <div class="modal-body">
                <form action="admin_addCar.php" method="post" enctype="multipart/form-data">
                    <table class="table">
                        <tr>
                            <td><strong>Code</strong></td>
                            <td>
                                <input type="text" name="code" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Model</strong></td>
                            <td>
                                <input type="text" name="model" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Reg No</strong></td>
                            <td>
                                <input type="text" name="reg_no" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Rate per hour (RM)</strong></td>
                            <td>
                                <input type="text" name="rate" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Image</strong></td>
                            <td>
                                <input type="file" name="image"/>
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


<div id="editCar_modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Car Info</h4>
            </div>
            
            <div class="modal-body">
                <form action="admin_editCar.php" method="post">
                    <table class="table">
                        <tr>
                            <td><strong>Code</strong></td>
                            <td>
                                <input type="text" name="code" class="form-control" value="<%= rl.getString("code") %>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Model</strong></td>
                            <td>
                                <input type="text" name="model" class="form-control" value="<%= rl.getString("model") %>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Reg No</strong></td>
                            <td>
                                <input type="text" name="reg_no" class="form-control" value="<%= rl.getString("reg_no") %>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Rate</strong></td>
                            <td>
                                <input type="text" name="rate" class="form-control" value="<%= rl.getString("rate") %>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Image</strong></td>
                            <td>
                               <input type="file" name="image"/><img src="../<%= rl.getString("image_path") %>" height="70" width="100">
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


