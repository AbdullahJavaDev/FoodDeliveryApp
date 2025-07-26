package dao;
import model.Order;
import java.util.List;

import model.Order;

public interface OrderDAO {
	
	//Get the  all the order details
	public List getAllOrders();
	
	//Get a particular Details
	public Order getOrder(int id);
	
	//update the order details
	public boolean updateOrder(Order o);
	
	//insert the  order details
	public int insertOrder(Order o);
	
	//delete the order details
	public boolean deleteOrder(int id);
}
