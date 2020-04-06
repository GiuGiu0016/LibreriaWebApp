<%@page import="it.dstech.models.Utente"%>
<%@page import="it.dstech.database.GestioneUtenti"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.dstech.models.Libro"%>
<%@page import="java.util.List"%>
<%@page import="it.dstech.database.GestioneLibri"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>dati-email</title>
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
	        <form action="affitto?user=<%=user%>" method="post">
	     <input type="submit"  value="<===Home" >
	    </form>
	   </div>


<%
}else{
GestioneUtenti gest = new GestioneUtenti();
List<Utente> listautenti = new ArrayList<>(gest.mappaUtenti().values());
%>
	<!-- titolo principale -->
	<div class="header" >
	  <h1>Biblioteca WebApp</h1>
	</div>
	<!-- Barra per reindirizzamento -->
		
	<div class="topnav">
		<h3 style="text-align: center;color: white;">Ultimo Avvertimento</h3>
	</div>
	
	<!-- Sotto pagina sinistra -->
	    <div class="card" style="text-align: center;">
	      <h1>Inserisci i dati richiesti</h1>
	      <h3>Quando hai finito di compilare tutti i dati clicca sul pulsante Invia</h3>
	    </div>
	<!-- Sotto pagina sinistra n2 -->
	    <div class="card" >
	    <form action="InvioEmail?user=<%=user%>" method="post" style=" font-size: 105%;text-align:center;">
	     
			
        <table border="0" width="35%" align="center">
            <tr>
				<td>Inserisci email:</td>
				<td ><select id="id" name="id" style="font-size: 110%;">
			<%for(Utente utente: listautenti){%>
				<option value="<%=utente.getEmail()%>"><%=utente.getEmail()%></option>
				<%}%>
			</select></td>
			</tr>
			<tr>
                <td>Oggetto mail: </td>
                <td><input type="text" name="soggetto" size="50" style="text-align: center;" value="Sollecitiamo a restituire i Libri..."></td>
            </tr>
            <tr>
                <td>Contenuto</td>
                <td><textarea rows="10" cols="39" name="contenuto" placeholder="Lettera minatoria..." ></textarea> </td>
            </tr>
        </table>
		<input type="submit"  value="Invia===>" style="margin-top: 1%;font-size: 105%;margin-left: 20%;" >
	      </form>
	   <form action="menudipendente?user=<%=user%>" method="post" style=" font-size: 105%;margin-right: 40%;text-align: right;">
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
