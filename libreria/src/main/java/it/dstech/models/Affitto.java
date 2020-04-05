package it.dstech.models;

public class Affitto {

	private String titolo;
	private String username;
	private long id;
	public Affitto(String titolo, String username, long id) {
		this.titolo = titolo;
		this.username = username;
		this.id = id;
	}
	public String gettitolo() {
		return titolo;
	}
	public void settitolo(String titolo) {
		this.titolo = titolo;
	}
	public String getUser() {
		return username;
	}
	public void setUser(String uusername) {
		this.username = uusername;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	
	
}
