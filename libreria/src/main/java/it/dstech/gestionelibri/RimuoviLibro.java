package it.dstech.gestionelibri;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneLibri;

@WebServlet(name = "rimuovi",urlPatterns = "/rimuoviLibro")
public class RimuoviLibro extends HttpServlet {

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
		long id = Long.parseLong(req.getParameter("id"));
		try {
			gest.rimuoviLibro(id);
			req.setAttribute("messaggio", "Libro rimosso dal catalogo correttamente...");
			req.setAttribute("messaggio2", user+", ora puoi ritornare alla home.");
			req.getRequestDispatcher("endDipendente?user="+user+"").forward(req, resp);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			e.printStackTrace();
		}
	}
}
