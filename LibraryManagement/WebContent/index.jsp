<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "libraryUnits.books, libraryUnits.user" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library</title>
</head>
<body>

<%
//Some initial values
String initialState = (String)request.getParameter("initialState");
session.setAttribute("currentUser", null);
if(initialState==null){
books bookshelf[] = new books[100];
bookshelf[0] = new books("Harry Potter and the goblet of fire","J.K. Rowling",10,0);
bookshelf[1] = new books("Harry Potter and the Half Blood Prince","J.K. Rowling", 5,1);
bookshelf[2] = new books("Java The Complete Reference", "Herbert Schildt",12,2);
int totalbooks = 3;
user users[] = new user[100];
users[0] = new user("Anushil","anushil1234","admin");
users[1] = new user("Agashi","agashi98","general");
users[2] = new user("Berlin","Te@amo","general");
users[3] = new user("Professor","lisbon","general");
int totalusers = 4;
session.setAttribute("bookshelf",bookshelf);
session.setAttribute("users", users);
session.setAttribute("totalbooks", totalbooks);
session.setAttribute("totalusers", totalusers);
}
%>
<h1>Welcome to the Central Hitk library</h1><br>

<a href="http://localhost:8080/LibraryManagement/login">Click to Login</a><br>
<a href="http://localhost:8080/LibraryManagement/signup">Click to Sign-Up</a><br>
<a href="http://localhost:8080/LibraryManagement/adminlogin">Admin-Login</a><br>


</body>
</html>