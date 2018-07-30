<%-- 
    Document   : index
    Created on : Jul 29, 2018, 9:32:42 PM
    Author     : MOBASSIR
--%>

<%@page import = "java.sql.*" %>
<%@page import = "java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserting Data Into A DB</title>
    </head>
    <body onLoad="displayResults()">
        <h1>Inserting Data Into A DB</h1>
        <%!
            public class Actor {

                String URL = "jdbc:mysql://localhost:3306/test";
                String USERNAME = "root";
                String PASSWORD = "root";

                Connection connection = null;
                PreparedStatement insertActors = null;

                public Actor() {

                    try {

                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertActors = connection.prepareStatement(
                                "INSERT INTO actor (first_name,last_name,last_update)"
                                + "VALUES (?, ?, ?)");


                        /*                  
selectActors = connection.prepareStatement(
                     "SELECT a.first_name, a.last_name, c.title"
                      + "FROM actor a, film_actor b, film c"
                      + "WHERE a.first_name = ?"
                      + "AND a.last_name = ?"
                      + "AND a.actor_id = b.actor_id"
                      + "AND b.film_id = c.film_id");
public ResultSet getActors(String first, String last){
      try{
     selectActors.setString(1, first);
     selectActors.setString(2, last);
     resultSet = selectActors.executeQuery();
}   } catch (SQLException e){
       e.printStackTrace();
}

return resultSet;
}  
                         */
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public int setActors(String first, String last, Timestamp timestamp) {

                    int result = 0;
                    try {
                        insertActors.setString(1, first);
                        insertActors.setString(2, last);
                        insertActors.setTimestamp(3, timestamp);
                        result = insertActors.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;

                }

            }
        %>

        <%
            int result = 0;

            if (request.getParameter("submit") != null) {
                String firstName = ""; 
                String lastName = "";

                if (request.getParameter("first") != null) {
                    firstName = request.getParameter("first");

                }
                if (request.getParameter("last") != null) {
                    lastName = request.getParameter("last");
                }

                Date date = new Date();
                Timestamp timeStamp = new Timestamp(date.getTime());
                Actor actor = new Actor();
                result = actor.setActors(firstName, lastName, timeStamp);
                System.out.println("className.methodName() "+result);
            }
        %>


        <form name="myForm" action="index.jsp" method="POST">
            <table border="0">

                <tbody>
                    <tr>
                        <td>First Name : </td>
                        <td><input type="text" name="first" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Last Name : </td>
                        <td><input type="text" name="last" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>

            <input type="hidden" name="hidden" value="<%= result%>" />

            <input type="reset" value="clear" name="clear" />
            <input type="submit" value="submit" name="submit" />
        </form>
        <script LANGUAGE="JavaScript">
            function displayResults()
            {
                if (document.myForm.hidden.value === 1) {
                    alert("Data Inserted");
                }
            }
            }
        </script>
    </body>
</html>
