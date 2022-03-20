package model;

import java.sql.*;
import java.util.ArrayList;

import dbConnection.*;

public class UseCaseHandlerUsuario {

	public boolean create(Usuario t) {

		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		String sql = "INSERT INTO Usuarios (dni, nombre, username, password) VALUES (?, ?, ?, ?)";

		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, t.getDni());
			ps.setString(2, t.getNombre());
			ps.setString(3, t.getUsername());
			ps.setString(4, t.getPassword());
			return ps.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		  
		return false;
	}

	public Usuario read(String dni) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		Usuario result = null;

		String sql = "SELECT * FROM Usuarios WHERE dni = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dni);
			rs = ps.executeQuery();

			while (rs.next()) {
				result = new Usuario(rs.getString("dni"), rs.getString("nombre"), rs.getString("username"),
						rs.getString("password"));

				return result;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}

	public ArrayList<Usuario> readAll() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		ArrayList<Usuario> result = new ArrayList<>();

		String sql = "SELECT * FROM Usuarios";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				result.add(new Usuario(rs.getString("dni"), rs.getString("nombre"), rs.getString("username"),
						rs.getString("password")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public boolean update(Usuario t, String dni) {

		if (read(t.getDni()) != null) {

			PreparedStatement ps = null;
			Connection con = DBConnection.getConexion();

			String sql = "UPDATE Usuarios SET dni = ?, nombre = ?, username = ?, password = ? WHERE dni = ?";

			try {

				ps = con.prepareStatement(sql);
				ps.setString(1, t.getDni());
				ps.setString(2, t.getNombre());
				ps.setString(3, t.getUsername());
				ps.setString(4, t.getPassword());
				ps.setString(5, dni);
				return ps.execute();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return false;
	}

	public boolean delete(String dni) {

		if (read(dni) != null) {
			PreparedStatement ps = null;
			Connection con = DBConnection.getConexion();

			String sql = "DELETE FROM Usuarios WHERE dni = ?";

			try {

				ps = con.prepareStatement(sql);
				ps.setString(1, dni);
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

	public boolean logIn(Usuario usuario) {

		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		ResultSet rs = null;

		String sql = "SELECT * FROM Usuarios WHERE username = ? AND password = ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, usuario.getUsername());
			ps.setString(2, usuario.getPassword());
			rs = ps.executeQuery();

			return rs.last();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;

	}

	public Usuario read(Usuario usuario) {
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		ResultSet rs = null;

		String sql = "SELECT * FROM Usuarios WHERE username = ? AND password = ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, usuario.getUsername());
			ps.setString(2, usuario.getPassword());
			rs = ps.executeQuery();

			while (rs.next()) {
				return new Usuario(rs.getString("dni"), rs.getString("nombre"), rs.getString("username"),						
						rs.getString("password"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

}
