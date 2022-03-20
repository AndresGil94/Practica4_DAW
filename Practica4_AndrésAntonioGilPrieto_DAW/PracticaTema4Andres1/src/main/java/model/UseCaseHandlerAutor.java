package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

import dbConnection.*;

public class UseCaseHandlerAutor implements iUseCaseHandler<Autor> {

	@Override
	public boolean create(Autor t) {

		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		String sql = "INSERT INTO Autores (nombre, apellidos) VALUES (?, ?)";

		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, t.getNombre());
			ps.setString(2, t.getApellidos());
			return ps.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public Autor read(int id) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		Autor result = null;

		String sql = "SELECT * FROM Autores WHERE id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				result = new Autor(rs.getString("nombre"), rs.getString("apellidos"));
				result.setId(rs.getInt("id"));
				return result;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}

	@Override
	public ArrayList<Autor> readAll() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		ArrayList<Autor> result = new ArrayList<>();

		String sql = "SELECT * FROM Autores";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Autor e = new Autor(rs.getString("nombre"), rs.getString("apellidos"));
				e.setId(rs.getInt("id"));
				result.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public boolean update(Autor t, int id) {
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();

		String sql = "UPDATE Autores SET nombre = ?, apellidos = ? WHERE id = ?";

		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, t.getNombre());
			ps.setString(2, t.getApellidos());
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

		String sql = "DELETE FROM Autores WHERE id = ?";

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

}
