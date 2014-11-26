<%@ page import="com.java.db.DBConnection" %>
<%--
  Created by IntelliJ IDEA.
  User: sarmeet
  Date: 11/24/14
  Time: 11:46 AM
  To change this template use File | Settings | File Templates.

  pname = profile name
  vid = profile name / profileid in database
  ===
  date referal system:

  d2 = date pair 1
  d3 = date pair 2





--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    if (request.getParameter("vid") != null && request.getParameter("vid") != "") {


        try {

            String profileViewQuery = "select * from Profile where ProfileID='" + request.getParameter("vid") + "';";
            System.out.println(profileViewQuery);
            java.sql.ResultSet profiles = DBConnection.ExecQuery(profileViewQuery);

            if (profiles.next()) {
                request.setAttribute("pname", profiles.getString("ProfileID"));
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


            } else {
                response.sendRedirect("profile.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("profile.jsp");

        }
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
                    <br>
                    <a href=like.jsp?vid=<%out.print(request.getParameter("vid"));%>  >Like</a><br>
                    <% if (session.getAttribute("d2") == "" || session.getAttribute("d2") == null) { %>
                    <a href="date.jsp?d2=<%out.print(request.getParameter("vid"));%>">Refer a date</a>
                    <%
                    } else {
                        if (!session.getAttribute("d2").equals(request.getParameter("vid"))) {
                    %>

                    <a href="date.jsp?d3=<%out.print(request.getParameter("vid"));%>">Refer as a date to <%
                        out.print(session.getAttribute("d2"));%></a>
                    <% }
                    }%>


                </div>
            </div>
            <div class="large-1 medium-1 columns" data-equalizer-watch></div>
            <div class="large-5 medium-5 columns" data-equalizer-watch>
                <div class="theme-bg">
                    <p><strong>Info</strong></p>

                    <div class="large-12 columns">
                        <p><strong>Name: </strong> <% out.print(request.getAttribute("pname")); %>
                            <br>
                            <strong>Age: </strong> <% out.print(request.getAttribute("age")); %>
                            <br>
                            <strong>Dating Range: </strong> <% out.print(request.getAttribute("datingAgeStart")); %>
                            - <% out.print(request.getAttribute("datingAgeEnd")); %>
                            <br>
                            <strong>Sex: </strong> <% out.print(request.getAttribute("mf")); %>
                            <br>
                            <strong>Height: </strong> <% out.print(request.getAttribute("height")); %>
                            <br>
                            <strong>Weight: </strong> <% out.print(request.getAttribute("weight")); %>
                            <br>
                            <strong>
                                <Hair></Hair>
                                Color: </strong> <% out.print(request.getAttribute("hairColor")); %>
                            <br>
                            <strong>Hobbies: </strong> <% out.print(request.getAttribute("hobbies")); %>
                            <br>
                        </p>
                    </div>
                </div>
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