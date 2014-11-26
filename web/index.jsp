<%--
    Document   : index
    Created on : Nov 13, 2014, 9:58:52 AM
    Author     : sarmeet
--%>

<%--
common in all pages.

--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("login") != "" && session.getAttribute("login") != null) {
        response.sendRedirect("profile.jsp");
    }

%>
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
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 20px;
        }
    </style>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/main.css">

    <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<%--

common in all pages.

--%>

<body>

<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12">

        <h3>
            <div class="custom-heading-po">Dating Made Easy!</div>
        </h3>

        <p>Please Login or Register to Continue</p>

        <%
            if (request.getAttribute("message") != null && request.getAttribute("message") != "") {
        %>

        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                    class="sr-only">Close</span></button>
            <strong>Error!</strong>

            <%
                out.print(request.getAttribute("message"));
                request.setAttribute("message", "");
            %>
        </div>

        <% }

        %>

        <p>Login</p>
        <%
        %>
        <form data-abide action="login.jsp" method="POST">
            <input type="hidden" name="actiontype" value="Login">

            <div>
                <label>Email
                    <small>(required)</small>
                    <input type="email" name="email" required/>
                </label>
                <label>Password
                    <small>(required)</small>
                    <input type="password" name="password" required/>
                </label>
            </div>
            <div class=" clearfix">
                <button type="submit" class="right">Login</button>
            </div>
        </form>
    </div>
</div>


<%--
common in all pages.
boobooboobooboo
--%>

<footer>
    <p>&copy; Company 2014</p>
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


<%--
common in all pages.

--%>
