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

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->

<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
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

    <script src="../js/jquery-2.1.1.js"></script>

    <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css">
    <link href='http://fonts.googleapis.com/css?family=Nixie+One' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../css/main.css">
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <script src="../js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="../js/moment.js"></script>
    <script src="../js/bootstrap-datetimepicker.js"></script>


</head>


<%--

common in all pages.

--%>

<body>
<div class="container-fluid">
    <div class="row row-centered">
        <div class="col-lg-10 col-md-10 col-sm-10 col-centered translucent-background">

            <%
                if (request.getParameter("actiontype") != null && request.getParameter("actiontype").equals("date")) {
                    int total = 0;

                    String query = "SELECT D.Date_Time,D.BookingFee, D.Profile1, D.Profile2, D.Location, P.FirstName AS " +
                            "CustRepFirstName, P.LastName AS CustRepLastName " +
                            "FROM Date D, Person P " +
                            "WHERE D.Date_Time >= '" + request.getParameter("datetime") + " 00:00:00' AND D.Date_Time <= '" + request.getParameter("datetime") + " 23:59:59' AND D.CustRep = P.SSN;";
                    System.out.println(query);
                    ResultSet rs = DBConnection.ExecQuery(query);
            %>
            <table class="table table-hover">
                <tr>
                    <th>
                        Date
                    </th>
                    <th>
                        Fee($)
                    </th>
                    <th>
                        Profile 1
                    </th>
                    <th>
                        Profile 2
                    </th>
                    <th>
                        Location
                    </th>
                    <th>
                        Customer Rep. Name
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
                        <%
                            out.print(rs.getString("BookingFee"));
                            total += Integer.parseInt(rs.getString("BookingFee"));
                        %>

                    </td>
                    <td>
                        <%out.print(rs.getString("Profile1"));%>
                    </td>
                    <td>
                        <%out.print(rs.getString("Profile2"));%>
                    </td>
                    <td>
                        <%out.print(rs.getString("Location"));%>
                    </td>
                    <td>
                        <%out.print(rs.getString("CustRepFirstName") + " ");%>
                        <%out.print(rs.getString("CustRepLastName"));%>
                    </td>
                </tr>
                <%
                    }%>
                <tr>
                    <th>
                        Total
                    </th>
                    <td><%out.print(total);%></td>
                </tr>

                <%}%>
            </table>


            <%if (request.getParameter("actiontype") == null) {%>

            <form action="salesbycalendardate.jsp" method="POST">
                <input type="hidden" name="actiontype" value="date">

                <div class="form-group">
                    <label for="datetimepicker1">Data and Time</label>

                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' name=datetime class="form-control" data-date-format="YYYY/MM/DD"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function () {

                        $('#datetimepicker1').datetimepicker({

                            pick12HourFormat: false
                        });
                    });
                </script>
                <button type="submit" class="btn btn-default">Login</button>
            </form>


            <%}%>


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
<script src="../js/vendor/bootstrap.min.js"></script>

<script src="../js/plugins.js"></script>
<script src="../js/main.js"></script>

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
