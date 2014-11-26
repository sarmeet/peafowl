<%@ page import="com.java.db.DBConnection" %>
<%--
  Created by IntelliJ IDEA.
  User: sarmeet
  Date: 11/24/14
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (request.getParameter("vid") != "" || request.getParameter("vid") != null) {
        String likeQuery = "insert into Likes values ('" + session.getAttribute("pid") + "','" + request.getParameter("vid") + "','" + new java.sql.Date(new java.util.Date().getTime()) + "');";
        System.out.println(likeQuery);
        DBConnection.ExecUpdateQuery(likeQuery);
        response.sendRedirect("profileview.jsp?vid=" + request.getParameter("vid"));
    }


%>



