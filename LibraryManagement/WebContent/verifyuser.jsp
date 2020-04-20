<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "libraryUnits.books, libraryUnits.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify User</title>
</head>
<body>
<%
String username = (String)request.getParameter("username");
String password = (String)request.getParameter("password");
user users[];
users=(user[])session.getAttribute("users");
int totalusers = (int)session.getAttribute("totalusers");
int flag =0;
for(int i=1;i<totalusers;i++){
	if(users[i].username.equals(username)){
		if(users[i].password.equals(password)){
			session.setAttribute("currentUser",users[i]);
			out.println("User logged in succesfully");
			flag=1;
		}
		break;
	}
}
if(flag==0){
	out.println("<h1>Error in Credentials</h1>");
}
%>
<a href="http://localhost:8080/LibraryManagement/userpage">Click to Go to User Page</a>

</body>
</html>