package Servlets;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daoimplementation.MenuDaoImp;
import model.Cart;
import model.CartItem;
import model.Menu;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        System.out.println("Cart servlet get called");

        // Create the Session
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        // Get restaurant IDs
        Integer newRestaruntId = Integer.parseInt(req.getParameter("Restarunt_Id"));
        Integer currentRestaruntId = (Integer) session.getAttribute("Restarunt_Id");

        // Check condition if Cart is null or restaruntId != current_Restarunt_id
        if (cart == null || currentRestaruntId == null || !newRestaruntId.equals(currentRestaruntId)) {
            // 1. create a new cart
            cart = new Cart();
            // 2. add cart into session
            session.setAttribute("cart", cart);
            // 3. store restaurant id
            session.setAttribute("Restarunt_Id", newRestaruntId);
        }

        // Adding/updating/deleting items in the cart
        String action = req.getParameter("Action");
        if (action != null) {
            if (action.equalsIgnoreCase("add")) {
                addItem(req, cart);
            } else if (action.equalsIgnoreCase("update")) {
                updateItem(req, cart);
            } else if (action.equalsIgnoreCase("delete")) {
                deleteItem(req, cart);
            }
        }

        // Debug: print cart size
        System.out.println("Cart size after operation: " + cart.getItems().size());

        // Redirect to cart page
        resp.sendRedirect(req.getContextPath() + "/CartJsp/cart.jsp");
    }

    private void addItem(HttpServletRequest req, Cart cart) {
        try {
            int menuId = Integer.parseInt(req.getParameter("Menu_Id"));
            int quantity = Integer.parseInt(req.getParameter("Quantity"));

            MenuDaoImp menuDao = new MenuDaoImp();
            Menu item = menuDao.getMenuDetails(menuId);

            if (item != null) {
                CartItem cartItem = new CartItem(
                        item.getMenuId(),
                        item.getItemName(),
                        item.getPrice(),
                        quantity,
                        item.getImagePath()
                );

                // ✅ use the instance method on cart
                cart.addItem(cartItem);
                System.out.println("Item added: " + item.getItemName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateItem(HttpServletRequest req, Cart cart) {
        try {
            int menuId = Integer.parseInt(req.getParameter("Menu_Id"));
            int quantity = Integer.parseInt(req.getParameter("Quantity"));

            // ✅ use the instance method on cart
            cart.updateItem(menuId, quantity);
            System.out.println("Item updated: " + menuId + " qty=" + quantity);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteItem(HttpServletRequest req, Cart cart) {
        try {
            int menuId = Integer.parseInt(req.getParameter("Menu_Id"));

            // ✅ use the instance method on cart
            cart.deleteItem(menuId);
            System.out.println("Item deleted: " + menuId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
