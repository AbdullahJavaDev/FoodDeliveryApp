package model;

//POJO CLASS:
public class CartItem {

	//private fields
	private int id;
	private String name;
	private double price;
	private int quantity;
	private String imagePath;
	
	//Constructors
	public CartItem() {
		
	}
	
	public CartItem(int id,String name,double price,int quantity,String imagePath) {
		
		this.id =id;
		this.name=name;
		this.price=price;
		this.quantity=quantity;
		this.imagePath=imagePath;
	}
	
	//Settters
	public void setId(int id) {
		this.id= id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPrice(double price) {
		this.price=price;
	}
	public void setQuantity(int quantity) {
		this.quantity=quantity;
	}
	public void setImagePath() {
		this. imagePath=imagePath;
	}
	
	//Getters
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public double getPrice() {
		return price;
	}
	public int getQuantity() {
		return quantity;
	}
	
	public String getImagePath() {
		return imagePath;
	}
	
	//toString
	public String toString() {
		return "Id: "+id+"Name: "+name+"Price: "+price+"Quantity: "+quantity;
	}
	
}
