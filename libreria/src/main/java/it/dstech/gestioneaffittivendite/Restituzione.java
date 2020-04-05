package it.dstech.gestioneaffittivendite;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneAffitto;

@WebServlet(name = "restituzione",urlPatterns = "/restituzione")
public class Restituzione extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "Non puoi accedere manualmente a questa pagina...");
		req.setAttribute("messaggio2", "Clicca per essere reindirizzato alla pagina giusta.");
		req.getRequestDispatcher("home").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GestioneAffitto gestioneAffitto = new GestioneAffitto();
		String titolo = req.getParameter("id");
		String user = req.getParameter("user");
		try {
			if(gestioneAffitto.restituzione(titolo, user)) {
				req.setAttribute("messaggio", "Hai  restituito correttamente il libro...");
				req.setAttribute("messaggio2", "Potrai affittare altri libri presso il menu principale.");
				req.getRequestDispatcher("PagFinaleCliente.jsp").forward(req, resp);
			}else {
				req.setAttribute("messaggio", "Abbiamo riscontrato un errore nel processo");
				req.setAttribute("messaggio2", "Controlla se hai già affittato questo libro.");
				req.getRequestDispatcher("affitto").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			e.printStackTrace();
		}
	}
}
