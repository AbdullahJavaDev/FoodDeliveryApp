package daoimplementation;
import model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import connection.ConnectionFactory;
import dao.OrderDAO;
import model.Order;

public class OrderDaoImp implements OrderDAO{
	private static final String GET_ALL_ORDERS="SELECT * FROM `Order`";
	private static final String GET_ORDER="SELECT * FROM `Order` WHERE `OrderId`=?";
	private static final String UPDATE_ORDER="UPDATE `Order` SET `OrderDate`=?, `TotalAmount`=?, `Status`=?, `PaymentMode`=? WHERE `OrderId`=?";
	private static final String INSERT_ORDER="INSERT INTO `Order`(`UserId`,`RestaurantId`,`OrderDate`,`TotalAmount`,`Status`,`PaymentMode`) VALUES(?,?,?,?,?,?,?)";
	private static final String DELETE_ORDER="DELETE FROM `Order` WHERE `OrderId`=?";
//----------------------------------------------------------------	
	@Override
	public List getAllOrders() {
		ArrayList<Order>ar=new ArrayList<Order>();
		Order o=null;
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		try (Statement stmt=con.createStatement();
			ResultSet res=stmt.executeQuery(GET_ALL_ORDERS);){
			while(res.next()) {
				o=extractDetails(res);
				ar.add(o);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return ar;
	}
//--------------------------------------------------------------------
	@Override
	public Order getOrder(int Orderid) {
		Order o=null;
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		try(PreparedStatement pstmt=con.prepareStatement(GET_ORDER);
			ResultSet res=pstmt.executeQuery();) {
			pstmt.setInt(1, Orderid);
			res.next();
			o=extractDetails(res);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return o;
	}
//--------------------------------------------------------------------	
	@Override
	public boolean updateOrder(Order o) {
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		try(PreparedStatement pstmt=con.prepareStatement(UPDATE_ORDER);) {
			pstmt.setDate(1,new java.sql.Date(o.getOrderDate().getTime()));
			pstmt.setDouble(2,o.getTotalAmount());
			pstmt.setString(3,o.getStatus());
			pstmt.setString(4,o.getPaymentMode());
			pstmt.setInt(5,o.getOrderId());
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
//--------------------------------------------------------------------	
	@Override
	public int insertOrder(Order o) {
	    int generatedId = -1;

	    // Get the Connection
	    Connection con = ConnectionFactory.requestConnection();

	    try (PreparedStatement pstmt = con.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS)) {

	        // ✅ Do NOT set order_id, let DB auto-generate it
	        pstmt.setInt(1, o.getUserId());
	        pstmt.setInt(2, o.getRestaruntId());
	        pstmt.setTimestamp(3, (Timestamp) o.getOrderDate()); // ✅ use Timestamp directly
	        pstmt.setDouble(4, o.getTotalAmount());
	        pstmt.setString(5, o.getStatus());
	        pstmt.setString(6, o.getPaymentMode());

	        int result = pstmt.executeUpdate();

	        if (result > 0) {
	            try (ResultSet rs = pstmt.getGeneratedKeys()) {
	                if (rs.next()) {
	                    generatedId = rs.getInt(1); // ✅ this is your generated order_id
	                }
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return generatedId;
	}
	
//--------------------------------------------------------------------
	@Override
	public boolean deleteOrder(int orderId) {
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		try(PreparedStatement pstmt=con.prepareStatement(DELETE_ORDER);) {
			pstmt.setInt(1, orderId);
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
//--------------------------------------------------------------------	
//Extracting the details
	public Order extractDetails(ResultSet res) {
		Order o=null;
		try {
			int orderId=res.getInt("OrderId");
			int userId=res.getInt("UserId");
			int restaurantId=res.getInt("RestaurantId");
			Date orderDate=res.getDate("OrderDate");
			double totalAmount=res.getDouble("totalAmount");
			String status=res.getString("Status");
			String paymentMode=res.getString("paymentMode");
			
			o=new Order(orderId,userId,restaurantId,orderDate,totalAmount,status,paymentMode);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return o;
	}	
//---------------------------------------------------------------------		
}
