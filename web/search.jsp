<%--
    Document   : index
    Created on : Nov 13, 2014, 9:58:52 AM
    Author     : sarmeet
--%>

<%--
common in all pages.

--%>

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
            <h3>
                Search
            </h3>

            <div class="pull-right">

                <a href="viewdates.jsp">
                    <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-heart-empty"
                                                                     aria-hidden="true"></span>
                        View Dates
                    </button>
                </a>
                <a href="search.jsp">
                    <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search"
                                                                        aria-hidden="true"></span>
                        Search
                    </button>
                </a>
                <a href="logout.jsp">
                    <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove-circle"
                                                                       aria-hidden="true"></span>Logout
                    </button>
                </a>
            </div>

            <form role="form" action="searchresults.jsp">
                <div class="form-group">
                    <label for="sex">Sex</label>
                    <select class="form-control" id="sex" name="sex">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="LowerAge">Lower Age Limit</label>
                    <input type="number" class="form-control" name="LowerAge" id="LowerAge" placeholder="18-100"
                           required/>
                </div>
                <div class="form-group">
                    <label for="UpperAge">Upper Age Limit</label>
                    <input type="number" class="form-control" id="UpperAge" name="UpperAge" placeholder="18-100"
                           required/>
                </div>

                <div class="form-group">
                    <label for="UpperHeight">Height Less Than</label>
                    <input type="number" class="form-control" id="UpperHeight" name="UpperHeight" placeholder="18-100"/>
                </div>

                <div class="form-group">
                    <label for="LowerHeight">Height Greater Than</label>
                    <input type="number" class="form-control" id="LowerHeight" name="LowerHeight" placeholder="18-100"/>
                </div>

                <div class="form-group">
                    <label for="UpperWeight">Weight Less Than</label>
                    <input type="number" class="form-control" id="UpperWeight" name="UpperWeight" placeholder="18-100"/>
                </div>

                <div class="form-group">
                    <label for="LowerWeight">Weight Greater Than</label>
                    <input type="number" class="form-control" id="LowerWeight" name="LowerWeight" placeholder="18-100"/>
                </div>
                <button type="submit" class="btn btn-default">Search</button>
            </form>
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
