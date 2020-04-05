package it.dstech.reindirizzamento;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "quantita",urlPatterns = "/quantita")
public class Quantit‡S extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "Non puoi accedere manualmente a questa pagina...");
		req.setAttribute("messaggio2", "Clicca per essere reindirizzato alla pagina giusta.");
		req.getRequestDispatcher("home").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("AggiornaQuantita.jsp").forward(req, resp);
	}
	
}
