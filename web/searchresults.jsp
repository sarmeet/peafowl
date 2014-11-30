<%@ page import="com.java.db.DBConnection" %>
<%@ page import="java.sql.ResultSet" %>
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
    if (session.getAttribute("login") != "true") {
        response.sendRedirect("index.jsp");
    }

    StringBuilder sb = new StringBuilder();
    sb.append("SELECT P.ProfileID FROM Profile P where ");
    if (request.getParameter("sex") != null && request.getParameter("sex") != "") {
        sb.append("P.M_F='" + request.getParameter("sex") + "'");
    }
    if (request.getParameter("LowerAge") != null && request.getParameter("LowerAge") != "") {
        sb.append(" and P.Age >" + request.getParameter("LowerAge"));
    }
    if (request.getParameter("UpperAge") != null && request.getParameter("UpperAge") != "") {
        sb.append(" and P.Age <" + request.getParameter("UpperAge"));
    }
    if (request.getParameter("UpperHeight") != null && request.getParameter("UpperHeight") != "") {
        sb.append(" and P.Height <" + request.getParameter("UpperHeight"));
    }
    if (request.getParameter("LowerHeight") != null && request.getParameter("LowerHeight") != "") {
        sb.append(" and P.Height >" + request.getParameter("LowerHeight"));
    }
    if (request.getParameter("UpperWeight") != null && request.getParameter("UpperWeight") != "") {
        sb.append(" and P.Weight <" + request.getParameter("UpperWeight"));
    }
    if (request.getParameter("LowerWeight") != null && request.getParameter("LowerWeight") != "") {
        sb.append(" and P.Weight >" + request.getParameter("LowerWeight"));
    }


    sb.append(";");

    ResultSet rs = DBConnection.ExecQuery(sb.toString());

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
        <div class="col-lg-8 col-md-8 col-sm-8 col-centered translucent-background">
            <Strong>Search Results:</Strong>

            <div class="pull-right">
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
            <hr>
            <%
                while (rs.next()) {
            %>
            <a href="profileview.jsp?vid=<%out.print(rs.getString("ProfileID"));%>"><%
                out.print(rs.getString("ProfileID"));%></a>
            <hr>
            <% }
            %>
            <div class="pull-right">
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                <strong> <a href="profileview.jsp?vid=<%out.print(session.getAttribute("pid")); %>"> My
                    profile </a></strong>
            </div>
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
