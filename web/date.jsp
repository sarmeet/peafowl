<%@ page import="com.java.db.DBConnection" %>
<%@ page import="java.sql.ResultSet" %>
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

    if (request.getParameter("askdate") != "" && request.getParameter("askdate") != null) {
        // check if the user has an associated credit card to charge payment
        String checkAccountquery = "select * from Account where OwnerSSN='" + session.getAttribute("ssn") + "';";
        ResultSet rs = DBConnection.ExecQuery(checkAccountquery);

        if (rs.next())
        // if the user has an associated card, allow him to add the date.
        {
            String addDate = "Insert into Date(Profile1,Profile2,Date_Time) values('" + session.getAttribute("pid") + "','" + request.getParameter("askdate") + "','" + new java.sql.Date(new java.util.Date().getTime()) + "');";
            System.out.print(addDate);
            DBConnection.ExecUpdateQuery(addDate);
            response.sendRedirect("profileview.jsp?vid=" + request.getParameter("askdate"));
        } else {
            response.sendRedirect("addaccount.jsp?askdate=" + request.getParameter("askdate"));
        }
    }


    if (request.getParameter("cancel") != null) {
        if (request.getParameter("cancel").equalsIgnoreCase("true")) {
            String delete_Blind_date = null;
            if (request.getParameter("DateType").equalsIgnoreCase("gotsuggested")) {
                delete_Blind_date = "DELETE FROM BlindDate WHERE ProfileC = '" + request.getParameter("dateWith") + "' AND ProfileB = '" + session.getAttribute("pid") + "';";

            }
            if (request.getParameter("DateType").equalsIgnoreCase("suggestedto")) {
                delete_Blind_date = "DELETE FROM BlindDate WHERE ProfileC = '" + session.getAttribute("pid") + "' AND ProfileB = '" + request.getParameter("dateWith") + "';";

            }


            DBConnection.ExecUpdateQuery(delete_Blind_date);
            response.sendRedirect("viewdates.jsp");
        }
    }

    if (request.getParameter("CancelDate") != null) {
        if (request.getParameter("CancelDate").equalsIgnoreCase("true")) {
            if (request.getParameter("DateType").equalsIgnoreCase("requested")) {

                // remove requested dates
                String delete_date = "delete from Date where Profile1 ='" + session.getAttribute("pid") + "' and Profile2='" + request.getParameter("dateWith") + "';";
                System.out.println(delete_date);
                DBConnection.ExecUpdateQuery(delete_date);
                response.sendRedirect("viewdates.jsp");

            }
            if (request.getParameter("DateType").equalsIgnoreCase("received")) {
                String delete_date = "delete from Date where Profile2 ='" + session.getAttribute("pid") + "' and Profile1='" + request.getParameter("dateWith") + "';";
                System.out.println(delete_date);
                DBConnection.ExecUpdateQuery(delete_date);
                response.sendRedirect("viewdates.jsp");
            }
        }
    }

    if (request.getParameter("AcceptDate") != "" && request.getParameter("AcceptDate") != null) {
        String MarkAccepted = "UPDATE Date SET CustRep ='000-00-0000' where Profile1='" + request.getParameter("AcceptDate") + "' and Profile2='" + session.getAttribute("pid") + "';";
        System.out.println(MarkAccepted);
        DBConnection.ExecUpdateQuery(MarkAccepted);
        response.sendRedirect("viewdates.jsp");
    }

    if (request.getParameter("actiontype") != null && request.getParameter("actiontype").equalsIgnoreCase("update_date")) {
        String update_date_query = "Update Date Set Location='"
                + request.getParameter("location") + "', Date_Time='"
                + request.getParameter("datetime") + "', BookingFee="
                + request.getParameter("fee") + ", Comments='"
                + request.getParameter("comments") + "', User1Rating="
                + request.getParameter("ratings1") + " where Profile1='"
                + session.getAttribute("pid") + "' and Profile2='" +
                request.getParameter("dateWith") + "';";

        System.out.println(update_date_query);
        DBConnection.ExecUpdateQuery(update_date_query);
        response.sendRedirect("viewdates.jsp");

    }

%>