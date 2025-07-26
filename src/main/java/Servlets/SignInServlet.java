package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daoimplementation.UserDaoImp;
import model.User;

@WebServlet("/Login")
public class SignInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("✅ Login servlet POST called");

        // 1️⃣ Get user credentials from form
        String email = req.getParameter("email");
        String passWord = req.getParameter("password");

        System.out.println("Email entered: " + email);
        System.out.println("Password entered: " + passWord);

        // 2️⃣ Check database for user
        UserDaoImp userDao = new UserDaoImp();
        User user = userDao.getUser(email, passWord);

        if (user != null) {
            // 3️⃣ Validate email and password (case-sensitive for password)
            if (email.equalsIgnoreCase(user.getEmail()) && passWord.equals(user.getPassWord())) {
                // ✅ Store user in session
                HttpSession session = req.getSession();
                session.setAttribute("currentUser", user);

                System.out.println("✅ User logged in: " + user.getName());

                // ✅ Redirect to home servlet or page
                resp.sendRedirect(req.getContextPath() + "/home");
                return;
            }
        }

        // ❌ If we reach here, login failed
        System.out.println("❌ Login failed, redirecting to signup");
        resp.sendRedirect(req.getContextPath() + "/RegLoginJsp/SignUp.jsp");
    }

   
}
