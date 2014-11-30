<%@page import="com.java.db.DBConnection" %>
<%

    if (request.getParameter("actiontype").equalsIgnoreCase("login")) {

        String email = request.getParameter("email");
        String userpasswd = request.getParameter("password");
        String query = null;
        System.out.println("i am here");
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
                    java.sql.ResultSet profiles = DBConnection.ExecQuery(Pquery);
                    System.out.println(profiles.getFetchSize());
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
                } else {
                    request.setAttribute("message", "Username or password combination not correct");
                    response.sendRedirect("index.jsp");
                }
            }
        }

    } else {
        session.setAttribute("message", "Something went wrong. Please try again");
        response.sendRedirect("index.jsp");
    }

%>