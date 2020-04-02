package it.dstech.gestioneutenti;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.database.GestioneUtenti;
import it.dstech.models.Utente;

@WebServlet(name = "registrazioneUtente",urlPatterns = "/registrazioneUtente")
public class RegistraUtente extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setAttribute("messaggio", "Non puoi accedere manualmente a questa pagina...");
	req.setAttribute("messaggio2", "Clicca per essere reindirizzato alla pagina giusta.");
	req.getRequestDispatcher("home").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GestioneUtenti gest = new GestioneUtenti();
		String username = req.getParameter("username");
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String nascita = req.getParameter("nascita");
		String pass = req.getParameter("pass");
		String email = req.getParameter("email");
		Utente utente = new Utente(username, nome, cognome, nascita, pass, email);
		try {
			if(gest.creaUtente(utente)) {
				req.setAttribute("messaggio", "Grazie per esserti registrato al nostro sito:");
				req.setAttribute("messaggio2", "Ora torna alla pagina principale ed effettua l'accesso");
				req.getRequestDispatcher("pagfinalegenerale").forward(req, resp);
			}else {
				req.setAttribute("messaggio", "Problema riscontrato con l'inserimento dei tuoi dati...");
				req.setAttribute("messaggio2", "-Prova a controllare i dati inseriti -Prova a cambiare l'username -Se hai già usato l'email cambia email");
				req.getRequestDispatcher("registrati").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			e.printStackTrace();
		}
	}
	
}
