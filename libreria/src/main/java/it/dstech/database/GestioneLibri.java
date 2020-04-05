package it.dstech.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import it.dstech.models.Libro;

public class GestioneLibri {

	public Connection con() throws ClassNotFoundException, SQLException, IOException {
		ConnessioneDB con = new ConnessioneDB();
		return con.con();
	}
	
	public boolean creaLibro(Libro	l) throws ClassNotFoundException, SQLException, IOException {
		if(mappaLibri().containsKey(l.getTitolo())) {
			return false;
		}else {
			String query = "INSERT INTO magazzinolibri (idlibro,titolo,autore,costo,quantita) VALUES (?,?,?,?,?);";
			PreparedStatement preparedStatement = con().prepareStatement(query);
			preparedStatement.setLong(1, l.getId());
			preparedStatement.setString(2, l.getTitolo());
			preparedStatement.setString(3, l.getAutore());
			preparedStatement.setDouble(4, l.getCosto());
			preparedStatement.setInt(5, l.getQuantita());
			preparedStatement.execute();
			return true;
		}
	}
	
	public HashMap<String, Libro> mappaLibri() throws ClassNotFoundException, SQLException, IOException{
		HashMap<String, Libro> mappa = new HashMap<>();
		String query = "SELECT * FROM magazzinolibri;";
		Statement statement = con().createStatement();
		ResultSet resultSet = statement.executeQuery(query);
		while(resultSet.next()) {
		long idLibro = resultSet.getLong("idlibro");
		String titolo = resultSet.getString("titolo");
		String autore = resultSet.getString("autore");
		double costo = resultSet.getDouble("costo");
		int quantita = resultSet.getInt("quantita");
		Libro l = new Libro(titolo, autore, costo, quantita);
		l.setId(idLibro);
		mappa.put(titolo, l);
		}
		return mappa;
	}
	
	public void rimuoviLibro(long titolo) throws ClassNotFoundException, SQLException, IOException {
			String query = "DELETE FROM magazzinolibri WHERE idlibro = ?";	
			PreparedStatement statement = con().prepareStatement(query);
			statement.setLong(1, titolo);
			statement.execute();
	}

	public boolean modificaquantita(int quantita, String titolo) throws ClassNotFoundException, SQLException, IOException {
		int inv = mappaLibri().get(titolo).getQuantita()+quantita;
		if(inv<0) {
		return false;
		}else {
		String query = "UPDATE magazzinolibri set quantita = ? where titolo = ?;";
		PreparedStatement preparedStatement = con().prepareStatement(query);
		preparedStatement.setInt(1, inv);
		preparedStatement.setString(2, titolo);
		preparedStatement.execute();
		return true;
		}
	}
}
