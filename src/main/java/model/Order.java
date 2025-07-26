package model;

import java.sql.Timestamp;
import java.util.Date;

public class Order {

//Instance Variables
	
	private int orderId;
	private int userId;
	private int restaruntId;
	private java.util.Date orderDate;
	private double totalAmount;
	private String status;
	private String paymentMode;
	
//constructors
	
	public Order() {
		
	}
	
	
	public Order(int orderId, int userId, int restaruntId, Date orderDate, double totalAmount, String status,
			String paymentMode) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaruntId = restaruntId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMode = paymentMode;
	}

//Getters and setters
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRestaruntId() {
		return restaruntId;
	}

	public void setRestaruntId(int restaruntId) {
		this.restaruntId = restaruntId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

//Extracting the details
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", restaruntId=" + restaruntId + ", orderDate="
				+ orderDate + ", totalAmount=" + totalAmount + ", status=" + status + ", paymentMode=" + paymentMode
				+ "]";
	}


	public Object getOrderDate(Timestamp dateTime) {
		// TODO Auto-generated method stub
		return null;
	}
}
