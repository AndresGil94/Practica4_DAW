package model;

import java.util.ArrayList;

public class Editorial {

	private int id;
	private String nombre;
	private ArrayList<Libro> libros;

	public Editorial(String nombre) {
		super();
		setNombre(nombre);
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

	public ArrayList<Libro> getLibros() {
		return libros;
	}

	public void setLibros(ArrayList<Libro> libros) {
		this.libros = libros;
	}

	@Override
	public String toString() {
		return "Editorial [id=" + id + "nombre=" + nombre + " ]";
	}

}
