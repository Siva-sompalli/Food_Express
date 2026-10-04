package com.foodexpress.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodexpress.dao.UserDao;
import com.foodexpress.model.User;
import com.foodexpress.utility.DbConnection;

public class UserDaoImpl implements UserDao {

    private Connection con;
    String ADD_USER = "INSERT INTO user(username,password,email,address,phoneNumber,role,createdDate,lastLoginDate) VALUES(?,?,?,?,?,?,?,?)";
    String GET_USER = "SELECT * FROM user WHERE userId=?";
    String UPDATE_USER = "UPDATE user SET username=?,password=?,email=?,address=?,phoneNumber=? WHERE userId=?";
    String DELETE_USER = "DELETE FROM user WHERE userId=?";
    String LOGIN_USER = "SELECT * FROM user WHERE email=? AND password=?";
    String FETCH_ALL_USERS = "SELECT * FROM user";
    String SEARCH_CUSTOMERS =
    		"SELECT * FROM user WHERE username LIKE ? OR email LIKE ? OR phoneNumber LIKE ?";
    public UserDaoImpl() {
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
    public void addUser(User user) {
        Connection connection = getConnection();
        if (connection == null) {
            System.err.println("UserDaoImpl.addUser: Connection is null");
            return;
        }

        try (PreparedStatement pstmt = connection.prepareStatement(ADD_USER)) {

            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getAddress());
            pstmt.setString(5, user.getPhoneNumber());
            pstmt.setString(6, user.getRole());
            pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            pstmt.setTimestamp(8, new Timestamp(System.currentTimeMillis()));

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User getUser(int userId) {

        User user = null;
        Connection connection = getConnection();
        if (connection == null) {
            System.err.println("UserDaoImpl.getUser: Connection is null");
            return null;
        }
    
        try (PreparedStatement pstmt = connection.prepareStatement(GET_USER)) {

            pstmt.setInt(1, userId);

            ResultSet result = pstmt.executeQuery();

            if (result.next()) {

            	int userid=result.getInt("userId");
				String username=result.getString("username");
				String password=result.getString("password");
				String email=result.getString("email");
				String address=result.getString("address");
				String phoneNumber=result.getString("phoneNumber");
				String role=result.getString("role");
				Timestamp createdDate=result.getTimestamp("createdDate");
				Timestamp lastLoginDate=result.getTimestamp("lastLoginDate");
				user = new User(userid,username,password,email,address,phoneNumber,role,createdDate,lastLoginDate);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public void updateUser(User user) {

        Connection connection = getConnection();
        if (connection == null) {
            System.err.println("UserDaoImpl.updateUser: Connection is null");
            return;
        }

        try (PreparedStatement pstmt = connection.prepareStatement(UPDATE_USER)) {

            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getAddress());
            pstmt.setString(5, user.getPhoneNumber());
            pstmt.setInt(6, user.getUserId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUser(int userId) {

        Connection connection = getConnection();
        if (connection == null) {
            System.err.println("UserDaoImpl.deleteUser: Connection is null");
            return;
        }

        try (PreparedStatement pstmt = connection.prepareStatement(DELETE_USER)) {

            pstmt.setInt(1, userId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public User getUser(String email, String password) {

    	User user = null;
        Connection connection = getConnection();
        if (connection == null) {
            System.err.println("UserDaoImpl.getUser(email,pwd): Connection is null");
            return null;
        }

    	try (PreparedStatement pstmt = connection.prepareStatement(LOGIN_USER)) {

    		pstmt.setString(1, email);
    		pstmt.setString(2, password);

    		ResultSet rs = pstmt.executeQuery();

    		if (rs.next()) {

    			user = new User();

    			user.setUserId(rs.getInt("userId"));
    			user.setUsername(rs.getString("username"));
    			user.setPassword(rs.getString("password"));
    			user.setEmail(rs.getString("email"));
    			user.setAddress(rs.getString("address"));
    			user.setPhoneNumber(rs.getString("phoneNumber"));
    			user.setRole(rs.getString("role"));

    		}

    	} catch (SQLException e) {
    		e.printStackTrace();
    	}

    	return user;
    }
    
    @Override
    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();
        User user=null;
        Connection connection = getConnection();
        if (connection == null) {
            System.err.println("UserDaoImpl.getAllUsers: Connection is null");
            return users;
        }

        try (PreparedStatement pstmt = connection.prepareStatement(FETCH_ALL_USERS);
             ResultSet result = pstmt.executeQuery()) {

            while (result.next()) {
            	int userId=result.getInt("userId");
				String username=result.getString("username");
				String password=result.getString("password");
				String email=result.getString("email");
				String address=result.getString("address");
				String phoneNumber=result.getString("phoneNumber");
				String role=result.getString("role");
				Timestamp createdDate=result.getTimestamp("createdDate");
				Timestamp lastLoginDate=result.getTimestamp("lastLoginDate");
				user =new User(userId,username,password,email,address,phoneNumber,role,createdDate,lastLoginDate);
				users.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    
    @Override
    public List<User> searchCustomers(String keyword) {

        List<User> users = new ArrayList<>();
        Connection connection = getConnection();
        if (connection == null) {
            System.err.println("UserDaoImpl.searchCustomers: Connection is null");
            return users;
        }

        try (PreparedStatement ps = connection.prepareStatement(SEARCH_CUSTOMERS)) {

            String key = "%" + keyword + "%";

            ps.setString(1, key);
            ps.setString(2, key);
            ps.setString(3, key);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User user = new User(
                        rs.getInt("userId"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("phoneNumber"),
                        rs.getString("role"),
                        rs.getTimestamp("createdDate"),
                        rs.getTimestamp("lastLoginDate")
                );

                users.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
}