<%-- 
    Document   : index
    Created on : Jul 29, 2018, 7:26:42 PM
    Author     : MOBASSIR
--%>

<%@page import = "java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Date date = new Date();
            %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Today's date</title>
    </head>
    <body>
        <h1>Today's date</h1>
        <p>Today's Date is  <%= date %></p>
    </body>
</html>
