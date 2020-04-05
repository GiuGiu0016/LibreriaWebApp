package it.dstech.gestionelibri;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneLibri;
import it.dstech.models.Libro;

@WebServlet(name = "addLibro",urlPatterns = "/addLibro")
public class RegistraLibro extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "Non puoi accedere manualmente a questa pagina...");
		req.setAttribute("messaggio2", "Clicca per essere reindirizzato alla pagina giusta.");
		req.getRequestDispatcher("home").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GestioneLibri gest = new GestioneLibri();
		String user = req.getParameter("user");
		String titolo = req.getParameter("titolo");
		String autore = req.getParameter("autore");
		double costo = Double.parseDouble(req.getParameter("costo"));
		int quantita = Integer.parseInt(req.getParameter("quantita"));
		Libro l = new Libro(titolo, autore, costo, quantita);
		try {
			if(gest.creaLibro(l)) {
				req.setAttribute("messaggio", "Libro aggiunto al catalogo correttamente...");
				req.setAttribute("messaggio2", user+", ora puoi ritornare alla home.");
				req.getRequestDispatcher("endDipendente?user="+user+"").forward(req, resp);
			}else {
				req.setAttribute("messaggio", "Errore con i dati inseriti.");
				req.setAttribute("messaggio2", "Il titolo inserito potrebbe già essere esistente.");
				req.getRequestDispatcher("PopolaMagazino?user="+user+"").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
