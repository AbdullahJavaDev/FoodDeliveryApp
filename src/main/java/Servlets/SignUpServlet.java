package Servlets;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoimplementation.UserDaoImp;
import model.User;

@WebServlet("/Reg")
public class SignUpServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		
		System.out.println("Register servlet get called");
		
		//Fetching the details from the form
		String firstName=req.getParameter("firstName");
		String lastName=req.getParameter("lastName");
		String name = firstName+lastName;
		String email= req.getParameter("email");
		String phone=req.getParameter("phone");
		String confirmPass=req.getParameter("confirmPassword");
		LocalDateTime createdDate = (LocalDateTime)LocalDateTime.now();
		String address = req.getParameter("addr");
		
		//Create the User Object
		User user = new User();
		user.setName(name);
		user.setCreatedDate(createdDate);
		user.setPhone(phone);
		user.setRole("user");
		user.setUsername(firstName+"@"+lastName);
		user.setAddress(confirmPass);
		user.setEmail(email);
		user.setPassWord(confirmPass);
		user.setAddress(address);
		user.setLastLogin("null");
		
		//Create the Object for UserDaoImp
		UserDaoImp userDao = new UserDaoImp();
		userDao.insertUser(user);
		String path = req.getContextPath()+"/RegLoginJsp/SignIn.jsp";
		resp.sendRedirect(path);
			
	}
		
}
