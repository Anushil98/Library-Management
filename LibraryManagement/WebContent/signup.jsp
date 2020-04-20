<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>
</head>
<body>
<h1>User-Page-Login</h1>
<h2>Fill in the details</h2>
<form method="get" action="/LibraryManagement/addUser">
<label for="username">Enter Username:</label>
<input type="text" name="username"/><br>
<label for="password">Enter Password:</label>
<input type="password" name ="password"/><br>
<label for="re_password">Re-type Password:</label>
<input type="password" name ="re_password"/><br>
<input type="Submit" value="Sign Up">
</form>
</body>
</html>