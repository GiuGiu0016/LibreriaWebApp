<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>home</title>
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
		<a href="home">Home &#10145;&#65039</a>
	</div>
	<!-- Sotto pagina -->
	    <div class="card" >
	      <h1><%=messaggio%></h1>
	      <h3><%=messaggio2%></h3>
	   </div>


<%}else{%>
	<!-- titolo principale -->
	<div class="header">
	  <h1>Biblioteca WebApp</h1>
	</div>
	<!-- Barra per reindirizzamento -->
	<div class="topnav" >
		    <a href="registrati" >Registrati &#128100</a>
		    <a href="accesso">Accedi &#128104</a>
			<a>&#10145;&#65039</a>
	</div>
	
	<!-- Sotto pagina sinistra -->
	<div class="row">
	  <div class="leftcolumn">
	    <div class="card" >
	      <h1>Benvenuti nella mia fantastica libreria</h1>
	      <h3>Vendiamo tantissimi libri scritti da chiunque e provenienti da ogni dove...</h3>
	    </div>
	    <div class="card" >
	        <h2>Curiosità: Lettura</h2>
	        <a href="https://it.wikipedia.org/wiki/Lettura" style="font-size: 80%;">Da Wikipedia, l'enciclopedia libera.</a>
	   	    <h4>La lettura è il processo mentale che permette di decodificare e comprendere informazioni o idee rappresentate in forma visiva o tattile.
				Prevalentemente il concetto di lettura è collegato al concetto di scrittura, ovvero quel processo culturale appreso che permette la traduzione dei significati di un testo rappresentato per mezzo di simboli alfabetici o meno che possono essere percepiti con la vista, o col tatto (nel caso della scrittura Braille).
				Altri tipi di lettura possono non essere basati sulle lingue naturali, come nel caso della notazione musicale o dei pittogrammi, e nemmeno sulla scrittura propriamente detta ad esempio la lettura di cartografie topografiche o la lettura della mano.
				Per analogia, nella scienza dell'informazione, la lettura è l'acquisizione di dati da qualche tipo di memoria.</h4>
	    </div>
		<div class="card" style="background-color: #99ccff;" >
	        <h2>Questo è un pannello per i consigli!</h2>
	        <h4>Quando ti senti pronto effettua l'accesso per entrare nel nostro store online tramite il pulsante in alto a sinistra con la scritta "Accedi";</h4>
	   	    <h4>Se ancora non sei registrato entra subito a far parte di questo mondo registrandoti tramite il pulsante in alto a sinistra con la scritta "Registrati"; </h4>
			<h4>Spero che il nostro sito ti piaccia... se la risposta è si consiglialo agli amici.</h4>	   
	    </div>
	  </div>
	<!-- Colonna destra 1 -->
	  <div class="rightcolumn">
	    <div class="card" style="text-align: center;background-color: #b3b3b3;">
	      <h2>Perchè?</h2>
	      <div class="fakeimg" style="text-align: center;"> <img src="https://media3.giphy.com/media/n0eJLge10ujSM/giphy.gif"> </div>
	      <p>Non c'è molto da dire avevo un esercizio da fare e l'ho fatto.</p>
	    </div>
	<!-- Colonna destra 2 -->
	    <div class="card" >
	      <h3>Founder pages</h3>
	      <p>Uno dei tanti Giulio</p>
	         <p>Ma visto che anche tu infondo sei un po' Giulio allora più nello specifico Giulio Donnini.</p>
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
