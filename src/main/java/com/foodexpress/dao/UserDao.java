package com.foodexpress.dao;

import java.util.List;
import com.foodexpress.model.User;

public interface UserDao {
    void addUser(User user);
    User getUser(int userId);
    void updateUser(User user);
    void deleteUser(int userId);
    User getUser(String email, String password);
    List<User> getAllUsers();
    List<User> searchCustomers(String keyword);
}