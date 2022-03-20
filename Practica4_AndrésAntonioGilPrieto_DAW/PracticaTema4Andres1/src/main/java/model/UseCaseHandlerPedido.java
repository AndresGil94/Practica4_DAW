package model;

import java.sql.*;
import java.util.ArrayList;

import dbConnection.*;

public class UseCaseHandlerPedido implements iUseCaseHandler<Pedido> {

	UseCaseHandlerUsuario uchu = new UseCaseHandlerUsuario();

	@Override
	public boolean create(Pedido t) {

		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		String sql = "INSERT INTO Pedidos (ref_id, importe, fk_usuarios_dni) VALUES (?, ?, ?)";

		try {

			ps = con.prepareStatement(sql);
			ps.setInt(1, t.getRef_id());
			ps.setDouble(2, t.getImporte());
			ps.setString(3, t.getUsuario().getDni());
			ps.execute();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public Pedido read(int id) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		Pedido result = null;

		String sql = "SELECT * FROM Pedidos WHERE ref_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				result = new Pedido(rs.getDouble("importe"), uchu.read("fk_usuarios_dni"));
				return result;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}
	
	public Pedido readLast() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		Pedido result = null;
		String sql = "SELECT * FROM Pedidos ORDER BY ref_id DESC LIMIT 1";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				result = new Pedido(rs.getDouble("importe"), uchu.read("fk_usuarios_dni"));
				result.setRef_id(rs.getInt("ref_id"));
				return result;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}

	@Override
	public ArrayList<Pedido> readAll() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		ArrayList<Pedido> result = new ArrayList<>();

		String sql = "SELECT * FROM Pedidos";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Pedido e = new Pedido(rs.getDouble("importe"), uchu.read("fk_usuarios_dni"));
				e.setRef_id(rs.getInt("ref_id"));
				result.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public boolean update(Pedido t, int id) {
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();

		String sql = "UPDATE Pedidos SET ref_id = ?, importe = ?, fk_usuarios_id = ? WHERE ref_id = ?";

		try {

			ps = con.prepareStatement(sql);
			ps.setInt(1, t.getRef_id());
			ps.setDouble(2, t.getImporte());
			ps.setString(3, t.getUsuario().getDni());
			ps.setInt(4, id);
			return ps.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean delete(int id) {
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();

		String sql = "DELETE FROM Pedidos WHERE ref_id = ?";

		try {

			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.execute();

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.err.println(e);
			}
		}
	}

	public boolean createPedidoLibro(Pedido pedido, ArrayList<LibroItem> libros) {

		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();

		String sql = "INSERT INTO pedidos_libros (fk_pedido_id, fk_libro_id, cantidad) VALUES (?, ?, ?)";

		try {
			for (LibroItem libro : libros) {
				ps = con.prepareStatement(sql);
				ps.setInt(1, pedido.getRef_id());
				ps.setInt(2, libro.getLibro().getId());
				ps.setInt(3, libro.getCantidad());
				ps.execute();
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;

	}
	
	public ArrayList<LibroItem> readLibrosFromPedido(int ref_id) {
		
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		ResultSet rs = null;
		ArrayList<LibroItem> result = new ArrayList<>();
		String sql = "SELECT * FROM pedidos_libros WHERE fk_pedido_id = ?";
		UseCaseHandlerLibro uchl = new UseCaseHandlerLibro();
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, ref_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				LibroItem l = new LibroItem(rs.getInt("fk_libro_id"), rs.getInt("cantidad"));
				result.add(l);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

}
