package model;

public class Libro {

	private int id;
	private String titulo;
	private Autor autor;
	private Editorial editorial;
	private double precio;
	private Pedido pedido;

	public Libro(int id) {
		setId(id);
	}

	public Libro(String titulo, Autor autor, Editorial editorial, double precio) {
		super();
		setTitulo(titulo);
		setAutor(autor);
		setEditorial(editorial);
		setPrecio(precio);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Autor getAutor() {
		return autor;
	}

	public void setAutor(Autor autor) {
		this.autor = autor;
	}

	public Editorial getEditorial() {
		return editorial;
	}

	public void setEditorial(Editorial editorial) {
		this.editorial = editorial;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	@Override
	public String toString() {
		return "Libro[id=" + id + "titulo=" + titulo + ", autor=" + autor + ", editorial=" + editorial + ", precio=" + precio
				+ ", pedido=" + pedido + "]";
	}
	
	
	
	

}
