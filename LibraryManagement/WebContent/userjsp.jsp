<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "libraryUnits.books, libraryUnits.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User-verify</title>
</head>
<body>
<%
user users[];
users=(user[])session.getAttribute("users");
int totalusers = (int)session.getAttribute("totalusers");
String username = (String)request.getParameter("username");
String password = (String)request.getParameter("password");
String repass = (String)request.getParameter("re_password");
int flag=0;
for(int i=1;i<totalusers;i++){
	if(users[i].username.equals(username)){
	out.println("<h1>Username already in use</h1>");
	flag=1;
	}
	
}
if ((password.compareTo(repass)==0) && (flag==0)){
	users[totalusers] = new user(username,password,"general");
	session.setAttribute("users", users);
	session.setAttribute("totalusers",totalusers+1);
	out.println("<h1>User Added</h1>");
}
else{
	out.println("<h1>Error in password</h1>");
}

%>
<a href="/LibraryManagement/index?initialState=0">Go Back To main page</a>
</body>
</html>