<%@ page import="com.java.db.DBConnection" %>
<%--
    Document   : index
    Created on : Nov 13, 2014, 9:58:52 AM
    Author     : sarmeet
--%>

<%--
common in all pages.

--%>

<%
    if (request.getParameter("addcard") != null) {
        if (request.getParameter("number") != "" && request.getParameter("number") != null) {
            String number = request.getParameter("number");
            number = number.replaceAll("\\s+", "");
            System.out.println(request.getParameter("number"));
            String addAccount = "insert into Account values ('" + session.getAttribute("ssn") + "'," + number + ",'" + session.getAttribute("ssn") + "','" + new java.sql.Date(new java.util.Date().getTime()) + "');";
            System.out.println(addAccount);
            DBConnection.ExecUpdateQuery(addAccount);
            response.sendRedirect("date.jsp?askdate=" + request.getParameter("askdate"));
        }
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/card.css">

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

<%--

common in all pages.

--%>

<body>
<div class="container-fluid">
    <div class="row row-centered">
        <div class="col-lg-4 col-md-4 col-sm-10 col-centered translucent-background">

            <style>
                .demo-container {
                    width: 100%;
                    max-width: 350px;
                    margin: 50px auto;
                }

                form {
                    margin: 30px;
                }

                input {
                    width: 200px;
                    margin: 10px auto;
                    display: block;
                }
            </style>
            <div class="demo-container">
                <div class="card-wrapper"></div>

                <div class="form-container active">
                    <form action="addaccount.jsp" method="POST">
                        <input placeholder="Card number" type="text" name="number">
                        <input placeholder="Full name" type="text" name="name">
                        <input placeholder="MM/YY" type="text" name="expiry">
                        <input placeholder="CVC" type="text" name="cvc">
                        <input type="hidden" name="addcard" value="true">
                        <input type="submit" class="btn btn-warning center-block" value="Add Card">
                    </form>
                </div>
            </div>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <script src="/js/card.js"></script>
            <script>
                $('.active form').card({
                    container: $('.card-wrapper')
                })
            </script>

        </div>
    </div>
</div>


<%--
common in all pages.
boobooboobooboo
--%>


<footer>
    <p>&copy; The Peafowl group 2014</p>
</footer>
<!-- /container -->

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


<%--
common in all pages.

--%>
