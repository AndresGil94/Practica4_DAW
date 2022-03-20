package model;

public class Pedido {

	private int ref_id;
	private double importe;
	private Usuario usuario;
	

	

	public Pedido(double importe, Usuario usuario) {
		this.importe = importe;
		this.usuario = usuario;
	}

	public int getRef_id() {
		return ref_id;
	}

	public void setRef_id(int ref_id) {
		this.ref_id = ref_id;
	}

	public double getImporte() {
		return importe;
	}

	public void setImporte(double importe) {
		this.importe = importe;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Override
	public String toString() {
		return "Pedido id =" + ref_id + ", importe=" + importe ;
	}
	
	

}
