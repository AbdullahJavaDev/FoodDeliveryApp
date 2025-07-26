package Servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import dao.OrderItemDAO;
import daoimplementation.OrderDaoImp;
import daoimplementation.OrderItemDaoImp;
import model.Cart;
import model.CartItem;
import model.Order;
import model.OrderItem;
import model.User;

@WebServlet("/CheckoutServlet")
public class CheckOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDAO orderDao;
    private OrderItemDAO orderItemDao;

    @Override
    public void init() throws ServletException {
        orderDao = new OrderDaoImp();
        orderItemDao = new OrderItemDaoImp();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // ✅ Fetch cart and current logged-in user
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("currentUser"); // 🔥 FIX: use correct key

        // 🛑 Validate cart and user
        if (cart != null && user != null && !cart.getItems().isEmpty()) {

            String paymentMethod = req.getParameter("paymentMethod");
            String address = req.getParameter("address");

            int user_Id = user.getUserId();

            // ✅ fetch restaurant id from session
            Integer rest_Id = (Integer) session.getAttribute("Restarunt_Id");
            if (rest_Id == null) {
                rest_Id = 0; // fallback if not set
            }

            Timestamp dateTime = new Timestamp(new Date().getTime());
            double total_Price = 0.0;
            String status = "Confirm";

            // ✅ calculate total price
            for (CartItem item : cart.getItems().values()) {
                total_Price += item.getPrice() * item.getQuantity();
            }

            // ✅ build order object
            Order order = new Order();
            order.setOrderDate(dateTime);
            order.setPaymentMode(paymentMethod);
            order.setRestaruntId(rest_Id);
            order.setStatus(status);
            order.setUserId(user_Id);
            order.setTotalAmount(total_Price);
            
            // ✅ insert order and get generated order_id
            int generatedOrderId = orderDao.insertOrder(order);
            order.setOrderId(generatedOrderId); // 🔥 FIX: store ID in object

            // ✅ insert each item
            for (CartItem item : cart.getItems().values()) {
                int menuId = item.getId();
                int quantity = item.getQuantity();
                float price = (float) item.getPrice();
                float totalItemPrice = price * quantity;

                OrderItem oi = new OrderItem(generatedOrderId, menuId, quantity, totalItemPrice);
                orderItemDao.insertOrderItem(oi);
            }

            // ✅ clear cart and set order in session
            session.removeAttribute("cart");
            session.setAttribute("Order", order);

            // ✅ redirect to confirmation page (correct usage)
            String path = req.getContextPath() + "/OrderJsp/order.jsp";
 
            res.sendRedirect(path);

        } else {
            // ❌ Cart empty or user not logged in
            String path = req.getContextPath() + "/CartJsp/cart.jsp";
            res.sendRedirect(path);
        }
    }

}
