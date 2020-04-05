package it.dstech.gestionelibri;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneLibri;

@WebServlet(name = "modificaQuantita", urlPatterns = "/modificaQuantita")
public class AggiornaQuantita extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "Non puoi accedere manualmente a questa pagina...");
		req.setAttribute("messaggio2", "Clicca per essere reindirizzato alla pagina giusta.");
		req.getRequestDispatcher("home").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user = req.getParameter("user");
		int quantita = Integer.parseInt(req.getParameter("quantita"));
		String titolo = req.getParameter("id");
		GestioneLibri gest = new GestioneLibri();
		try {
			if(gest.modificaquantita(quantita, titolo)) {
				req.setAttribute("messaggio", "Quantita libro modificata correttamente...");
				req.setAttribute("messaggio2", user+", ora puoi ritornare alla home.");
				req.getRequestDispatcher("endDipendente?user="+user+"").forward(req, resp);
			}else {
				req.setAttribute("messaggio", "Errore con i dati inseriti.");
				req.setAttribute("messaggio2", "Il titolo inserito potrebbe non esistere o troppe unita da rimuovere.");
				req.getRequestDispatcher("quantita?user="+user+"").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
