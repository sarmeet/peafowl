<%@ page import="com.java.db.DBConnection" %>
<%--
  Created by IntelliJ IDEA.
  User: sarmeetsingh
  Date: 12/2/14
  Time: 11:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    // add an employee [Requires SSN, Role, StartDate, HourlyRate]
    if(request.getParameter("actiontype").equals("addEmployee")){
        String addEmployee= "Insert into Employee values('"+request.getAttribute("ssn")+"','"+request.getAttribute("role")+"','"+request.getAttribute("startdate")+"',"+request.getAttribute("hourlyrate")+"';";
        System.out.println(addEmployee);
        DBConnection.ExecUpdateQuery(addEmployee);
        response.sendRedirect("adminhome.jsp");
    }

    // delete an employee [ Requires a SSN ]
    if(request.getParameter("actiontype").equals("deleteEmployee")){
        String deleteEmployee="Remove from Employee where SSN='"+request.getAttribute("ssn")+"';";
        System.out.println(deleteEmployee);
        DBConnection.ExecUpdateQuery(deleteEmployee);
        response.sendRedirect("adminhome.jsp");
    }

    //Edit Employee
    if(request.getParameter("actiontype").equals("editEmployee")){
        StringBuffer sb= new StringBuffer();
        sb.append("Update Employee E set ");
        if(request.getParameter("role")!= null && request.getParameter("role")!=""){
            sb.append("E.Role ='"+request.getParameter("role")+"',");
        }
        if(request.getParameter("hourlyrate")!=null && request.getParameter("hourlyrate")!=""){
            sb.append("E.HourlyRate= ");
            sb.append(request.getParameter("hourlyrate"));
        }
        sb.append("where E.SSN='"+request.getParameter("ssn")+"';");

        System.out.println(sb.toString());
        DBConnection.ExecUpdateQuery(sb.toString());

    }

    // Sales report for a month



%>

