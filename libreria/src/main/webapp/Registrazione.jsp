<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>registrazione</title>
<link rel="stylesheet" href="static/page.css">
</head>
<body>
<%
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
		<a href="registrati">Pannello Registrazione &#10145;&#65039</a>
	</div>
	<!-- Sotto pagina -->
	   <div class="card" >
	      <h1><%=messaggio%></h1>
	      <h3><%=messaggio2%></h3>
	   </div>


<%}else{%>
	<!-- titolo principale -->
	<div class="header" >
	  <h1>Biblioteca WebApp</h1>
	</div>
	<!-- Barra per reindirizzamento -->
	<div class="topnav">
	<h2 style="display: block;color: #f2f2f2;text-align: center;padding: 1px 4px;font-family: cursive;">
	Registrati
	</h2>
	</div>
	
	<!-- Sotto pagina sinistra -->
	    <div class="card" style="text-align: center;">
	      <h1>Inserisci i dati richiesti per registrarti</h1>
	      <h3>Quando hai finito di compilare tutti i dati clicca sul pulsante registrati</h3>
	    </div>
	<!-- Sotto pagina sinistra n2 -->
	    <div class="card" >
	    <form action="registrazioneUtente" method="post" style=" font-size: 105%;margin-right: 30%;text-align: right;">
	     <label id="username" style="margin-right: 5%;" >Inserisci il tuo username:</label>
	      <input name="username" id="username" type="text" placeholder="Giulio_n�1" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	      <label id="nome" style="margin-right: 5%;" >Inserisci il tuo nome:</label>
	      <input name="nome" id="nome" type="text" placeholder="Giulio" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	       <label id="cognome" style="margin-right: 5%;" >Inserisci il tuo congome:</label>
	      <input name="cognome" id="cognome" type="text" placeholder="Donnini" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	       <label id="email" style="margin-right: 5%;" >Inserisci la tua mail:</label>
	      <input name="email" id="email" type="email" placeholder="giuliodonnini@gmail.com" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	       <label id="pass" style="margin-right: 5%;" >Inserisci la tua password:</label>
	      <input name="pass" id="pass" type="password" placeholder="**Pass**" style="font-size: 105%;margin-top: 1%;text-align: center;"><br>
	       <label id="nascita" style="margin-right: 11.5%;">Inserisci la tua data di nascita:</label>
	      <input name="nascita" id="nascita" type="date" style="font-size: 105%;margin-top: 1%;"><br>
	      <input type="submit"  value="Registrati===>" style="font-size: 105%;margin-top: 1%;margin-left: 20%;" >
	    </form>
	    <form action="home" style=" font-size: 105%;margin-right: 30%;text-align: right;">
	    	      <input type="submit"  value="<===Indietro" style="font-size: 105%;margin-top: 1%;margin-left: 20%;" >
	    </form>
	    </div>

	<!-- Fine pagina -->
	<div class="footer">
	  <h2>Fine pagina</h2>
	</div>
<%}%>
</body>
</html>
