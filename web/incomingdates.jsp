<%@page import="com.java.db.DBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%
    java.sql.ResultSet profiles;

    if (request.getParameter("actiontype").equalsIgnoreCase("login") && request.getParameter("multi") == null) {

        String email = request.getParameter("email");
        String userpasswd = request.getParameter("password");
        String query = null;
        if ((email != null) && (userpasswd != null)) {
            if (email.trim().equals("") || userpasswd.trim().equals("")) {
                request.setAttribute("message", "Username or password not present");
                response.sendRedirect("index.jsp");
            } else {
                query = "SELECT * FROM Person WHERE Email = '"
                        + email + "' AND Password = '" + userpasswd + "'";
                java.sql.ResultSet rs = DBConnection.ExecQuery(query);

                if (rs.next()) {
                    session.setAttribute("login", "true");
                    session.setAttribute("ssn", rs.getString("SSN"));
                    session.setAttribute("email", email);
                    session.setAttribute("firstName", rs.getString("FirstName"));
                    session.setAttribute("lastName", rs.getString("LastName"));
                    String Pquery = "SELECT * FROM Profile WHERE OwnerSSN = '"
                            + rs.getString("SSN") + "'";
                    profiles = DBConnection.ExecQuery(Pquery);


                    if (profiles.getFetchSize() > 0) {
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

<body>


<div class="container-fluid">
    <div class="row row-centered">
        <div class="col-lg-8 col-md-8 col-sm-10 col-centered translucent-background">

            <h3>You have multiple Profiles</h3>
            Please select the one you want to use.

            <%while (profiles.next()) {%>

            <a href="login.jsp?actiontype=loginmulti=True&&pid=<%out.print(profiles.getString("ProfileID"));%>">
                <button type="button" class="btn btn-info btn-lg"><%
                    out.print(profiles.getString("ProfileID"));%></button>
            </a>


            <%}%>
        </div>
    </div>
</div>


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


<%
                    } else {
                        if (profiles.next()) {
                            session.setAttribute("pid", profiles.getString("ProfileID"));
                            session.setAttribute("age", profiles.getInt("Age"));
                            session.setAttribute("datingAgeStart", profiles.getInt("DatingAgeRangeStart"));
                            session.setAttribute("datingAgeEnd", profiles.getInt("DatingAgeRangeEnd"));
                            session.setAttribute("datingGeoRange", profiles.getInt("DatinGeoRange"));
                            session.setAttribute("mf", profiles.getString("M_F"));
                            session.setAttribute("hobbies", profiles.getString("Hobbies"));
                            session.setAttribute("weight", profiles.getInt("Weight"));
                            session.setAttribute("height", profiles.getFloat("Height"));
                            session.setAttribute("creationDate", profiles.getDate("CreationDate"));
                            session.setAttribute("updateDate", profiles.getDate("LastModDate"));
                            session.setAttribute("hairColor", profiles.getString("HairColor"));
                            response.sendRedirect("profileview.jsp?vid=" + session.getAttribute("pid"));

                        } else {
                            request.setAttribute("message", "Unable to get profile");
                            session.setAttribute("login", "");
                            response.sendRedirect("index.jsp");
                        }

                    }
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
        }
    }

    if (request.getParameter("actiontype").equalsIgnoreCase("login") && request.getParameter("multi").equalsIgnoreCase("true")) {


        String Profile = "select * from Profile where ProfileID='" + request.getParameter("pid") + "';";
        profiles = DBConnection.ExecQuery(Profile);

        if (profiles.next()) {
            session.setAttribute("pid", profiles.getString("ProfileID"));
            session.setAttribute("age", profiles.getInt("Age"));
            session.setAttribute("datingAgeStart", profiles.getInt("DatingAgeRangeStart"));
            session.setAttribute("datingAgeEnd", profiles.getInt("DatingAgeRangeEnd"));
            session.setAttribute("datingGeoRange", profiles.getInt("DatinGeoRange"));
            session.setAttribute("mf", profiles.getString("M_F"));
            session.setAttribute("hobbies", profiles.getString("Hobbies"));
            session.setAttribute("weight", profiles.getInt("Weight"));
            session.setAttribute("height", profiles.getFloat("Height"));
            session.setAttribute("creationDate", profiles.getDate("CreationDate"));
            session.setAttribute("updateDate", profiles.getDate("LastModDate"));
            session.setAttribute("hairColor", profiles.getString("HairColor"));
            response.sendRedirect("profileview.jsp?vid=" + session.getAttribute("pid"));

        } else {
            request.setAttribute("message", "Unable to get profile");
            session.setAttribute("login", "");
            response.sendRedirect("index.jsp");
        }


    }


%>