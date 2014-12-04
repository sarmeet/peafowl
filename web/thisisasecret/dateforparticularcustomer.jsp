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

    try {
        if (request.getParameter("actiontype") != null && request.getParameter("actiontype").equalsIgnoreCase("adminlogin")) {
            String adminLoginQuery = "select P.SSN, P.FirstName from Person P where P.Email='" + request.getParameter("email") + "' and P.Password='" + request.getParameter("password") + "';";
            System.out.println(adminLoginQuery);
            ResultSet resultSet = DBConnection.ExecQuery(adminLoginQuery);
            if (resultSet.next()) {
                String EmployeeQuery = "select * from Employee E where E.SSN='" + resultSet.getString("SSN") + "';";
                System.out.println(EmployeeQuery);
                ResultSet EP = DBConnection.ExecQuery(EmployeeQuery);

                if (EP.next()) {
                    session.setAttribute("admin", "true");
                    session.setAttribute("ssn", resultSet.getString("SSN"));
                    session.setAttribute("fn", resultSet.getString("FirstName"));
                    session.setAttribute("role", EP.getString("Role"));
                    response.sendRedirect("adminhome.jsp");


                } else {
                    response.sendRedirect("adminindex.jsp");
                }
            }
        }
    } catch (Exception e) {
        response.sendRedirect("adminindex.jsp");
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


            <div class="text-center">
            </div>
            <form action="dateforparticularcustomer.jsp" method="POST">
                <input type="hidden" name="actiontype" value="datebyname">

                <div class="form-group">
                    <label for="person">Select a Person</label>
                    <%
                        String query = "Select * from Person";

                        ResultSet rs = DBConnection.ExecQuery(query);
                    %>
                    <select class="form-control" id="person" name="person">
                        <%while (rs.next()) {%>
                        <option value="<%out.print(rs.getString("FirstName") + " " + rs.getString("LastName"));%>"><%
                            out.print(rs.getString("FirstName") + " " + rs.getString("LastName"));%></option>
                        <%}%>
                    </select>
                </div>
                <button type="submit" class="btn btn-default">Search</button>
            </form>
            <%

                if (request.getParameter("actiontype") != null && request.getParameter("actiontype").equalsIgnoreCase("datebyname")) {
                    String name = request.getParameter("person");
                    String[] namearr = name.split(" ");
                    String start = "START TRANSACTION;";
                    DBConnection.ExecQuery(start);

                    String view = "CREATE VIEW DatePair(FirstName1, LastName1, FirstName2, LastName2) AS " +
                            "SELECT P1.FirstName, P1.LastName , P2.FirstName , P2.Lastname  " +
                            "FROM Date D, Profile PE1, Profile PE2, Person P1, Person P2 " +
                            "WHERE D.Profile1 = PE1.ProfileID AND D.Profile2 = PE2.ProfileID  " +
                            "    AND PE1.OwnerSSN = P1.SSN AND PE2.OwnerSSN = P2.SSN;";
                    DBConnection.ExecQuery(view);

                    String Query = "SELECT DISTINCT DP.FirstName1 AS FirstName, DP.LastName1 AS LastName " +
                            "FROM DatePair DP " +
                            "WHERE DP.FirstName2 = 'Malachi' AND DP.LastName2 = 'Vazquez' " +
                            "UNION DISTINCT " +
                            "SELECT DISTINCT DP.FirstName2 AS FirstName, DP.LastName2 AS LastName " +
                            "FROM DatePair DP " +
                            "WHERE DP.FirstName1 = '" + namearr[0] + "' AND DP.LastName1 = '" + namearr[1] + "'; ";

                    ResultSet rs1 = DBConnection.ExecQuery(Query);
            %>
            <h3>People who have Dates <%out.print(request.getParameter("person"));%></h3>
            <table class="table table-hover">
                <tr>
                    <th>
                        First Name
                    </th>
                    <th>
                        Last Name
                    </th>
                </tr>

                <%
                    while (rs1.next()) {
                %>
                <tr>
                    <td>
                        <%out.print(rs1.getString("FirstName"));%>
                    </td>
                    <td>
                        <%out.print(rs1.getString("LastName"));%>
                    </td>
                </tr>


                <%
                        }
                    }%>
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
