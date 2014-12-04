<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.java.db.DBConnection" %>
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
        <div class="col-lg-10 col-md-10 col-sm-10 col-centered translucent-background">


            <%
                String getOngoingDates = "SELECT * FROM Date D WHERE D.Profile1 = '" + session.getAttribute("pid") + "' or D.Profile2='" + session.getAttribute("pid") + "' AND D.Date_Time > NOW() and Location is not null;";

                System.out.println(getOngoingDates);
                ResultSet god = DBConnection.ExecQuery(getOngoingDates);

            %>
            <h3>Ongoing Dates</h3>

            <table class="table table-hover">
                <tr>
                    <th>
                        Name
                    </th>
                    <th>
                        Location
                    </th>
                    <th>
                        Time
                    </th>
                    <th>
                        Comments
                    </th>

                    <th>
                        Cancel
                    </th>
                </tr>

                <%
                    while (god.next()) {

                %>
                <tr>
                    <td>
                        <% if (god.getString("Profile1").equalsIgnoreCase((String) session.getAttribute("pid"))) { %>
                        <a href=profileview.jsp?vid=<%out.print(god.getString("Profile2"));%>><%
                            out.print(god.getString("Profile2"));%></a>
                        <%} else {%>
                        <a href=profileview.jsp?vid=<%out.print(god.getString("Profile1"));%>><%
                            out.print(god.getString("Profile1"));%></a>
                        <%}%>
                    </td>
                    <td>
                        <%out.print(god.getString("Location"));%>
                    </td>
                    <td>
                        <%out.print(god.getString("Date_Time"));%>
                    </td>
                    <td>
                        <%out.print(god.getString("Comments"));%>
                    </td>
                    <td>
                        <%
                            if (god.getString("Profile1").equalsIgnoreCase((String) session.getAttribute("pid"))) {
                        %>

                        <a href=date.jsp?CancelDate=true&&DateType=requested&&dateWith=<%
                            out.print(god.getString("Profile2"));%>>
                            <button type="button" class="btn btn-danger">Delete Date</button>
                        </a>
                        <%} else {%>

                        <a href=date.jsp?CancelDate=true&&DateType=received&&dateWith=<%
                            out.print(god.getString("Profile1"));%>>
                            <button type="button" class="btn btn-danger">Delete Date</button>
                        </a>
                        <%}%>
                    </td>

                </tr>
                <%}%>
            </table>


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
