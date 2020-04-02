package it.dstech.models;

import javax.servlet.http.HttpServlet;

public class Utente extends HttpServlet {

	private String username;
	private String nome;
	private String cognome;
	private String nascita;
	private String pass;
	private String email;
	public Utente(String username, String nome, String cognome, String nascita, String pass, String email) {
		super();
		this.username = username;
		this.nome = nome;
		this.cognome = cognome;
		this.nascita = nascita;
		this.pass = pass;
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getNascita() {
		return nascita;
	}
	public void setNascita(String nascita) {
		this.nascita = nascita;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
