<%-- 
    Document   : user_reservation
    Created on : Dec 13, 2015, 9:22:48 PM
    Author     : V5-473PG
--%>
<%@page import="common.ResultList"%>
<%@page import="common.DB"%>

<!DOCTYPE html>
    <html lang="en">

    <head>
        <jsp:include page="all_include.html"/>
        <script>
            $(function() {
                $('.datepicker').datepicker({ dateFormat: 'dd-mm-yy' });
            });
        </script>
    </head>

    <body>

    <jsp:include page="header.jsp"/>

    <div class="container">
        <div class="row">
            <div class="box">

                      <div class="container-fluid" align="center">
                        <div class="col-lg-12">
                            <hr>
                            <h2 class="intro-text text-center">
                                <strong>Reservation</strong>
                            </h2>
                            <hr>
                            <form action="user_checkavailablecar.jsp" method="post">
                                <div class="form-group">
                                    <label for="pic-up_location">Pick-up location</label>
                                    <select class="form-control" name="pick_up_location" required>
                                        <option value="M01 Kolej Tun Dr. Ismail">M01 Kolej Tun Dr. Ismail</option>
                                        <option value="K01 Kolej Tun Razak">K01 Kolej Tun Razak</option>
                                        <option value="H01 Kolej Tun Fatimah">H01 Kolej Tun Fatimah</option>
                                        <option value="U01 Kolej 10">U01 Kolej 10</option>
                                        <option value="G01 Kolej Rahman Putra">G01 Kolej Rahman Putra</option>
                                        <option value="L01 Kolej Tun Hussin Onn">L01 Kolej Tun Hussin Onn</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="pic-up_location">Drop-off location</label>
                                    <select class="form-control" name="drop_off_location" required>
                                        <option value="M01 Kolej Tun Dr. Ismail">M01 Kolej Tun Dr. Ismail</option>
                                        <option value="K01 Kolej Tun Razak">K01 Kolej Tun Razak</option>
                                        <option value="H01 Kolej Tun Fatimah">H01 Kolej Tun Fatimah</option>
                                        <option value="U01 Kolej 10">U01 Kolej 10</option>
                                        <option value="G01 Kolej Rahman Putra">G01 Kolej Rahman Putra</option>
                                        <option value="L01 Kolej Tun Hussin Onn">L01 Kolej Tun Hussin Onn</option>
                                    </select>
                                </div>
                                <strong>Pick-up Date</strong>
                                <input type="date" class="form-control" name="pickup_date" required/><br>
                                <strong>Pick-up Time</strong>
                                <div class="form-group">
                                    <select name="pickup_time" class="form-control">
                                        <option>- - - -</option>
                                        <option value="7:00:00">7:00 AM</option>
                                        <option value="8:00:00">8:00 AM</option>
                                        <option value="9:00:00">9:00 AM</option>
                                        <option value="10:00:00">10:00 AM</option>
                                        <option value="11:00:00">11:00 AM</option>
                                        <option value="12:00:00">12:00 PM</option>
                                        <option value="13:00:00">1:00 PM</option>
                                        <option value="14:00:00">2:00 PM</option>
                                        <option value="15:00:00">3:00 PM</option>
                                        <option value="16:00:00">4:00 PM</option>
                                        <option value="17:00:00">5:00 PM</option>
                                        <option value="18:00:00">6:00 PM</option>
                                        <option value="19:00:00">7:00 PM</option>
                                        <option value="20:00:00">8:00 PM</option>
                                        <option value="21:00:00">9:00 PM</option>
                                        <option value="22:00:00">10:00 PM</option>
                                        <option value="23:00:00">11:00 PM</option>
                                        <option value="00:00:00">12:00 AM</option>
                                    </select>
                                </div>
                                <strong>Drop-off Date</strong>
                                <input type="date" class="form-control" name="pickoff_date" required/><br>
                                <strong>Drop-off Time</strong>
                                <div class="form-group">
                                    <select name="pickoff_time" class="form-control">
                                        <option>- - - -</option>
                                        <option value="7:00:00">7:00 AM</option>
                                        <option value="8:00:00">8:00 AM</option>
                                        <option value="9:00:00">9:00 AM</option>
                                        <option value="10:00:00">10:00 AM</option>
                                        <option value="11:00:00">11:00 AM</option>
                                        <option value="12:00:00">12:00 PM</option>
                                        <option value="13:00:00">1:00 PM</option>
                                        <option value="14:00:00">2:00 PM</option>
                                        <option value="15:00:00">3:00 PM</option>
                                        <option value="16:00:00">4:00 PM</option>
                                        <option value="17:00:00">5:00 PM</option>
                                        <option value="18:00:00">6:00 PM</option>
                                        <option value="19:00:00">7:00 PM</option>
                                        <option value="20:00:00">8:00 PM</option>
                                        <option value="21:00:00">9:00 PM</option>
                                        <option value="22:00:00">10:00 PM</option>
                                        <option value="23:00:00">11:00 PM</option>
                                        <option value="00:00:00">12:00 AM</option>
                                    </select>
                                </div><br>
                                <button type="submit" class="btn btn-primary btn-block">Continue</button>
                            </form>
                        </div>
                      </div>
                     
               
               
            </div>
        </div>

    </div>

    <jsp:include page="footer.jsp"/>
    </body>

    </html>
   