package it.dstech.gestioneutenti;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneUtenti;

 @WebServlet(name = "accessoutente",urlPatterns = "/accessoutente")
public class AccessoUtente extends HttpServlet{
	 
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setAttribute("messaggio", "Non puoi accedere manualmente a questa pagina...");
			req.setAttribute("messaggio2", "Clicca per essere reindirizzato alla pagina giusta.");
			req.getRequestDispatcher("home").forward(req, resp);
	}

	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String username = req.getParameter("username");
			String pass = req.getParameter("pass");
			String email = req.getParameter("email");
			GestioneUtenti gest = new GestioneUtenti();
			try {
				if(gest.mappaUtenti().containsKey(username)) {
					if(username.equals("Giulio_Originals")) {
					accessoDipendete(req, resp, username, pass, email, gest);	
					}else {
					accessoCliente(req, resp, username, pass, email, gest);
					}
				}else {errore(req, resp);}
			} catch (ClassNotFoundException | SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	private void accessoDipendete(HttpServletRequest req, HttpServletResponse resp, String username, String pass, String email,
			GestioneUtenti gest) throws ClassNotFoundException, SQLException, IOException, ServletException {
		if(gest.mappaUtenti().get(username).getPass().equals(pass) && gest.mappaUtenti().get(username).getEmail().equals(email)) {
			req.getRequestDispatcher("menudipendente?user="+username+"").forward(req, resp);
		}else {errore(req, resp);}
	}

	private void accessoCliente(HttpServletRequest req, HttpServletResponse resp, String username, String pass, String email,
			GestioneUtenti gest) throws ClassNotFoundException, SQLException, IOException, ServletException {
		if(gest.mappaUtenti().get(username).getPass().equals(pass) && gest.mappaUtenti().get(username).getEmail().equals(email)) {
			req.getRequestDispatcher("menucliente?user="+username+"").forward(req, resp);
		}else {errore(req, resp);}
	}

	private void errore(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "Possibile errore con l'iserimento dei tuoi dati...");
		req.setAttribute("messaggio2", "Prova a controllarli e ritenta.");
		req.getRequestDispatcher("accesso").forward(req, resp);
	}
}
