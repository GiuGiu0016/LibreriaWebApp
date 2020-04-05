package it.dstech.models;

public class Libro {

	private long id;
	private String titolo;
	private String autore;
	private double costo;
	private int quantita;
	public Libro(String titolo, String autore, double costo, int quantita) {
		super();
		this.titolo = titolo;
		this.autore = autore;
		this.costo = costo;
		this.quantita = quantita;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	public String getAutore() {
		return autore;
	}
	public void setAutore(String autore) {
		this.autore = autore;
	}
	public double getCosto() {
		return costo;
	}
	public void setCosto(double costo) {
		this.costo = costo;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
	
	
}
