package com.foodexpress.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodexpress.dao.MenuDao;
import com.foodexpress.model.Menu;
import com.foodexpress.utility.DbConnection;

public class MenuDaoImpl implements MenuDao {

	private Connection con;

	String ADD_MENU =
			"INSERT INTO menu(restaurantId,name,description,price,rating,imageUrl,type,isAvailable) VALUES(?,?,?,?,?,?,?,?)";

	String GET_MENU =
			"SELECT * FROM menu WHERE menuId=?";

	String UPDATE_MENU =
			"UPDATE menu SET restaurantId=?,name=?,description=?,price=?,rating=?,imageUrl=?,type=?,isAvailable=? WHERE menuId=?";

	String DELETE_MENU =
			"DELETE FROM menu WHERE menuId=?";

	String FETCH_ALL_MENUS =
			"SELECT * FROM menu";

	String FETCH_BY_RESTAURANT =
			"SELECT * FROM menu WHERE restaurantId=?";

	public MenuDaoImpl() {
		con = DbConnection.getConnection();
	}

	private Connection getConnection() {
		try {
			if (con == null || con.isClosed()) {
				con = DbConnection.getConnection();
			}
		} catch (SQLException e) {
			con = DbConnection.getConnection();
		}
		return con;
	}

	@Override
	public void addMenu(Menu menu) {
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("MenuDaoImpl.addMenu: Connection is null");
			return;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(ADD_MENU)) {

			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setDouble(5, menu.getRating());
			pstmt.setString(6, menu.getImageUrl());
			pstmt.setString(7, menu.getType());
			pstmt.setBoolean(8, menu.isAvailable());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menuId) {

		Menu menu = null;
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("MenuDaoImpl.getMenu: Connection is null");
			return null;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(GET_MENU)) {

			pstmt.setInt(1, menuId);

			ResultSet result = pstmt.executeQuery();

			if (result.next()) {

				menu = new Menu(
						result.getInt("menuId"),
						result.getInt("restaurantId"),
						result.getString("name"),
						result.getString("description"),
						result.getDouble("price"),
						result.getDouble("rating"),
						result.getString("imageUrl"),
						result.getString("type"),
						result.getBoolean("isAvailable"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menu;
	}

	@Override
	public void updateMenu(Menu menu) {

		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("MenuDaoImpl.updateMenu: Connection is null");
			return;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(UPDATE_MENU)) {

			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setDouble(5, menu.getRating());
			pstmt.setString(6, menu.getImageUrl());
			pstmt.setString(7, menu.getType());
			pstmt.setBoolean(8, menu.isAvailable());
			pstmt.setInt(9, menu.getMenuId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId) {

		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("MenuDaoImpl.deleteMenu: Connection is null");
			return;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(DELETE_MENU)) {

			pstmt.setInt(1, menuId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Menu> getAllMenus() {

		List<Menu> menus = new ArrayList<>();
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("MenuDaoImpl.getAllMenus: Connection is null");
			return menus;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(FETCH_ALL_MENUS);
			 ResultSet result = pstmt.executeQuery()) {

			while (result.next()) {

				Menu menu = new Menu(
						result.getInt("menuId"),
						result.getInt("restaurantId"),
						result.getString("name"),
						result.getString("description"),
						result.getDouble("price"),
						result.getDouble("rating"),
						result.getString("imageUrl"),
						result.getString("type"),
						result.getBoolean("isAvailable"));

				menus.add(menu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menus;
	}

	@Override
	public List<Menu> getMenusByRestaurant(int restaurantId) {

		List<Menu> menus = new ArrayList<>();
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("MenuDaoImpl.getMenusByRestaurant: Connection is null");
			return menus;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(FETCH_BY_RESTAURANT)) {

			pstmt.setInt(1, restaurantId);

			ResultSet result = pstmt.executeQuery();

			while (result.next()) {

				Menu menu = new Menu(
						result.getInt("menuId"),
						result.getInt("restaurantId"),
						result.getString("name"),
						result.getString("description"),
						result.getDouble("price"),
						result.getDouble("rating"),
						result.getString("imageUrl"),
						result.getString("type"),
						result.getBoolean("isAvailable"));

				menus.add(menu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menus;
	}
}