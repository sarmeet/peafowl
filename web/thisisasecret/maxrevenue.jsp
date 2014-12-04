<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.java.db.DBConnection" %>
<%--
  Created by IntelliJ IDEA.
  User: sarmeetsingh
  Date: 12/3/14
  Time: 9:27 PM
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
<body>


<div class="container-fluid">
<div class="row row-centered">
<div class="col-lg-10 col-md-10 col-sm-10 col-centered translucent-background">
<%

    String info =
            "SELECT P.* " +
                    "FROM CustRepRevenue C, Person P " +
                    "WHERE TotalRevenue >= (SELECT MAX(TotalRevenue) FROM CustRepRevenue) AND C.SSN = P.SSN;";


    ResultSet rs = DBConnection.ExecQuery(info);

    while (rs.next()) {
%>
<h3>Highest earning customer representative</h3>
<strong>
    Name: <%out.print(rs.getString("FirstName") + " " + rs.getString("LastName"));%> <br>
</strong>


<stong>
    Address: <br>
    <% out.print(rs.getString("Street")); %> <br>

    <% out.print(rs.getString("City")); %> <br>

    <% out.print(rs.getString("State")); %> <br>

    <% out.print(rs.getString("Zipcode")); %> <br>
</stong>


<%
    }

    String maxpayingcustomer = "SELECT P.* " +
            "FROM Person P, CustomerRevenue C " +
            "WHERE C.TotalRevenue >= (SELECT MAX(TotalRevenue) FROM CustomerRevenue) " +
            "AND C.SSN = P.SSN; ";
    ResultSet rs1 = DBConnection.ExecQuery(maxpayingcustomer);

    while (rs1.next()) {
%>
<h3>Highest paying customer:</h3>
<strong>Name: <%out.print(rs1.getString("FirstName") + " " + rs1.getString("LastName"));%></strong> <br>

<stong>
    Address:<br>
    <% out.print(rs1.getString("Street")); %> <br>

    <% out.print(rs1.getString("City")); %> <br>

    <% out.print(rs1.getString("State")); %> <br>

    <% out.print(rs1.getString("Zipcode")); %> <br>
</stong>

<%
    }

%>

<%

    String MostActiveCustomer =
            "SELECT P.* " +
                    "FROM Person P, CustomerActivity C " +
                    "WHERE C.NumberOfDates >= (SELECT MAX(NumberOfDates) FROM CustomerActivity) " +
                    "AND C.SSN = P.SSN;";

    ResultSet rs2 = DBConnection.ExecQuery(MostActiveCustomer);


    while (rs2.next()) {
%>
<h3>Most Active Customer(Dates):</h3>
<strong>Name: <%out.print(rs2.getString("FirstName") + " " + rs2.getString("LastName"));%></strong> <br>

<stong>
    Address:<br>
    <% out.print(rs2.getString("Street")); %> <br>

    <% out.print(rs2.getString("City")); %> <br>

    <% out.print(rs2.getString("State")); %> <br>

    <% out.print(rs2.getString("Zipcode")); %> <br>
</stong>

<%
    }

%>
<%

    String mostActivePerson = "SELECT P.* " +
            "FROM Person P, User U " +
            "WHERE U.SSN = P.SSN AND Date(U.DateOfLastAct) >= (SELECT MAX(Date(DateOfLastAct)) FROM User);";

    ResultSet rs4 = DBConnection.ExecQuery(MostActiveCustomer);


    while (rs4.next()) {
%>
<h3>Most Active Customer(Login):</h3>
<strong>Name: <%out.print(rs4.getString("FirstName") + " " + rs4.getString("LastName"));%></strong> <br>

<stong>
    Address:<br>
    <% out.print(rs4.getString("Street")); %> <br>

    <% out.print(rs4.getString("City")); %> <br>

    <% out.print(rs4.getString("State")); %> <br>

    <% out.print(rs4.getString("Zipcode")); %> <br>
</stong>

<%
    }

%>

<%

    String MostLikingPerson = "SELECT P.* " +
            "FROM Person P, CustomerLikeActivity C " +
            "WHERE C.NumberOfLikes >= (SELECT MAX(NumberOfLikes) FROM CustomerLikeActivity) " +
            "    AND C.SSN = P.SSN; ";
    ResultSet rs3 = DBConnection.ExecQuery(MostLikingPerson);


    while (rs3.next()) {
%>
<h3>Most Liking Customer:</h3>
<strong>Name: <%out.print(rs3.getString("FirstName") + " " + rs3.getString("LastName"));%></strong> <br>

<stong>
    Address:<br>
    <% out.print(rs3.getString("Street")); %> <br>

    <% out.print(rs3.getString("City")); %> <br>

    <% out.print(rs3.getString("State")); %> <br>

    <% out.print(rs3.getString("Zipcode")); %> <br>
</stong>

<%
    }

%>

<%

    String HighestRatedCustomer = "SELECT P.* " +
            "FROM User U, Person P " +
            "WHERE U.Rating >= (SELECT MAX(User.Rating) FROM User) AND U.SSN = P.SSN;";

    ResultSet rs5 = DBConnection.ExecQuery(HighestRatedCustomer);


    while (rs5.next()) {
%>
<h3>Highest Rated Customer:</h3>
<strong>Name: <%out.print(rs5.getString("FirstName") + " " + rs5.getString("LastName"));%></strong> <br>

<stong>
    Address:<br>
    <% out.print(rs5.getString("Street")); %> <br>

    <% out.print(rs5.getString("City")); %> <br>

    <% out.print(rs5.getString("State")); %> <br>

    <% out.print(rs5.getString("Zipcode")); %> <br>
</stong>

<%
    }

%>
<%

    String HighestRatedCalendarDate = "SELECT DR.Date, DR.Rating " +
            "FROM DateRating DR " +
            "WHERE DR.Rating >= (SELECT MAX(DateRating.Rating) FROM DateRating); ";
    ResultSet rs6 = DBConnection.ExecQuery(HighestRatedCalendarDate);


    while (rs6.next()) {
%>
<h3>Highest Rated Calendar Date:</h3>

<stong>
    Date:<br>
    <% out.print(rs6.getString("Date")); %> <br>

</stong>

<%
    }

%></div>
</div>
</div>

</body>


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
