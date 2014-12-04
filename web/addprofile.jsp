<%@ page import="com.java.db.DBConnection" %>
<%

    if (request.getParameter("actiontype") != null && request.getParameter("actiontype").equalsIgnoreCase("addprofile")) {
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
        String insertProfileQuery =
                "INSERT INTO `Profile` VALUES ('" + Id + "','" + session.getAttribute("ssn") +
                        "'," + Age + "," + LDR + "," + UDR + "," +
                        GDR + ",'" + Sex + "','" + Hobbies + "'," +
                        Height + "," + Weight + ",'" + Color + "','" +
                        new java.sql.Date(new java.util.Date().getTime()) + "','" +
                        new java.sql.Date(new java.util.Date().getTime()) + "');";
        System.out.println(insertProfileQuery);
        DBConnection.ExecUpdateQuery(insertProfileQuery);
        session.setAttribute("pid", Id);
        response.sendRedirect("index.jsp");

    } %>
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
    <div class="row row-centered">
        <div class="col-lg-5 col-md-5 col-sm-10 col-centered translucent-background">

            <h3>Add a profile</h3>
            <hr>
            <form action="addprofile.jsp">
                <input type="hidden" name="actiontype" value="addprofile">
                <fieldset>
                    <legend>Profile</legend>
                    <label>Profile ID:
                        <input type="text" name="profileid" placeholder="profile ID...">
                    </label>
                    <br>
                    <label>Age
                        <input type="number" name="age" placeholder="Enter your age ">
                    </label>
                    <br>

                    <label>Lower Dating Range
                        <input type="number" name="lda" placeholder="lower limit of aceptable mates ">
                    </label>
                    <br>

                    <label>Upper Dating Range
                        <input type="number" name="uda" placeholder="upper limit of acceptable mates ">
                    </label>
                    <br>


                    <label>Geo Dating Range
                        <input type="number" name="gdr" placeholder="upper limit of acceptable mates ">
                    </label>
                    <br>

                    <label>Sex
                        <input type="text" name="sex" placeholder="Male/Female ">
                    </label>
                    <br>

                    <label>Height
                        <input type="text" name="height" placeholder="Enter your Height ">
                    </label>
                    <br>

                    <label>Weight
                        <input type="number" name="weight" placeholder="Enter your weight ">
                    </label>
                    <br>

                    <label>Hair Color
                        <input type="text" name="color" placeholder="Enter your hair color ">
                    </label>
                    <br>

                    <label>Hobbies
                        <input type="text" name="hobbies" placeholder="Enter your hair color ">
                    </label>
                    <br>

                    <div class=" clearfix">
                        <button type="submit" class="right">Register</button>
                    </div>
                </fieldset>
            </form>
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
