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
<title>restituzione</title>
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
	        <form action="restituzionepage?user=<%=user%>" method="post">
	     <input type="submit"  value="<===Home" >
	    </form>
	   </div>


<%}else{

GestioneAffitto gest = new GestioneAffitto();
List<Affitto> listaaffitti = new ArrayList<>(gest.mappaLibriAffittati().values());
%>
	<!-- titolo principale -->
	<div class="header" >
	  <h1>Biblioteca WebApp</h1>
	</div>
	<!-- Barra per reindirizzamento -->
		
	<div class="topnav">
		<h3 style="text-align: center;color: white;">Affitto libro</h3>
	</div>
	
	<!-- Sotto pagina sinistra -->
	    <div class="card" style="text-align: center;">
	      <h1>Inserisci i dati richiesti per affitare un nuovo libro</h1>
	      <h3>Quando hai finito di compilare tutti i dati clicca sul pulsante Affitta</h3>
	    </div>
	<!-- Sotto pagina sinistra n2 -->
	    <div class="card" >
	    <form action="restituzione?user=<%=user%>" method="post" style=" font-size: 105%;text-align:center;">
	     <label id="id" style="margin-top: 2%;" >Inserisci id-Libro:</label>
			<select id="id" name="id">
			<%for(Affitto a : listaaffitti){
				if(a.getUser().equals(user)){
			%>
				<option value="<%=a.gettitolo()%>"><%=a.getId()%>.<%=a.gettitolo()%></option>
				<%}
				}%>
			</select><br>
		<input type="submit"  value="Restituisci===>" style="margin-top: 1%;font-size: 105%;margin-left: 20%;" >
	      </form>
	   <form action="menucliente?user=<%=user%>" method="post" style=" font-size: 105%;margin-right: 40%;text-align: right;">
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
