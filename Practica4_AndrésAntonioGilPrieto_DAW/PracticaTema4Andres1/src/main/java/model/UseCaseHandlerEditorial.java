package model;

import java.sql.*;
import java.util.ArrayList;

import dbConnection.*;

public class UseCaseHandlerEditorial implements iUseCaseHandler<Editorial> {

	@Override
	public boolean create(Editorial t) {

		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		String sql = "INSERT INTO Editoriales (nombre) VALUES (?)";

		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, t.getNombre());
			return ps.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public Editorial read(int id) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		Editorial result = null;

		String sql = "SELECT * FROM Editoriales WHERE id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				result = new Editorial(rs.getString("nombre"));
				result.setId(rs.getInt("id"));
				return result;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}

	@Override
	public ArrayList<Editorial> readAll() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();
		ArrayList<Editorial> result = new ArrayList<>();

		String sql = "SELECT * FROM Editoriales";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Editorial e = new Editorial(rs.getString("nombre"));
				e.setId(rs.getInt("id"));
				result.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public boolean update(Editorial t, int id) {
		PreparedStatement ps = null;
		Connection con = DBConnection.getConexion();

		String sql = "UPDATE Autores SET nombre = ? WHERE id = ?";

		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, t.getNombre());
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

		String sql = "DELETE FROM Editoriales WHERE id = ?";

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
