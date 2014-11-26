<%@ page import="com.java.db.DBConnection" %>
<%--
  Created by IntelliJ IDEA.
  User: sarmeetsingh
  Date: 11/24/14
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% if ((session.getAttribute("d2") == null || session.getAttribute("d2") == "") && (request.getParameter("d2") != null && request.getParameter("d2") != "")) {
    session.setAttribute("d2", request.getParameter("d2"));
    response.sendRedirect("profileview.jsp?vid=" + request.getParameter("d2"));
} else {

    if ((session.getAttribute("d3") == "" || session.getAttribute("d3") == null) && (request.getParameter("d3") != null && request.getParameter("d3") != "")) {
        session.setAttribute("d3", request.getParameter("d3"));
        String d3 = request.getParameter("d3");
        String BlindDateInsertStatement = "Insert into BlindDate values ('" + session.getAttribute("pid") + "','" + session.getAttribute("d2") + "','" + session.getAttribute("d3") + "','" + new java.sql.Date(new java.util.Date().getTime()) + "');";
        System.out.println(BlindDateInsertStatement);
        DBConnection.ExecUpdateQuery(BlindDateInsertStatement);
        session.setAttribute("d2", "");
        session.setAttribute("d3", "");
        response.sendRedirect("profileview.jsp?vid=" + d3);
    }

}

%>


<html>
<head>
    <title></title>
</head>
<body>


</body>
</html>
