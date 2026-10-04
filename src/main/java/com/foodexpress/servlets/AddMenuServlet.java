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

@WebServlet("/addMenu")
public class AddMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDao menuDao;
    private RestaurantDao restaurantDao;

    @Override
    public void init() throws ServletException {

        menuDao = new MenuDaoImpl();
        restaurantDao = new RestaurantDaoImpl();

    }

    // Open AddMenu.jsp
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String restaurantIdParam =
                request.getParameter("restaurantId");

        if (restaurantIdParam != null &&
            !restaurantIdParam.trim().isEmpty()) {

            int restaurantId =
                    Integer.parseInt(restaurantIdParam);

            Restaurant restaurant =
                    restaurantDao.getRestaurant(restaurantId);

            request.setAttribute(
                    "selectedRestaurant",
                    restaurant
            );
        }

        List<Restaurant> restaurants =
                restaurantDao.getAllRestaurants();

        request.setAttribute(
                "restaurants",
                restaurants
        );

        request.getRequestDispatcher("AddMenu.jsp")
               .forward(request, response);
    }


    // Save Menu
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int restaurantId =
                    Integer.parseInt(
                            request.getParameter("restaurantId")
                    );

            String name =
                    request.getParameter("name");

            String description =
                    request.getParameter("description");

            double price =
                    Double.parseDouble(
                            request.getParameter("price")
                    );

            double rating =
                    Double.parseDouble(
                            request.getParameter("rating")
                    );

            String imageUrl =
                    request.getParameter("imageUrl");

            String type =
                    request.getParameter("type");

            boolean isAvailable =
                    request.getParameter("isAvailable") != null;


            Menu menu = new Menu();

            menu.setRestaurantId(restaurantId);
            menu.setName(name);
            menu.setDescription(description);
            menu.setPrice(price);
            menu.setRating(rating);
            menu.setImageUrl(imageUrl);
            menu.setType(type);
            menu.setAvailable(isAvailable);


            menuDao.addMenu(menu);


            response.sendRedirect(
                    "menuList?restaurantId=" + restaurantId
            );
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("restaurants");
        }
    }
}