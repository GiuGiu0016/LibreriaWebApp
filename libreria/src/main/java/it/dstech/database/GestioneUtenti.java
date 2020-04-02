package it.dstech.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import it.dstech.models.Utente;

public class GestioneUtenti {

	public Connection con() throws ClassNotFoundException, SQLException, IOException {
		ConnessioneDB con = new ConnessioneDB();
		return con.con();
	}
	
	public boolean creaUtente(Utente u) throws ClassNotFoundException, SQLException, IOException {
		if(mappaUtenti().containsKey(u.getUsername())) {
			return false;
		}else {
			String query = "INSERT INTO utenti (username,nome,cognome,nascita,password,email) VALUES (?,?,?,?,?,?);";
			PreparedStatement preparedStatement = con().prepareStatement(query);
			preparedStatement.setString(1, u.getUsername());
			preparedStatement.setString(2, u.getNome());
			preparedStatement.setString(3, u.getCognome());
			preparedStatement.setString(4, u.getNascita());
			preparedStatement.setString(5, u.getPass());
			preparedStatement.setString(6, u.getEmail());
			preparedStatement.execute();
			return true;
		}
	}
	
	public HashMap<String, Utente> mappaUtenti() throws ClassNotFoundException, SQLException, IOException{
		HashMap<String , Utente> mappaUtenti = new HashMap<>();
		String query = "SELECT * FROM utenti;";
		Statement statement = con().createStatement();
		ResultSet resultSet = statement.executeQuery(query);
		while(resultSet.next()) {
		String username = resultSet.getString("username");
		String pass = resultSet.getString("password");
		String nome = resultSet.getString("nome");
		String cognome = resultSet.getString("cognome");
		String nascita = resultSet.getString("nascita");
		String email = resultSet.getString("email");
		Utente utente = new Utente(username, nome, cognome, nascita, pass, email);
		mappaUtenti.put(utente.getUsername(), utente);
		}
		return mappaUtenti;
	}
}
