package dao;

import java.util.List;

import model.OrderItem;

public interface OrderItemDAO {
	
	//Get the all OrderItems
	public  List getAllOrderItems();
	
	//Get the a particular OrderItem
	public OrderItem getOrderItem(int orderItemId);
	
	//Update the orderItem
	public boolean updateOrderItem(OrderItem item);
	
	//insert the OrderItem
	public boolean insertOrderItem(OrderItem item);
	
	//delete the OrderItem
	public boolean deleteOrderItem(int id);
}
