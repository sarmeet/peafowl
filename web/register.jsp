<%@ page import="com.java.db.DBConnection" %>
<%--
    Document   : index
    Created on : Nov 13, 2014, 9:58:52 AM
    Author     : sarmeet
--%>

<%

    if (request.getParameter("actiontype") != null) {
        if (request.getParameter("actiontype").equalsIgnoreCase("register")) {

            String Fname = request.getParameter("firstname");
            String Lname = request.getParameter("lastname");
            String Email = request.getParameter("email");
            String Password = request.getParameter("password");
            String SSN = request.getParameter("ssn");
            String Street = request.getParameter("street");
            String City = request.getParameter("city");
            String State = request.getParameter("state");
            String Zipcode = request.getParameter("zipcode");
            String Phone = request.getParameter("phone");
            String Id = request.getParameter("profileid");
            String Age = request.getParameter("age");
            String LDR = request.getParameter("lda");
            String UDR = request.getParameter("uda");
            String GDR = request.getParameter("gdr");
            String Sex = request.getParameter("sex");
            String Height = request.getParameter("height");
            String Weight = request.getParameter("weight");
            String Color = request.getParameter("color");
            String Hobbies = request.getParameter("hobbies");


            String insertPersonQuery =
                    "INSERT INTO `Person` VALUES  ('" + SSN + "','" + Password + "','" +
                            Fname + "','" + Lname + "','" + Street + "','" + City + "','" +
                            State + "'," + Zipcode + ",'" + Email + "','" + Phone + "')";

            System.out.println(insertPersonQuery);
            DBConnection.ExecUpdateQuery(insertPersonQuery);

            String insertUserQuery =
                    "INSERT INTO `User` VALUES ('" + SSN + "','user'" + ", 0" + ",'" + new java.sql.Date(new java.util.Date().getTime()) + "');";
            DBConnection.ExecUpdateQuery(insertUserQuery);

            String insertProfileQuery =
                    "INSERT INTO `Profile` VALUES ('" + Id + "','" + SSN +
                            "'," + Age + "," + LDR + "," + UDR + "," +
                            GDR + ",'" + Sex + "','" + Hobbies + "'," +
                            Height + "," + Weight + ",'" + Color + "','" +
                            new java.sql.Date(new java.util.Date().getTime()) + "','" +
                            new java.sql.Date(new java.util.Date().getTime()) + "');";
            System.out.println(insertProfileQuery);
            DBConnection.ExecUpdateQuery(insertProfileQuery);
            request.setAttribute("message", "User has been created");
            response.sendRedirect("index.jsp");
        }
    }


%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 20px;
        }
    </style>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link href='http://fonts.googleapis.com/css?family=Nixie+One' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/main.css">
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="large-12 columns">
            <center>
                <h1>
                    <div class="custom-heading-js">Welcome to Peafowl Dating</div>
                </h1>
            </center>
        </div>

    </div>


    <div class="row-centered">
        <div class="col-lg-10">
            <div class="panel">

                <div class="row">
                    <form data-abide method="POST">
                        <div class="col-lg-4">
                            <input type="hidden" name="actiontype" value="register">

                            <fieldset>
                                <legend>About You</legend>

                                <div class="name-field">
                                    <label>First Name
                                        <small>(required)</small>
                                        <input type="text" name="firstname" required pattern="[a-zA-Z]+">
                                    </label>
                                    <small class="error">An name is required.</small>
                                </div>

                                <div class="name-field">
                                    <label>Last Name
                                        <small>(required)</small>
                                        <input type="text" name="lastname" required>
                                    </label>
                                    <small class="error">An username is required.</small>
                                </div>

                                <div class="email-field">
                                    <label>Email
                                        <small>(required)</small>
                                        <input type="email" name="email" required>
                                    </label>
                                    <small class="error">An email address is required.</small>
                                </div>

                                <div class="password-field">
                                    <label>Password
                                        <small>(required)</small>
                                        <input type="password" name="password" required>
                                    </label>
                                    <small class="error">A password is required.</small>
                                </div>
                                <div class="password-field">
                                    <label>Password
                                        <small>(again)</small>
                                        <input type="password" required>
                                    </label>
                                    <small class="error">A password is required.</small>
                                </div>

                                <label>SSN
                                    <input type="text" name="ssn" placeholder="xxx-xx-xxx...">
                                </label>

                                <label>Street
                                    <input type="text" name="street" placeholder="Street address">
                                </label>

                                <label>City
                                    <input type="text" name="city" placeholder="City">
                                </label>

                                <label>State
                                    <input type="text" name="state" placeholder="state">
                                </label>

                                <label>Zip code
                                    <input type="text" name="zipcode" placeholder="xxxxx">
                                </label>

                                <label>Telephone
                                    <input type="text" name="phone" placeholder="xxx-xx-xxx...">
                                </label>
                            </fieldset>
                        </div>
                        <div class="col-lg-4">

                            <fieldset>
                                <legend>Profile</legend>
                                <label>Profile ID:
                                    <input type="text" name="profileid" placeholder="profile ID...">
                                </label>

                                <label>Age
                                    <input type="number" name="age" placeholder="Enter your age ">
                                </label>

                                <label>Lower Dating Range
                                    <input type="number" name="lda" placeholder="lower limit of aceptable mates ">
                                </label>

                                <label>Upper Dating Range
                                    <input type="number" name="uda" placeholder="upper limit of acceptable mates ">
                                </label>


                                <label>Geo Dating Range
                                    <input type="number" name="gdr" placeholder="upper limit of acceptable mates ">
                                </label>

                                <label>Sex
                                    <input type="text" name="sex" placeholder="Male/Female ">
                                </label>

                                <label>Height
                                    <input type="text" name="height" placeholder="Enter your Height ">
                                </label>

                                <label>Weight
                                    <input type="number" name="weight" placeholder="Enter your weight ">
                                </label>

                                <label>Hair Color
                                    <input type="text" name="color" placeholder="Enter your hair color ">
                                </label>

                                <label>Hobbies
                                    <input type="text" name="hobbies" placeholder="Enter your hair color ">
                                </label>

                                <div class=" clearfix">
                                    <button type="submit" class="right">Register</button>
                                </div>
                            </fieldset>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </div>

</div>


<footer>
    <p>&copy; The Peafowl group 2014</p>
</footer>
<!-- /container -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.1.min.js"><\/script>')</script>

<script src="js/vendor/bootstrap.min.js"></script>

<script src="js/plugins.js"></script>
<script src="js/main.js"></script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<script>
    (function (b, o, i, l, e, r) {
        b.GoogleAnalyticsObject = l;
        b[l] || (b[l] =
                function () {
                    (b[l].q = b[l].q || []).push(arguments)
                });
        b[l].l = +new Date;
        e = o.createElement(i);
        r = o.getElementsByTagName(i)[0];
        e.src = '//www.google-analytics.com/analytics.js';
        r.parentNode.insertBefore(e, r)
    }(window, document, 'script', 'ga'));
    ga('create', 'UA-XXXXX-X');
    ga('send', 'pageview');
</script>
</body>
</html>
