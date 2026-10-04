package com.foodexpress.servlets;

import java.io.IOException;
import java.util.List;

import com.foodexpress.dao.MenuDao;
import com.foodexpress.dao.RestaurantDao;
import com.foodexpress.daoimpl.MenuDaoImpl;
import com.foodexpress.daoimpl.RestaurantDaoImpl;
import com.foodexpress.model.Menu;
import com.foodexpress.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menuList")
public class MenuListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDao menuDao;
    private RestaurantDao restaurantDao;

    @Override
    public void init() throws ServletException {

        menuDao = new MenuDaoImpl();
        restaurantDao = new RestaurantDaoImpl();

    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String restaurantIdParam =
                    request.getParameter("restaurantId");

            if (restaurantIdParam == null ||
                restaurantIdParam.trim().isEmpty()) {

                response.sendRedirect("restaurants");
                return;
            }

            int restaurantId =
                    Integer.parseInt(restaurantIdParam);


            // Get menu items

            List<Menu> menus =
                    menuDao.getMenusByRestaurant(restaurantId);


            // Get restaurant details

            Restaurant restaurant =
                    restaurantDao.getRestaurant(restaurantId);


            // Send data to JSP

            request.setAttribute(
                    "menus",
                    menus
            );

            request.setAttribute(
                    "restaurant",
                    restaurant
            );

            request.setAttribute(
                    "restaurantId",
                    restaurantId
            );

            request.setAttribute(
                    "activePage",
                    "restaurants"
            );


            // Open MenuList JSP

            request.getRequestDispatcher(
                    "MenuList.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("restaurants");

        }

    }


    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}