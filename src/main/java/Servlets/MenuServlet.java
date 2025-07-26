package Servlets;
import java.util.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoimplementation.MenuDaoImp;
import daoimplementation.RestaruntDaoImp;
import model.Menu;
import model.Restarunt;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws  ServletException , IOException  {
		
		System.out.println("Menu Servlet get called...");
		String id = req.getParameter("RestaruntId");
		System.out.println(id);
		int restaruntId = Integer.parseInt(id);
		
		//Creating the Object for MenuDaOImp
		
		RestaruntDaoImp restaruntsobj1=new RestaruntDaoImp();
		Restarunt restarunt=restaruntsobj1.getRestarunt(restaruntId);
		RequestDispatcher rd=req.getRequestDispatcher("/MenuJsp/menu.jsp");
		req.setAttribute("restarunt",restarunt);//This Object is Accessable to menu.jsp file
		
	
		//Fetch menuList According tho id
		MenuDaoImp menu = new MenuDaoImp();
		List<Menu> items = menu.getAllMenuDetails(restaruntId);
		req.setAttribute("menus", items);
		rd.forward(req,resp);
		
	}
	
}