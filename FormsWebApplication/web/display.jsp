<%-- 
    Document   : display
    Created on : Jul 29, 2018, 8:53:58 PM
    Author     : MOBASSIR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using Forms</title>
    </head>
    <body>
        <h1>Using Forms</h1>
        <%
            String firstname = request.getParameter("first");
            String lastname = request.getParameter("last");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            %>
            
            <table border="1">
                <tbody>
                    <tr>
                        <td>First Name : </td>
                        <td><%= firstname %></td>
                    </tr>
                    <tr>
                        <td>Last Name : </td>
                        <td><%= lastname %></td>
                    </tr>
                    <tr>
                        <td>Email Address : </td>
                        <td><%= email %></td>
                    </tr>
                    <tr>
                        <td>Gender : </td>
                        <td><%= gender %></td>
                    </tr>
                    <tr>
                        <td>Date of Birth : </td>
                        <td><%= dob %></td>
                    </tr>
                </tbody>
            </table>

    </body>
</html>
