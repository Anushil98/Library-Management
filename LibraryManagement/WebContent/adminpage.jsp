<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "libraryUnits.books, libraryUnits.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login-AdminUsage</title>
</head>
<body>
<h1>Admin - Page</h1>
<br>
<%
String username = (String)request.getParameter("username");
String password = (String)request.getParameter("password");
String new_name = (String)request.getParameter("name");
String new_author = (String)request.getParameter("author");
String new_quantity = (String)request.getParameter("quantity");
int flag=0;
int logged=0;
String temp = (String)request.getParameter("logged");
if(temp!=null){
	logged = Integer.parseInt(temp);
}
if(username== null && password== null && logged==0){
	%>
	<form id ="loginform" method="post" action="http://localhost:8080/LibraryManagement/adminlogin">
	<label for="username">Enter Username</label>
	<input type="text" name="username" /><br>
	<label for="password">Enter Password</label>
	<input type="password" name="password"/><br>

	<input type="submit" />
	</form>
	
	<%
	logged=1;
}

if((new_name!=null && new_author!=null && new_quantity!=null)||(username!= null && password!= null)){
	books bookshelf[] =(books[])session.getAttribute("bookshelf");
	int totalbooks = (int)session.getAttribute("totalbooks");
	if(new_name!=null && new_author!=null && new_quantity!=null){
		books newbook = new books(new_name,new_author,Integer.parseInt(new_quantity),totalbooks);
		bookshelf[totalbooks] = newbook;
		session.setAttribute("bookshelf",bookshelf);
		session.setAttribute("totalbooks", ++totalbooks);
		flag=1;
	}
	user users[]= (user[])session.getAttribute("users");
	user Admin;
	Admin = users[0];
	if (flag==1 || (username.equals(Admin.username) && password.equals(Admin.password))){
		if(flag==0)
		out.println("<script>alert('Login accepted'); document.getElementById('loginform').remove();</script>");
		
		
		
		%>
		<p><a href="/LibraryManagement/index?initialState=0">Logout</a></p>
		<h1>Book List</h1>
		<table>
		<tr>
			<th>Name</th>
			<th>Author</th>
			<th>Quantity</th>
			</tr>
		<%
		for(int i=0;i<totalbooks;i++){
			String name = bookshelf[i].name;
			String author = bookshelf[i].author;
			int quantity = bookshelf[i].quantity;
		%>
			<tr>
				<td><%=name%></td>
				<td><%=author%></td>
				<td><%=quantity %></td>
			</tr>
		
		<% 
		}
		%></table><br>
		<%
		//the Add book section goes here
		%>
		<h1>Add Book</h1>
		<form method="post" action="http://localhost:8080/LibraryManagement/adminlogin">
		<label for="name">Name:</label>
		<input type="text" name="name"/><br>
		<label for="author">Author:</label>
		<input type="text" name="author"/><br>
		<label for="quantity">Quantity</label>
		<input type="number" name="quantity"/><br>
		<input style="display:none;" type="number" name="logged" value="1"/>
		<input type="submit"/>
		</form>
		
		<%
		
		
		
	}
	else{
		out.println("<script>alert('Login failed')</script>");
	}
	
}
%>
</body>
</html>