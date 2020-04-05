<%@page import="it.dstech.models.Affitto"%>
<%@page import="it.dstech.database.GestioneAffitto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.dstech.models.Libro"%>
<%@page import="java.util.List"%>
<%@page import="it.dstech.database.GestioneLibri"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>lista-affitto-libro</title>
<link rel="stylesheet" href="static/page.css">
<link rel="stylesheet" href="static/page2.css">
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #99ccff;
}
</style>
</head>
<body>
<%		
	String user = request.getParameter("user");
	String messaggio = (String) request.getAttribute("messaggio");
	String messaggio2 = (String) request.getAttribute("messaggio2");
	if (messaggio != null) {
%>
	<!-- titolo principale -->
	<div class="header">
	  <h1>Biblioteca WebApp Warning!</h1>
	</div>
		<!-- Barra per reindirizzamento -->
	<div class="topnav" style="text-align: center;color: white;">
		<p>Errore</p>
	</div>
	<!-- Sotto pagina -->
	   <div class="card" >
	      <h1><%=messaggio%></h1>
	      <h3><%=messaggio2%></h3>
	        <form action="listaaffitti?user=<%=user%>" method="post">
	     <input type="submit"  value="<===Home" >
	    </form>
	   </div>


<%}else{
GestioneAffitto gest = new GestioneAffitto();
GestioneLibri gestioneLibri = new GestioneLibri();
List<Affitto> listalibri = new ArrayList<>(gest.mappaLibriAffittati().values());
%>
	<!-- titolo principale -->
	<div class="header" >
	  <h1>Biblioteca WebApp</h1>
	</div>
	<!-- Barra per reindirizzamento -->
		
	<div class="topnav">
		<h3 style="text-align: center;color: white;">Lista Libri Affitati</h3>
	</div>
	
		<!-- Sotto pagina sinistra n1 -->
	    <div class="card" >
	  		<table>
			<tr>
				<th>iD-Libro</th>
				<th>Titolo</th>
				<th>Autore</th>
				<th>Costo</th>
			</tr>
			<%
				for (Affitto affitto : listalibri ) {
					if(affitto.getUser().equals(user)){
					Libro libro = gestioneLibri.mappaLibri().get(affitto.gettitolo());
			%>
			<tr>
				<td><%=libro.getId()%></td>
				<td><%=libro.getTitolo()%></td>
				<td><%=libro.getAutore()%></td>
				<td><%=libro.getCosto()%></td>
			</tr>
			<%
					}
				}
			%>
		</table>
	    </div>
	<!-- Sotto pagina sinistra n2 -->
	    <div class="card" >
	   <form action="menucliente?user=<%=user%>" method="post" style="margin-right: 10%;text-align: right;">
	     <input type="submit"  value="<===Indietro" style="font-size: 105%;" >
	    </form>
	    </div>

	<!-- Fine pagina -->
	<div class="footer">
	  <h2>Fine pagina</h2>
	</div>
<%}%>
</body>
</html>
