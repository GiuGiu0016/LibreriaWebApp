<%@page import="java.util.ArrayList"%>
<%@page import="it.dstech.models.Libro"%>
<%@page import="java.util.List"%>
<%@page import="it.dstech.database.GestioneLibri"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Affitto-libro</title>
<link rel="stylesheet" href="static/page.css">
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
	        <form action="acquisto?user=<%=user%>" method="post">
	     <input type="submit"  value="<===Home" >
	    </form>
	   </div>


<%}else{

GestioneLibri gest = new GestioneLibri();
List<Libro> listalibri = new ArrayList<>(gest.mappaLibri().values());
%>
	<!-- titolo principale -->
	<div class="header" >
	  <h1>Biblioteca WebApp</h1>
	</div>
	<!-- Barra per reindirizzamento -->
		
	<div class="topnav">
		<h3 style="text-align: center;color: white;">Acquisto libro</h3>
	</div>
	
	<!-- Sotto pagina sinistra -->
	    <div class="card" style="text-align: center;">
	      <h1>Inserisci i dati richiesti per acquistare un nuovo libro</h1>
	      <h3>Quando hai finito di compilare tutti i dati clicca sul pulsante Avanti</h3>
	    </div>
	<!-- Sotto pagina sinistra n2 -->
	    <div class="card" >
	    <form action="acquistoprodotto?user=<%=user%>" method="post" style=" font-size: 105%;text-align:center;">
	      <label id="quantita" style="margin-right: 5%;" >Inserisci la quantità di copie:</label>
	      <input name="quantita" id="quantita" type="number" placeholder="Quantità" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	     <label id="id">Inserisci id-Libro:</label>
			<select id="id" name="id" style="margin-top: 1%;">
			<%for(Libro libro : listalibri){%>
				<option value="<%=libro.getTitolo()%>"><%=libro.getId()%>.<%=libro.getTitolo()%></option>
				<%}%>
			</select><br>
		<input type="submit"  value="Avanti===>" style="margin-top: 1%;font-size: 105%;margin-left: 20%;" >
	      </form>
	    </div>
	  	<div class="card" >
	   <form action="menucliente?user=<%=user%>" method="post" style="margin-right: 10%;text-align: right; font-size: 105%;">
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
