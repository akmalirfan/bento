<%-- 
    Document   : user_feedback
    Created on : Dec 16, 2015, 12:55:37 AM
    Author     : zeeZiha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="all_include.html"/>
    <title>Submit Feedbacks</title>
</head>
<body>
    <jsp:include page="header.jsp"/>

    <div class="container">
          <div class="box">
                <div class="col-md-12">
                  <hr>
                  <h2 class="intro-text text-center">
                      <strong>Feedback</strong>
                    </h2>
                  <hr>
                </div>
                <div class="col-md-12" style="margin-bottom:3%;">
                    <div align="center">
                        <strong>
                            <span class="service">Service Satisfaction Survey</span>
                        </strong>
                    </div>
                </div>

                <form action="submit_feedbacks.jsp" align="left" method="post">
                    <div class="row" style="padding-left:7%;">
                        <div class="col-md-12" style="margin-bottom:1%;">
                            <strong>
                                1. Overall, how satisfied were you with our service?
                            </strong>
                            <div class="container">
                                <input type="radio" name="Question1" value="VerySatisfied" id="Question1_0">
                                Very Satisfied
                                <br>
                                <input type="radio" name="Question1" value="Satisfied" id="Question1_1">
                                Satisfied
                                <br>
                                <input type="radio" name="Question1" value="Neutral" id="Question1_2">
                                Neutral
                                <br>
                                <input type="radio" name="Question1" value="Unsatisfied" id="Question1_3">
                                Unsatisfied
                                <br>
                                <input type="radio" name="Question1" value="Very Unsatisfied" id="Question1_4">
                                Very Unsatisfied
                                <br>
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-bottom:1%;">
                            <strong>
                                2. How many times have you used our service?
                            </strong>
                            <div class="container">
                                <input type="radio" name="Question2" value="1-2times" id="Question2_0">
                                1-2 times
                                <br>
                                <input type="radio" name="Question2" value="3-4times" id="Question2_1">
                                3-4 times
                                <br>
                                <input type="radio" name="Question2" value="Morethan4times" id="Question2_2">
                                More than 4 times
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-bottom:1%;">
                            <strong>
                                3. What type of car/s have you rented?
                            </strong>
                            <div class="container">
                                <input type="radio" name="Question3" id="myvi" value="myvi">
                                Perodua Myvi
                                <br>
                                <input type="radio" name="Question3" id="kancil" value="kancil">
                                Perodua Kancil
                                <br>
                                <input type="radio" name="Question3" id="viva" value="viva">
                                Perodua Viva
                                <br>
                                <input type="radio" name="Question3" id="saga" value="saga">
                                Proton Saga
                                <br>
                                <input type="radio" name="Question3" id="axia" value="axia">
                                Perodua Axia
                                <br>
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-bottom:1%;">
                            <strong>
                                4. Do you satisfied with the condition of our cars?
                            </strong>
                            <div class="container">
                                <input type="radio" name="Question4" value="verysatisfied2" id="Question4_0">
                                Very Satisfied
                                <br>
                                <input type="radio" name="Question4" value="satisfied2" id="Question4_1">
                                Satisfied
                                <br>
                                <input type="radio" name="Question4" value="neutralsatisfied" id="Question4_2">
                                Neutral
                                <br>
                                <input type="radio" name="Question4" value="unsatisfied2" id="Question4_3">
                                Unsatisfied
                                <br>
                                <input type="radio" name="Question4" value="veryunsatisfied2" id="Question4_4">
                                Very Unsatisfied
                                <br>
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-bottom:1%;">
                            <strong>
                                5. What aspect of the product / service were you most satisfied by?
                            </strong>
                            <div class="container">
                                <input type="radio" name="Question5" value="car condition" id="Question5_0">
                                Car Condition
                                <br>
                                <input type="radio" name="Question5" value="price" id="Question5_1">
                                Price
                                <br>
                                <input type="radio" name="Question5" value="customer service" id="Question5_2">
                                Customer Service
                                <br>
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-bottom:1%;">
                            <strong>
                                6. What aspect of the product / service were you most unsatisfied by?
                            </strong>
                            <div class="container">
                                <input type="radio" name="Question6" value="carcondtion2" id="Question6_0">
                                Car Condition
                                <br>
                                <input type="radio" name="Question6" value="price2" id="Question6_1">
                                Price
                                <br>
                                <input type="radio" name="Question6" value="customerservice2" id="Question6_2">
                                Customer Service
                                <br>
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-bottom:1%;">
                            <strong>
                                7. Would you recommend our service to your friend?
                            </strong>
                            <div class="container">
                                <input type="radio" name="Question7" value="definitely" id="Question7_0">
                                Definitely
                                <br>
                                <input type="radio" name="Question7" value="probably" id="Question7_1">
                                Probably
                                <br>
                                <input type="radio" name="Question7" value="not sure" id="Question7_2">
                                Not Sure
                                <br>
                                <input type="radio" name="Question7" value="definitelynot" id="Question7_3">
                                Definitely Not
                                <br>
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-bottom:1%;">
                            <strong>
                                8. How we can improve our service?
                            </strong>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <textarea class="form-control" rows="5"  name="themessage"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div align="center">
                        <input type="submit" class="btn btn-primary" value="Send" name="B1" onClick="javascript:validateForm()">
                    </div>
                </form>
          </div>
    </div>

    <jsp:include page="footer.jsp"/>
</body>
</html>

