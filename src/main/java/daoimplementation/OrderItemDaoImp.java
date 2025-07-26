package daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionFactory;
import dao.OrderItemDAO;
import model.OrderItem;


public class OrderItemDaoImp implements OrderItemDAO {
	
	private static final String GET_ALL_ORDER_ITEMS="SELECT * FROM `OrderItem`";
	private static final String GET_ORDER_ITEM="SELECT * FROM `OrderItem` WHERE `OrderItemId`=?";
	private static final String UPDATE_ORDER_ITEM="UPDATE `OrderItem` SET `Quantity`=?, `totalPrice`=? WHERE `OrderItemId`=?";
	private static final String INSERT_ORDER_ITEM="INSERT INTO `OrderItem`(`OrderId`,`MenuId`,`Quantity`,`TotalPrice`) VALUES(?,?,?,?)";
	private static final String DELETE_ORDERITEM_QUERY="DELETE FROM `OrderItem` WHERE `OrderItemId`=?";
	

//------------------------------------------------------------------	
	@Override
	public List getAllOrderItems() {
		ArrayList<OrderItem>ar=new ArrayList<OrderItem>();
		//Get connection
		Connection con=ConnectionFactory.requestConnection();
		try(Statement stmt=con.createStatement();
			ResultSet res=stmt.executeQuery(GET_ALL_ORDER_ITEMS);) {//no need to close the resource--try with resources
			
			while(res.next()) {
				int orderItemId=res.getInt(1);
				int orderId=res.getInt(2);
				int menuId=res.getInt(3);
				int quantity=res.getInt(4);
				float totalPrice=res.getFloat(5);
				OrderItem item=new OrderItem(orderId,menuId,quantity,totalPrice);
				ar.add(item);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ar;
	}
//----------------------------------------------------------------
	@Override
	public OrderItem getOrderItem(int orderItemId) {
		
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		//complete the query
		OrderItem item=null;
		try(PreparedStatement pstmt=con.prepareStatement(GET_ORDER_ITEM);
			ResultSet res=pstmt.executeQuery();) {
			pstmt.setInt(1,orderItemId);
			res.next();
			item=new OrderItem(res.getInt(2),res.getInt(3),res.getInt(4),res.getFloat(5));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return item;
	}

//----------------------------------------------------------------
	@Override
	public boolean updateOrderItem(OrderItem item) {
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		//complete the query
		try(PreparedStatement pstmt=con.prepareStatement(UPDATE_ORDER_ITEM);) {
			pstmt.setInt(1,item.getQuantity());
			pstmt.setFloat(2,item.getTotalPrice());
			pstmt.setInt(3,item.getOrderItemId());
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

//-----------------------------------------------------------------
	@Override
	public boolean insertOrderItem(OrderItem item) {
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		//complete the query
		try(PreparedStatement pstmt=con.prepareStatement(INSERT_ORDER_ITEM);) {
			pstmt.setInt(1,item.getOrderId());
			pstmt.setInt(2,item.getMenuId());
			pstmt.setInt(3,item.getQuantity());
			pstmt.setFloat(4,item.getTotalPrice());
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;	
	}

//----------------------------------------------------------------	
	@Override
	public boolean deleteOrderItem(int OrderItemId) {
		//Get the connection 
		Connection con=ConnectionFactory.requestConnection();
		//complete the query
		try(PreparedStatement pstmt=con.prepareStatement(DELETE_ORDERITEM_QUERY);) {
			pstmt.setInt(1,OrderItemId);
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
//----------------------------------------------------------------	
}
