package model;

public class Usuario {

	private String dni;
	private String nombre;
	private String username;
	private String password;

	public Usuario(String username, String password) {
		setUsername(username);
		setPassword(password);
	}
	
	public Usuario(String dni, String nombre, String username, String password) {
		super();
		setDni(dni);
		setNombre(nombre);
		setUsername(username);
		setPassword(password);
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Usuario [dni=" + dni + ", nombre=" + nombre + "]";
	}
	
	

}
