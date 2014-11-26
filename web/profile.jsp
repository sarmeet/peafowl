<%-- 
    Document   : index
    Created on : Nov 13, 2014, 9:58:52 AM
    Author     : sarmeet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("login") == "" || session.getAttribute("login") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Foundation | Welcome</title>
    <link rel="stylesheet" href="./css/foundation.css"/>
    <link rel="stylesheet" href="./css/main.css"/>
    <link href='http://fonts.googleapis.com/css?family=Poiret+One|Josefin+Sans' rel='stylesheet' type='text/css'>
    <script src="js/vendor/modernizr.js"></script>
</head>
<body>
<div class="row" data-equalizer>
    <div class="large-12 columns">
        <div class="row">
            <div class="large-3 medium-3 columns theme-bg" data-equalizer-watch>
                <p><Strong>About </strong></p>

                <div class="large-12 columns">
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                    this is a good boy
                </div>
                hello world
            </div>
            <div class="large-1 medium-1 columns" data-equalizer-watch></div>
            <div class="large-5 medium-5 columns" data-equalizer-watch>
                <div class="theme-bg">
                    <p><strong>Info</strong></p>

                    <div class="large-12 columns">
                        <p><strong>Name: </strong> <%
                            out.print(session.getAttribute("firstName") + " ");
                            out.print(session.getAttribute("lastName"));
                        %>
                            <br>
                            <strong>Age: </strong> <% out.print(session.getAttribute("age")); %>
                            <br>
                            <strong>Dating Range: </strong> <% out.print(session.getAttribute("datingAgeStart")); %>
                            - <% out.print(session.getAttribute("datingAgeEnd")); %>
                            <br>
                            <strong>Sex: </strong> <% out.print(session.getAttribute("mf")); %>
                            <br>
                            <strong>Height: </strong> <% out.print(session.getAttribute("height")); %>
                            <br>
                            <strong>Weight: </strong> <% out.print(session.getAttribute("weight")); %>
                            <br>
                            <strong>Hair Color: </strong> <% out.print(session.getAttribute("hairColor")); %>
                            <br>
                            <strong>Hobbies: </strong> <% out.print(session.getAttribute("hobbies")); %>
                            <br>
                        </p>
                    </div>
                </div>
            </div>
            <div class="large-3 medium-3 columns">
                <p><strong>Related Profiles</strong></p>
            </div>
        </div>
    </div>
</div>
<script src="js/vendor/jquery.js"></script>
<script src="js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>
