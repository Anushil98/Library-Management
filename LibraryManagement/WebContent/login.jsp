<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User-Login</title>
</head>
<body>
<h1>User-Page-Login</h1>
<h2>Fill in the details</h2>
<form method="get" action="/LibraryManagement/verifyUser">
<label for="username" >Enter Username:</label>
<input type="text" name="username"/><br>
<label for="password">Enter Password:</label>
<input type="password" name ="password"/><br>
<input type="Submit" value="Log In">
</form>
</body>
</html>