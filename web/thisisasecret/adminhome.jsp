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
        <div class="col-lg-8 col-md-8 col-sm-10 col-centered translucent-background">
                <%

    if (session.getAttribute("role").equals("Manager")) { %>
            <h3>Please select a manager action:</h3>

            <div class="pull-right">
                Hello, <%out.print(session.getAttribute("fn"));%> || <a href="adminlogout.jsp">Logout</a>
            </div>
            <hr>


            <br>
            <a href="datebydate.jsp">
                <button type="button" class="btn btn-primary btn-xs">Date by Calender Date</button>
                <br>
            </a> <br>
            <a href="datebyname.jsp">
                <button type="button" class="btn btn-primary btn-xs">Date by name</button>
                <br>
            </a> <br>
            <a href="dateforparticularcustomer.jsp">
                <button type="button" class="btn btn-primary btn-xs">Date by Customer</button>
                <br>
            </a> <br>
            <a href="maxrevenue.jsp">
                <button type="button" class="btn btn-primary btn-xs">Highest stats</button>
                <br>
            </a> <br>
            <a href="monthlysales.jsp">
                <button type="button" class="btn btn-primary btn-xs">Sales By the Month</button>
                <br>
            </a> <br>
            <a href="salesbycalendardate.jsp">
                <button type="button" class="btn btn-primary btn-xs">Sales by calendar date</button>
                <br>
            </a> <br>

            <a href="userlist.jsp">
                <button type="button" class="btn btn-primary btn-xs">List of Users</button>
                <br>
            </a> <br>

                <% }

%>


<%

    if (session.getAttribute("role").equals("CustRep")) { %>


html goes here


<% }

%>
</body>
</html>
