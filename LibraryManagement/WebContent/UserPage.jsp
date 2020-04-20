<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "libraryUnits.books, libraryUnits.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Page</title>
</head>
<body>
<h1>User-page</h1>
<%
user currentUser = (user)session.getAttribute("currentUser");
%>
<p>Current user: <%=currentUser.username%></p>
<p><a href="/LibraryManagement/index?initialState=0">Logout</a></p>
<h1>Book List</h1>

<%
books bookshelf[] =(books[])session.getAttribute("bookshelf");
int totalbooks = (int)session.getAttribute("totalbooks");
String id = (String)request.getParameter("id");

if(id != null){
	if(bookshelf[Integer.parseInt(id)].CheckQuantity()){
		currentUser.allotbooks(bookshelf[Integer.parseInt(id)]);
		%>
		<script>alert("Book Request accepted")</script>
		<%
	}
	else{
		%>
		<script>alert("Book Request not accepted")</script>
		<%	
	}
}
%>
<table>
<tr>
	<th>Name</th>
	<th>Author</th>
</tr>
<% 
for(int i=0;i<totalbooks;i++){
	String name = bookshelf[i].name;
	String author = bookshelf[i].author;
%>

<tr>
<td><%=name%></td>
<td><%=author%></td>
<td><a href=<%="http://localhost:8080/LibraryManagement/userpage?id="+bookshelf[i].bookid%>>Request</a></td>
</tr>
<%
}	
%>
</table>
<%
String ret_id = (String)request.getParameter("ret_id");
if(ret_id!=null){
	currentUser.removeBook(Integer.parseInt(ret_id));	
}
%>

<h1>Books Alloted to the user</h1>
<table>
<tr>
	<th>Name</th>
	<th>Author</th>
</tr>
<% 
int totalbooksalloted = currentUser.totalbooksalloted;
books allotedbooks[] = currentUser.allotedBooks;
for(int i=0;i<totalbooksalloted;i++){
	String name = allotedbooks[i].name;
	String author = allotedbooks[i].author;
%>

<tr>
<td><%=name%></td>
<td><%=author%></td>
<td><a href=<%="http://localhost:8080/LibraryManagement/userpage?ret_id="+allotedbooks[i].bookid%>>Return</a></td>
</tr>
<%
}	
%>

</table>








</body>
</html>