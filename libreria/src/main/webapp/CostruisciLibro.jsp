<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>registrazione-libro</title>
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
	        <form action="PopolaMagazino?user=<%=user%>" method="post">
	     <input type="submit"  value="<===Home" >
	    </form>
	   </div>


<%}else{%>
	<!-- titolo principale -->
	<div class="header" >
	  <h1>Biblioteca WebApp</h1>
	</div>
	<!-- Barra per reindirizzamento -->
		
	<div class="topnav">
		<h3 style="text-align: center;color: white;">Registra libro</h3>
	</div>
	
	<!-- Sotto pagina sinistra -->
	    <div class="card" style="text-align: center;">
	      <h1>Inserisci i dati richiesti per registrare un nuovo libro</h1>
	      <h3>Quando hai finito di compilare tutti i dati clicca sul pulsante Avanti</h3>
	    </div>
	<!-- Sotto pagina sinistra n2 -->
	    <div class="card" >
	    <form action="addLibro" method="post" style=" font-size: 105%;margin-right: 30%;text-align: right;">
	   
	   <label id="user" style="margin-right: 5%;" >Username: <%=user%></label>
	   <input name="user" id="user" type="hidden" value="<%=user%>" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	    
	     <label id="titolo" style="margin-right: 5%;" >Inserisci il titolo:</label>
	      <input name="titolo" id="titolo" type="text" placeholder="Titolo" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	      <label id="autore" style="margin-right: 5%;" >Inserisci l'autore:</label>
	      <input name="autore" id="autore" type="text" placeholder="Autore" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	       <label id="costo" style="margin-right: 5%;" >Inserisci il costo:</label>
	      <input name="costo" id="costo" type="number" placeholder="costo" step="0.01" min="1" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	        <label id="quantita" style="margin-right: 5%;" >Inserisci la quantità di copie:</label>
	      <input name="quantita" id="quantita" type="number" placeholder="Quantità" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	      <input type="submit"  value="Avanti===>" style="font-size: 105%;margin-top: 1%;margin-left: 20%;" >
	    </form>
	   <form action="menudipendente?user=<%=user%>" method="post" style=" font-size: 105%;margin-right: 30%;text-align: right;">
	     <input type="submit"  value="<===Indietro" style="margin-top: 1%;font-size: 105%;margin-left: 20%;" >
	    </form>
	    </div>

	<!-- Fine pagina -->
	<div class="footer">
	  <h2>Fine pagina</h2>
	</div>
<%}%>
</body>
</html>
