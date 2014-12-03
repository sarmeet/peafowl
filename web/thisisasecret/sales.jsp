<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.java.db.DBConnection" %>
<%--
  Created by IntelliJ IDEA.
  User: sarmeetsingh
  Date: 12/3/14
  Time: 12:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 20px;
        }
    </style>
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
    <link href='http://fonts.googleapis.com/css?family=Nixie+One' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../css/main.css">
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <script src="../js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<%--

common in all pages.

--%>

<body>
<div class="container-fluid">
    <div class="row row-centered">
        <div class="col-lg-4 col-md-4 col-sm-10 col-centered translucent-background">
            <%if (request.getParameter("actiontype") == null || request.getParameter("actiontype").equals("")) {%>


            <h3>
                <div class="welcome-text">Welcome to Peafowl Dating's admin</div>
                <div class="index-heading">Admin Login Page</div>
            </h3>
            <div class="text-center">
            </div>
            <form action="sales.jsp" method="POST">
                <input type="hidden" name="actiontype" value="monthlysales">

                <div class="form-group">
                    <label for="month">Select a month</label>
                    <select class="form-control" id="month" name="month">
                        <option value="1">January</option>
                        <option value="2">February</option>
                        <option value="3">March</option>
                        <option value="4">April</option>
                        <option value="5">May</option>
                        <option value="6">June</option>
                        <option value="7">July</option>
                        <option value="8">August</option>
                        <option value="9">September</option>
                        <option value="10">October</option>
                        <option value="11">November</option>
                        <option value="12">December</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-default">Login</button>
            </form>
            <%
                }

                if (request.getParameter("actiontype").equalsIgnoreCase("monthlysales")) {

                    String query = "SELECT D.Date_Time, D.BookingFee, D.Profile1, D.Profile2, P.FirstName " +
                            "AS CustRepFirstName, P.LastName AS CustRepLastName " +
                            "FROM Date D, Person P " +
                            "WHERE Date(D.Date_Time) > '2014-" + request.getParameter("month") + "-30' AND Date(D.Date_Time) < '2014-" + request.getParameter("month") + "-01'AND D.CustRep = P.SSN;";
                    out.print(query);

                    ResultSet rs = DBConnection.ExecQuery(query);
            %>
            <table class="table table-hover">
                <tr>
                    <th>
                        Date
                    </th>
                    <th>
                        Booking Fee
                    </th>
                    <th>
                        Profile 1
                    </th>
                    <th>
                        Profile 2
                    </th>
                    <th>
                        Customer Rep. First Name
                    </th>

                    <th>
                        Customer Rep. Last Name
                    </th>
                </tr>

                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td>
                        <%out.print(rs.getString("Date_Time"));%>
                    </td>
                    <td>

                        <%out.print(rs.getString("BookingFee"));%>
                    </td>
                    <td>

                        <%out.print(rs.getString("Profile1"));%>
                    </td>
                    <td>

                        <%out.print(rs.getString("Profile2"));%>
                    </td>
                    <td>
                        <%out.print(rs.getString("FirstName"));%>
                    </td>
                    <td>

                        <%out.print(rs.getString("LastName"));%>
                    </td>


                </tr>


                <%
                    }
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
