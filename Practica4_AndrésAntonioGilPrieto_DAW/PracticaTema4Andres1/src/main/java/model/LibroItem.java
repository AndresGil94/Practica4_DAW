package model;

public class LibroItem {

	private Libro libro;
	private int cantidad;

	private UseCaseHandlerLibro uchl = new UseCaseHandlerLibro();

	public LibroItem(int id, int cantidad) {
		super();
		setLibro(uchl.read(id));
		setCantidad(cantidad);
	}

	public Libro getLibro() {
		return libro;
	}

	public void setLibro(Libro libro) {
		this.libro = libro;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

}
