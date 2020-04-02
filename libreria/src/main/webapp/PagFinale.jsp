<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>end</title>
<link rel="stylesheet" href="static/page.css">
</head>
<body>
<%
	String messaggio = (String) request.getAttribute("messaggio");
	String messaggio2 = (String) request.getAttribute("messaggio2");
%>
	<!-- titolo principale -->
	<div class="header">
	  <h1>Biblioteca WebApp</h1>
	</div>
		<!-- Barra per reindirizzamento -->
	<div class="topnav">
		<a href="home">Home &#10145;&#65039</a>
	</div>
	<!-- Sotto pagina -->
	    <div class="card" >
	      <h1><%=messaggio%></h1>
	      <h3><%=messaggio2%></h3>
	   </div>
</body>
</html>
