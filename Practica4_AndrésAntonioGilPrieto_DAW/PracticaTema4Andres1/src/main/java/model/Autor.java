package model;

import java.util.ArrayList;

public class Autor {

	private int id;
	private String nombre;
	private String apellidos;
	private ArrayList<Libro> libros;

	public Autor(String nombre, String apellidos) {
		super();
		setNombre(nombre);
		setApellidos(apellidos);
		libros = new ArrayList<>();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public ArrayList<Libro> getLibros() {
		return libros;
	}

	public void setLibros(ArrayList<Libro> libros) {
		this.libros = libros;
	}

	@Override
	public String toString() {
		return   nombre + "  " + apellidos ;
	}
	
	

}
