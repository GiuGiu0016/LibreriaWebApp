<%@page import="it.dstech.models.Affitto"%>
<%@page import="it.dstech.database.GestioneAffitto"%>
<%@page import="it.dstech.models.Utente"%>
<%@page import="it.dstech.models.Libro"%>
<%@page import="it.dstech.database.GestioneLibri"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="it.dstech.database.GestioneUtenti"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>home</title>
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
		<a>Errore</a>
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
		    <form action="PopolaMagazino?user=<%=user%>" method="post"><input type="submit" value="Registra-Libro  &#10145;&#65039" style="padding:5%;font-size:80%;padding-right: 38%; background-color: #003366;color: white;"></form>
   		    <form action="rimozione?user=<%=user%>" method="post"><input type="submit" value="Elimina Libro  &#10145;&#65039" style="padding:5%;font-size:80%;padding-right: 42%;background-color: #003366;color: white;"></form>
		    <form action="quantita?user=<%=user%>" method="post"><input type="submit" value="Aggiorna quantita  &#10145;&#65039" style="padding:5%;font-size:80%;padding-right: 25%;background-color: #003366;color: white;"></form>
		    <form action="home" method="post"><input type="submit" value="Sollecita restituzione  &#10145;&#65039" style="padding:5%;font-size:80%;padding-right: 15%;background-color: #003366;color: white;"></form>				    
		    </div>
		</div>
		<a href="home">Exit &#10145;&#65039</a>
	</div>
	
	<%
			GestioneUtenti gest = new GestioneUtenti();
			List<Utente> listautenti = new ArrayList<>(gest.mappaUtenti().values());
			GestioneLibri gest2 = new GestioneLibri();
			List<Libro> listalibri = new ArrayList<>(gest2.mappaLibri().values());
			Utente u = gest.mappaUtenti().get(user);
			GestioneAffitto gest3 = new GestioneAffitto();
			List<Affitto> listalibriaffitti = new ArrayList<>(gest3.mappaLibriAffittati().values());
		%>
	<!-- Sotto pagina sinistra -->
	<div class="row">
	  <div class="leftcolumn">
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
	    	    <div class="card"  >
	        <h2>Lista Utenti:</h2>
	     			<table>
			<tr>
				<th>Username</th>
				<th>Nome</th>
				<th>Cognome</th>
				<th>Nascita</th>
				<th>Email</th>
			</tr>
			<%
				for (Utente utente : listautenti) {
			%>
			<tr>
				<td><%=utente.getUsername()%></td>
				<td><%=utente.getNome()%></td>
				<td><%=utente.getCognome()%></td>
				<td><%=utente.getNascita()%></td>
				<td><%=utente.getEmail()%></td>
			</tr>
			<%
				}
			%>
		</table>
	    </div>
	    		<!-- Sotto pagina sinistra n1 -->
	    <div class="card" >
	    	        <h2>Lista libri affittati:</h2>
	    
	  		<table>
			<tr>
				<th>iD-Libro</th>
				<th>Titolo</th>
				<th>Autore</th>
				<th>Costo</th>
				<th>Utente</th>
			</tr>
			<%
				for (Affitto affitto : listalibriaffitti ) {
					Libro libro = gest2.mappaLibri().get(affitto.gettitolo());
			%>
			<tr>
				<td><%=libro.getId()%></td>
				<td><%=libro.getTitolo()%></td>
				<td><%=libro.getAutore()%></td>
				<td><%=libro.getCosto()%></td>
				<td><%=affitto.getUser()%></td>
			</tr>
			<%
				}
			%>
		</table>
	    </div>

	  </div>
	<!-- Colonna destra 1 -->
	  <div class="rightcolumn">
		<div class="card" >
	      <h1>Dipendente:</h1>
	      <h2>"<%=u.getUsername()%>"</h2>
	      
	      <h3>Salve Dipendente come posso aiutarla?</h3>
	    </div>
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
	        <h4>In alto sulla barra di navigazione troverai le varie operazioni disponibili...</h4>
	        <h4>a sinistra troverai le varie liste che potrebbero tornare utili.</h4>
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
