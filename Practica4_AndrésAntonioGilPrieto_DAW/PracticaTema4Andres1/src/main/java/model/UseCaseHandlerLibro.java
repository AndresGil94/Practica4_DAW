package model;

import java.sql.*;
import java.util.ArrayList;

import dbConnection.*;

public class UseCaseHandlerLibro implements iUseCaseHandler<Libro> {

	UseCaseHandlerAutor ucha = new UseCaseHandlerAutor();
	UseCaseHandlerEditorial uche = new UseCaseHandlerEditorial();

	@Override
	public boolean create(Libro t) {

		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		String sql = "INSERT INTO Libros (titulo, fk_autor_id, fk_editorial_id, precio) VALUES (?, ?, ?, ?)";

		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, t.getTitulo());
			ps.setInt(2, t.getAutor().getId());
			ps.setInt(3, t.getEditorial().getId());
			ps.setDouble(4, t.getPrecio());
			return ps.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		 
		return false;
	}

	@Override
	public Libro read(int id) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		Libro result = null;

		String sql = "SELECT * FROM Libros WHERE id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				result = new Libro(rs.getString("titulo"), ucha.read(rs.getInt("fk_autor_id")),
						uche.read(rs.getInt("fk_editorial_id")), rs.getDouble("precio"));
				result.setId(rs.getInt("id"));

				return result;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}

	public Libro read(String titulo) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		Libro result = null;

		String sql = "SELECT * FROM Libros WHERE titulo = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, titulo);
			rs = ps.executeQuery();

			while (rs.next()) {
				result = new Libro(rs.getString("titulo"), ucha.read(rs.getInt("fk_autor_id")),
						uche.read(rs.getInt("fk_editorial_id")), rs.getDouble("precio"));
				result.setId(rs.getInt("id"));

				return result;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}

	@Override
	public ArrayList<Libro> readAll() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		ArrayList<Libro> result = new ArrayList<>();

		String sql = "SELECT * FROM Libros";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Libro e = new Libro(rs.getString("titulo"), ucha.read(rs.getInt("fk_autor_id")),
						uche.read(rs.getInt("fk_editorial_id")), rs.getDouble("precio"));
				e.setId(rs.getInt("id"));
				result.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public boolean update(Libro t, int id) {

		if (read(id) != null) {

			PreparedStatement ps = null;
			Connection con = DBConnection.getConexion();

			String sql = "UPDATE Libros SET titulo = ?, fk_autor_id = ?, fk_editorial_id = ?, precio = ? WHERE id = ?";

			try {

				ps = con.prepareStatement(sql);

				ps.setString(1, t.getTitulo());
				ps.setInt(2, t.getAutor().getId());
				ps.setInt(3, t.getEditorial().getId());
				ps.setDouble(4, t.getPrecio());
				ps.setInt(5, id);
				return ps.execute();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return false;
	}

	@Override
	public boolean delete(int id) {

		if (read(id) != null) {
			PreparedStatement ps = null;
			Connection con = DBConnection.getConexion();

			String sql = "DELETE FROM Libros WHERE id = ?";

			try {

				ps = con.prepareStatement(sql);
				ps.setInt(1, id);
				ps.execute();

				return true;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					System.err.println(e);
				}
			}
		}

		return false;
	}

}
