package it.dstech.gestioneaffittivendite;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneAffitto;
import it.dstech.database.GestioneLibri;

@WebServlet(name = "acquistoprodotto",urlPatterns = "/acquistoprodotto")
public class Acquisto extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "Non puoi accedere manualmente a questa pagina...");
		req.setAttribute("messaggio2", "Clicca per essere reindirizzato alla pagina giusta.");
		req.getRequestDispatcher("home").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GestioneLibri gestioneLibri = new GestioneLibri();
		GestioneAffitto gest = new GestioneAffitto();
		String titolo = req.getParameter("id");
		String user = req.getParameter("user");
		int quantita = Integer.parseInt(req.getParameter("quantita"));
		try {
			double prezzo = gestioneLibri.mappaLibri().get(titolo).getCosto();
			if(gest.Acquisto(titolo, user, quantita, prezzo)) {
				req.setAttribute("messaggio", "Acquisto effettuato correttamente alla somma di : \""+prezzo*quantita+"&#x20AC\"");
				req.setAttribute("messaggio2", "Potrai visualizzarlo nella home");
				req.getRequestDispatcher("PagFinaleCliente.jsp?user="+user+"").forward(req, resp);				
			}else {
				req.setAttribute("messaggio", "Errore inserimento dati");
				req.setAttribute("messaggio2", "Controlla e riprova");
				req.getRequestDispatcher("acquisto?user="+user+"").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			e.printStackTrace();
		}
	}

}





