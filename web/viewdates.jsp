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
    if (!session.getAttribute("login").equals("true")) {
        response.sendRedirect("index.jsp");
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
<%

    String getSuggestedTo = "select * from BlindDate where ProfileB='" + session.getAttribute("pid") + "';";
    String getReceivedDates = "select * from Date where Profile2='" + session.getAttribute("pid") + "';";
    String getSuggestedDates = "select * from BlindDate where profileC='" + session.getAttribute("pid") + "';";
    String getSentDates = "select * from Date where Profile1='" + session.getAttribute("pid") + "';";
    System.out.println(getSuggestedTo);
    System.out.println(getReceivedDates);
    System.out.println(getSuggestedDates);
    System.out.println(getSentDates);

    ResultSet gst = DBConnection.ExecQuery(getSuggestedTo);
    ResultSet grd = DBConnection.ExecQuery(getReceivedDates);
    ResultSet gsud = DBConnection.ExecQuery(getSuggestedDates);
    ResultSet gsd = DBConnection.ExecQuery(getSentDates);


%>
<div class="container-fluid">
    <div class="row row-centered">
        <div class="col-lg-8 col-md-8 col-sm-10 col-centered translucent-background">
            <ul class="nav nav-tabs" role="tablist" id="myTab">
                <li role="presentation" class="active"><a href="#incomingrequests" aria-controls="incomingrequests"
                                                          role="tab" data-toggle="tab">Incoming Date Requests</a></li>
                <li role="presentation"><a href="#sentrequests" aria-controls="Sent Requests" role="tab"
                                           data-toggle="tab">Requested Dates</a></li>
                <li role="presentation"><a href="#ongoinddates" aria-controls="ongoingdates" role="tab"
                                           data-toggle="tab">Ongoing Dates</a></li>
                <li role="presentation"><a href="#pastdates" aria-controls="pastdates" role="tab"
                                           data-toggle="tab">Past Dates</a></li>
            </ul>

            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="incomingrequests">

                    <h3>Incoming Suggestions</h3>

                    <table class="table table-hover">

                        <tr>
                            <th>
                                Name
                            </th>
                            <th>
                                Suggested By
                            </th>
                            <th>
                                Accept
                            </th>

                            <th>
                                Reject
                            </th>
                        </tr>
                        <%
                            while (gst.next()) {
                        %>
                        <tr>
                            <td>
                                <a href=profileview.jsp?vid=<%out.print(gst.getString("ProfileC"));%>><%
                                    out.print(gst.getString("ProfileC"));%></a>
                            </td>
                            <td>
                                <a href=profileview.jsp?vid=<%out.print(gst.getString("ProfileA"));%>><%
                                    out.print(gst.getString("ProfileA"));%></a>
                            </td>
                            <td>
                                <a href=date.jsp?ref=suggested&&askdate=<%out.print(gst.getString("ProfileC"));%>>
                                    <button type="button" class="btn btn-success">Accept Date</button>
                                </a>
                            </td>
                            <td>
                                <a href=date.jsp?cancel=true&&DateType=gotsuggested&&dateWith=<%
                                    out.print(gst.getString("ProfileC"));%>>
                                    <button type="button" class="btn btn-danger">Delete Date</button>
                                </a>
                            </td>

                        </tr>


                        <%
                            }
                        %>
                    </table>

                    <h3>Incoming Date Requests</h3>

                    <table class="table table-hover">

                        <tr>
                            <th>
                                Request From
                            </th>
                            <th>
                                Asked On
                            </th>
                            <th>
                                Accept
                            </th>

                            <th>
                                Reject
                            </th>
                        </tr>
                        <%
                            while (grd.next()) {
                        %>
                        <tr>
                            <td>
                                <a href=profileview.jsp?vid=<%out.print(grd.getString("Profile1"));%>><%
                                    out.print(grd.getString("Profile1"));%></a>
                            </td>
                            <td>
                                <%out.print(grd.getString("Date_Time"));%>
                            </td>
                            <td>

                                <%if (grd.getString("CustRep") != null && grd.getString("CustRep").equalsIgnoreCase("000-00-0000")) {%>

                                <button type="button" class="btn btn-success" disabled>Date Accepted</button>


                                <% } else {%>
                                <a href=date.jsp?AcceptDate=<%out.print(grd.getString("Profile1"));%>>
                                    <button type="button" class="btn btn-success">Accept Date</button>
                                </a>
                                <% }%>
                            </td>
                            <td>
                                <a href=date.jsp?CancelDate=true&&DateType=received&&dateWith=<%
                                    out.print(grd.getString("Profile1"));%>>
                                    <button type="button" class="btn btn-danger">Delete Date</button>
                                </a>
                            </td>

                        </tr>

                        <%
                            }
                        %>
                    </table>


                </div>
                <div role="tabpanel" class="tab-pane" id="sentrequests">


                    <h3>Suggested To
                        <small>(you cannot accept these)</small>
                    </h3>

                    <table class="table table-hover">

                        <tr>
                            <th>
                                Name
                            </th>
                            <th>
                                Suggested By
                            </th>

                            <th>
                                Reject
                            </th>
                        </tr>
                        <%
                            while (gsud.next()) {
                        %>
                        <tr>
                            <td>
                                <a href=profileview.jsp?vid=<%out.print(gsud.getString("ProfileB"));%>><%
                                    out.print(gsud.getString("ProfileB"));%></a>
                            </td>
                            <td>
                                <a href=profileview.jsp?vid=<%out.print(gsud.getString("ProfileA"));%>><%
                                    out.print(gsud.getString("ProfileA"));%></a>
                            </td>
                            <td>
                                <a href=date.jsp?cancel=true&&DateType=suggestedTo&&dateWith=<%
                                    out.print(gsud.getString("ProfileB"));%>>
                                    <button type="button" class="btn btn-danger">Delete Date</button>
                                </a>
                            </td>

                        </tr>


                        <%
                            }
                        %>
                    </table>

                    <h3>Asked Dates</h3>

                    <table class="table table-hover">

                        <tr>
                            <th>
                                Requested To
                            </th>
                            <th>
                                Asked On
                            </th>

                            <th>
                                Reject
                            </th>
                        </tr>
                        <%
                            while (gsd.next()) {
                        %>
                        <tr>
                            <td>
                                <a href=profileview.jsp?vid=<%out.print(gsd.getString("Profile2"));%>><%
                                    out.print(gsd.getString("Profile2"));%></a>
                            </td>
                            <td>
                                <%out.print(gsd.getString("Date_Time"));%>

                                <% if (gsd.getString("CustRep") != null && gsd.getString("CustRep").equals("000-00-0000")) { %>
                                <a href=updatedate.jsp?dateWith=<%out.print(gsd.getString("Profile2"));%>>
                                    <button type="button" class="btn btn-info">Action Required</button>
                                </a>

                                <%
                                    }
                                %>
                            </td>
                            <td>
                                <a href=date.jsp?CancelDate=true&&DateType=requested&&dateWith=<%
                                    out.print(gsd.getString("Profile2"));%>>
                                    <button type="button" class="btn btn-danger">Delete Date</button>
                                </a>
                            </td>

                        </tr>

                        <%
                            }
                        %>
                    </table>


                </div>
                <div role="tabpanel" class="tab-pane" id="ongoingdates">...</div>
                <div role="tabpanel" class="tab-pane" id="pastdates">...</div>

            </div>

            <script>
                $(function () {
                    $('#myTab a:last').tab('show')
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
