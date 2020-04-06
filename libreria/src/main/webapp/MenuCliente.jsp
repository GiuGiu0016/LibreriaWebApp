<%@page import="it.dstech.models.Utente"%>
<%@page import="it.dstech.models.Libro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.dstech.database.GestioneLibri"%>
<%@page import="it.dstech.database.GestioneUtenti"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>cliente</title>
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
	<div class="topnav">
		<a href="home">Home &#10145;&#65039</a>
	</div>
	<!-- Sotto pagina -->
	    <div class="card" >
	      <h1><%=messaggio%></h1>
	      <h3><%=messaggio2%></h3>
	   </div>


<%
	}else{
%>
	<!-- titolo principale -->
	<div class="header">
	  <h1>Biblioteca WebApp</h1>
	</div>
	<!-- Barra per reindirizzamento -->
	<div class="topnav" >
		 <div class="dropdown">
		    <button class="dropbtn">Operazioni
		      <i class="fa fa-caret-down"></i>
		    </button>
		    <div class="dropdown-content">
		    <form action="affitto?user=<%=user%>" method="post"><input type="submit" value="Affitto Libri  &#10145;&#65039" style="padding:5%;font-size:80%;padding-right: 45%; background-color: #003366;color: white;"></form>
   		    <form action="acquisto?user=<%=user%>" method="post"><input type="submit" value="Acquista Libri  &#10145;&#65039" style="padding:5%;font-size:80%;padding-right: 34.5%;background-color: #003366;color: white;"></form>
		    <form action="restituzionepage?user=<%=user%>" method="post"><input type="submit" value="Restituisci Libro  &#10145;&#65039" style="padding:5%;font-size:80%;padding-right: 26%;background-color: #003366;color: white;"></form>
		    <form action="listaaffitti?user=<%=user%>" method="post"><input type="submit" value="Stampa Affitti  &#10145;&#65039" style="padding:5%;font-size:80%;padding-right: 35%;background-color: #003366;color: white;"></form>				    
		    <form action="StampaAcquisti.jsp?user=<%=user%>" method="post"><input type="submit" value="Stampa Acquisti  &#10145;&#65039" style="padding:5%;font-size:80%;padding-right: 25%;background-color: #003366;color: white;"></form>				    		    
		    </div>
		</div>
		<a href="home">Exit &#10145;&#65039</a>
	</div>
	
	<%
			GestioneUtenti gest = new GestioneUtenti();
			Utente u = gest.mappaUtenti().get(user);
			GestioneLibri gest2 = new GestioneLibri();
			List<Libro> listalibri = new ArrayList<>(gest2.mappaLibri().values());
		%>
	<!-- Sotto pagina sinistra -->
	<div class="row">
	  <div class="leftcolumn">
	    <div class="card" >
	      <h1>Benvenuto:"<%=u.getUsername()%>"</h1>
	      <h3>Il nostro staff ti accoglie calorosamente in questa libreria,
	      	  speriamo tu possa trovare tutti i libri che ti interessano.</h3>
	      <h3>Buona lettura.</h3>
	    </div>
	    <div class="card" >
	        <h2>Curiosità: Libro</h2>
	       	<a href="https://it.wikipedia.org/wiki/Libro" style="font-size: 80%;">Da Wikipedia, l'enciclopedia libera</a>
	   	    <h4>Un libro è costituito da un insieme di fogli, stampati oppure manoscritti,
	   	        delle stesse dimensioni, rilegati insieme in un certo ordine e racchiusi da una copertina.
				Il libro è il veicolo più diffuso del sapere.L'insieme delle opere stampate, inclusi i libri,
				è detto letteratura. I libri sono pertanto opere letterarie. Nella biblioteconomia e scienza 
				dell'informazione un libro è detto monografia, per distinguerlo dai periodici come riviste, 
				bollettini o giornali.Un negozio che vende libri è detto libreria, termine che in italiano indica 
				anche il mobile usato per conservare i libri. La biblioteca è il luogo usato per conservare e consultare 
				i libri. Google ha stimato che al 2010 sono stati stampati approssimativamente 130 milioni di titoli 
				diversi.Con la diffusione delle tecnologie digitali e di Internet, ai libri stampati si è affiancato 
				l'uso dei libri elettronici, o e-book.</h4>
	    </div>
	     <div class="card"  >
	        <h2>Lista Libri:</h2>
	     			<table>
			<tr>
				<th>iD-Libro</th>
				<th>Titolo</th>
				<th>Autore</th>
				<th>Costo</th>
				<th>Quantità</th>
			</tr>
			<%
				for (Libro libro : listalibri) {
			%>
			<tr>
				<td><%=libro.getId()%></td>
				<td><%=libro.getTitolo()%></td>
				<td><%=libro.getAutore()%></td>
				<td><%=libro.getCosto()%></td>
				<td><%=libro.getQuantita()%></td>
			</tr>
			<%
				}
			%>
		</table>
	    </div>
	  </div>
	<!-- Colonna destra 1 -->
	  <div class="rightcolumn">
	    <div class="card" style="text-align: center;background-color: #b3b3b3;">
	      <h2>Informazioni personali raccolte:</h2>
	      <div class="fakeimg" style="text-align: center;padding: 1%;"> <img src="https://www.gifanimate.com/data/media/53/libro-immagine-animata-0042.gif"> </div>
	      <p>Username: "<%=u.getUsername()%>"</p>
	      <p>Nome: "<%=u.getNome() %>"</p>
	      <p>Cognome: "<%=u.getCognome() %>"</p>
	      <p>Email: "<%=u.getEmail()%>"</p>
	      <p>Data di nascita: "<%=u.getNascita()%>"</p>
	    </div>
	<!-- Colonna destra 2 -->
	    <div class="card" >
	      <h3>Founder pages</h3>
	      <p>Uno dei tanti Giulio</p>
	         <p>Ma visto che anche tu infondo sei un po' Giulio allora più nello specifico Giulio Donnini.</p>
	    </div>
	  	<div class="card" style="background-color: #99ccff;" >
	        <h2>Questo è un pannello per i consigli!</h2>
	        <h4>Offriamo la possibilità a tutti di acquistare o affittare libri, tramite i pratici pulsanti sulla barra in altro.</h4>
	        <h4>Scelgi una delle opzioni e cliccaci sopra, verrai reindirizzato nella pagina giusta.</h4>
	        <h4>Cordiali saluti lo staff di giulii.</h4>
	    </div>
	  </div>
	  
	</div>
	<!-- Fine pagina -->
	<div class="footer">
	  <h2>Fine pagina</h2>
	</div>
<%}%>
</body>
</html>
