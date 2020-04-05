package it.dstech.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import it.dstech.models.Affitto;
import it.dstech.models.Libro;
import it.dstech.models.Utente;

public class GestioneAffitto {

	public Connection con() throws ClassNotFoundException, SQLException, IOException {
		ConnessioneDB con = new ConnessioneDB();
		return con.con();
	}
	
	public HashMap<Long, Affitto> mappaLibriAffittati() throws ClassNotFoundException, SQLException, IOException{
		HashMap<Long, Affitto> mappaLibriAffittati = new  HashMap<>();
		String query = "SELECT * FROM affitto;";
		Statement statement = con().createStatement();
		ResultSet resultSet = statement.executeQuery(query);
		while(resultSet.next()) {
			String titolo = resultSet.getString(1);
			String email = resultSet.getString(2);
			long id  = resultSet.getLong(3);
			Affitto affitto = new Affitto(titolo, email, id);
			mappaLibriAffittati.put(affitto.getId(), affitto);
		}
		return mappaLibriAffittati;
	}
	
	public boolean controlloOrdine(String titolo,String user) throws ClassNotFoundException, SQLException, IOException {
	List<Affitto> listAffittos = new ArrayList<>(mappaLibriAffittati().values());
	for (Affitto affitto : listAffittos) {
		if(affitto.getUser().equals(user) && affitto.gettitolo().equals(titolo)) {
			return true;
		}
	}
	return false;
	}

	public boolean affitto(String titolo,String user) throws ClassNotFoundException, SQLException, IOException {
		GestioneLibri gestioneLibri = new GestioneLibri();
		if(controlloOrdine(titolo, user)) {
			return false;
		}else {
			if(gestioneLibri.modificaquantita(-1, titolo)) {
			String query = "INSERT INTO affitto (titolo,email) VALUES (?,?);";
			PreparedStatement statement = con().prepareStatement(query);
			statement.setString(1, titolo);
			statement.setString(2, user);	
			statement.execute();
			return true;
			}else {
				return false;
			}
		}
	}
	
	public boolean restituzione(String titolo,String user) throws ClassNotFoundException, SQLException, IOException {
		GestioneLibri gestioneLibri = new GestioneLibri();
		if(controlloOrdine(titolo, user)) {
			if(gestioneLibri.modificaquantita(+1, titolo)) {
				String query = "DELETE FROM affitto WHERE titolo = ?;";
				PreparedStatement statement = con().prepareStatement(query);
				statement.setString(1, titolo);
				statement.execute();
				return true;
			}
		}
		return false;
	}
}
