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


<% }

%>


<%

    if (session.getAttribute("Role").equals("CustRep")) { %>


html goes here


<% }

%>
</body>
</html>
