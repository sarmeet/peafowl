<%--
  Created by IntelliJ IDEA.
  User: sarmeetsingh
  Date: 12/2/14
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%

    if (session.getAttribute("Role").equals("Manager")) { %>

Determine which customer representative generated most total revenue
Determine which customer generated most total revenue
Produce a list of most active customers
Produce a list of all customers who have dated a particular customer
Produce a list of the highest-rated customers
Produce a list of the highest-rated calendar dates to have a date on


<% }

%>


<%

    if (session.getAttribute("Role").equals("CustRep")) { %>


html goes here


<% }

%>
</body>
</html>
