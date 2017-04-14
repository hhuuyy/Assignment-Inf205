<%-- 
    Document   : loading_login
    Created on : Oct 8, 2016, 4:00:16 PM
    Author     : Nguyen
--%>

<%@page import="model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="model.Customers1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="js/processbar.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="a.png"/>
        <script src="js/huy.js" type="text/javascript"></script>
        <meta http-equiv="refresh" content="4;index.jsp">
        <title>Loading ...</title>
    </head>
    <body>
        <b>Loading ${sessionScope.USER}@gmail.com...</b>
	<div class="loader-gmail"></div>
    </body>
</html>
