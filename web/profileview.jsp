<%@ page import="com.java.db.DBConnection" %>
<%@ page import="java.sql.SQLException" %>
<%--
    Document   : index
    Created on : Nov 13, 2014, 9:58:52 AM
    Author     : sarmeet
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("login") != "true") {
        response.sendRedirect("index.jsp");
    }

    String Pquery = "SELECT * FROM Profile WHERE ProfileID = '"
            + request.getParameter("vid") + "';";
    java.sql.ResultSet profiles = DBConnection.ExecQuery(Pquery);
    try {
        if (profiles.next()) {
            request.setAttribute("vid", profiles.getString("ProfileID"));
            request.setAttribute("age", profiles.getInt("Age"));
            request.setAttribute("datingAgeStart", profiles.getInt("DatingAgeRangeStart"));
            request.setAttribute("datingAgeEnd", profiles.getInt("DatingAgeRangeEnd"));
            request.setAttribute("datingGeoRange", profiles.getInt("DatinGeoRange"));
            request.setAttribute("mf", profiles.getString("M_F"));
            request.setAttribute("hobbies", profiles.getString("Hobbies"));
            request.setAttribute("weight", profiles.getInt("Weight"));
            request.setAttribute("height", profiles.getFloat("Height"));
            request.setAttribute("creationDate", profiles.getDate("CreationDate"));
            request.setAttribute("updateDate", profiles.getDate("LastModDate"));
            request.setAttribute("hairColor", profiles.getString("HairColor"));

        }
    } catch (SQLException e) {
        e.printStackTrace();
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
            <p></p>About <strong><%out.print(request.getAttribute("vid"));%>
        </strong>

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

            <hr>
            <div class="row row-centered">
                <div class="col-lg-2 col-centered">
                    <%
                        if (request.getAttribute("mf").equals("Male")) { %>
                    <img src="img/male.png" class="img-responsive">
                    <% } else {
                    %>
                    <img src="img/female.png" class="img-responsive">
                    <%
                        }
                    %>
                </div>
            </div>

            <div class="row-centered">
                <div class="col-lg-12 col-centered">
                    <%if (!request.getAttribute("vid").equals(session.getAttribute("pid"))) {%>
                    <a href=like.jsp?vid=<%out.print(request.getParameter("vid"));%>  >
                        <button type="button" class="btn btn-info">Like</button>
                    </a>
                    <% if (session.getAttribute("d2") == "" || session.getAttribute("d2") == null) { %>
                    <a href="date.jsp?d2=<%out.print(request.getParameter("vid"));%>">
                        <button type="button" class="btn btn-info">Refer a date
                        </button>
                    </a>
                    <%
                    } else {
                        if (!session.getAttribute("d2").equals(request.getParameter("vid"))) {
                    %>

                    <a href="date.jsp?d3=<%out.print(request.getParameter("vid"));%>">
                        <button type="button" class="btn btn-info">Refer as a date to <%
                            out.print(session.getAttribute("d2"));%></button>
                    </a>
                    <% }
                    } %>
                    <a href="date.jsp?askdate=<%out.print(request.getParameter("vid"));%>">
                        <button type="button" class="btn btn-info">ask out for date</button>
                    </a>

                    <% } %>
                </div>
            </div>
            <hr>
            <div class="row row-centered">
                <div class="col-lg-2 col-centered">
                    <table class="table table-hover">
                        <tr>
                            <td><strong>Name:</strong></td>
                            <td><%out.print(request.getAttribute("vid"));%></td>
                        </tr>
                        <tr>
                            <td><strong>Sex:</strong></td>
                            <td><%out.print(request.getAttribute("mf"));%></td>
                        </tr>
                        <tr>
                            <td><strong>Dating Age Range:</strong></td>
                            <td><%out.print(request.getAttribute("datingAgeStart"));%>
                                - <%out.print(request.getAttribute("datingAgeEnd"));%></td>
                        </tr>

                        <tr>
                            <td><strong>Dating Geo Range:</strong></td>
                            <td><%out.print(request.getAttribute("datingGeoRange"));%></td>
                        </tr>
                    </table>
                </div>
                <div class="col-ls-2 col-centered">
                    <table class="table table-hover">
                        <tr>
                            <td><strong>Hair color:</strong></td>
                            <td><%out.print(request.getAttribute("hairColor"));%></td>
                        </tr>
                        <tr>
                            <td><strong>Weight:</strong></td>
                            <td><%out.print(request.getAttribute("weight"));%></td>
                        </tr>
                        <tr>
                            <td><strong>Height:</strong></td>
                            <td><%out.print(request.getAttribute("height"));%></td>
                        </tr>

                        <tr>
                            <td><strong>Hobbies:</strong></td>
                            <td><%out.print(request.getAttribute("hobbies"));%></td>
                        </tr>
                    </table>
                </div>
            </div>
            <hr>
            <div class="pull-right">
                <% System.out.println(request.getAttribute("vid") + "   " + session.getAttribute("pid"));%>
                <%if (!(request.getAttribute("vid").equals(session.getAttribute("pid")))) {%>
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                <strong> <a href="profileview.jsp?vid=<%out.print(session.getAttribute("pid")); %>"> My
                    profile </a></strong>
                <%}%>
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
