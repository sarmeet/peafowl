<%@ page import="com.java.db.DBConnection" %>
<%--
  Created by IntelliJ IDEA.
  User: sarmeet
  Date: 11/24/14
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
</head>
<body>


<%
    if (session.getAttribute("login") == "true") {
        String search = null;
        String sex = (String) session.getAttribute("mf");
        if (sex.equalsIgnoreCase("Male")) {
            search = "select * from Profile where M_F = 'Female';";
        }

        if (sex.equalsIgnoreCase("Female")) {
            search = "select * from Profile where M_F = 'Male';";
        }
        java.sql.ResultSet rs = DBConnection.ExecQuery(search);

        while (rs.next()) {
%>
<hr>

<a href=profileview.jsp?vid=<%out.print(rs.getString("ProfileID"));%>><%out.print(rs.getString("ProfileID"));%></a>

<%
        }
    }

%>


</body>
</html>
