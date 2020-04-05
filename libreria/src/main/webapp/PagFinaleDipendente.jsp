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
	String user = request.getParameter("user");
	String messaggio = (String) request.getAttribute("messaggio");
	String messaggio2 = (String) request.getAttribute("messaggio2");
%>
	<!-- titolo principale -->
	<div class="header">
	  <h1>Biblioteca WebApp</h1>
	</div>
		<!-- Barra per reindirizzamento -->
	<div class="topnav" style="text-align: center;color: white;" >
		<p>End-Page</p>
	</div>
	<!-- Sotto pagina -->
	    <div class="card" >
	      <h1><%=messaggio%></h1>
	      <h3><%=messaggio2%></h3>
	          <form action="menudipendente?user=<%=user%>" method="post">
	     <input type="submit"  value="<===Home" style="margin-top: 1%;font-size: 105%;" >
	    </form>
	   </div>
</body>
</html>   
</body>
</html>