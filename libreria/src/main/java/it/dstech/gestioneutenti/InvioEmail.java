package it.dstech.gestioneutenti;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.models.EmailUtility;

@WebServlet(name = "InvioEmail" , urlPatterns = "/InvioEmail")
public class InvioEmail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "Non puoi accedere manualmente a questa pagina...");
		req.setAttribute("messaggio2", "Clicca per essere reindirizzato alla pagina giusta.");
		req.getRequestDispatcher("home").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String indirizzo = req.getParameter("id");
		String soggetto = req.getParameter("soggetto");
		String contenuto = req.getParameter("contenuto");
		String risultatoMessaggio = "";
		String mex2 = "";
		try {
			EmailUtility.sendEmail(indirizzo, soggetto, contenuto);
			risultatoMessaggio = "Mail inviata correttamente";
		} catch (Exception ex) {
			ex.printStackTrace();
			risultatoMessaggio = "C'è stato un errore nell'invio della mail: " + ex.getMessage();
		} finally {
			req.setAttribute("messaggio", risultatoMessaggio);
			req.setAttribute("messaggio2", mex2);
			getServletContext().getRequestDispatcher("/endDipendente").forward(req, resp);
		}
	}
	
}
