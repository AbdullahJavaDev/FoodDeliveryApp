package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Restarunt;
import daoimplementation.RestaruntDaoImp;

@WebServlet("/home")
public class HomeServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws  ServletException , IOException  {
		System.out.println("Servlet is get called");
		
		RestaruntDaoImp restaruntsobj1=new RestaruntDaoImp();
		
		List<Restarunt>restarunts=restaruntsobj1.getAllRestarunts();
		
	
		req.setAttribute("restarunts",restarunts);//This Object is Accessable to Home.jsp file
		
		//The Restarunt details forwarding to the Restarunt.jsp file
		RequestDispatcher rd=req.getRequestDispatcher("/HomeJsp/home.jsp");
		
		rd.forward(req,resp);
	
	}
}