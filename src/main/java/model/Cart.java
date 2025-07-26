package model;
import java.util.HashMap;
import java.util.Map;

public class Cart {
	
	//creatin the Map - DataStructure
	static Map<Integer,CartItem>cartItems=new HashMap<>();
	//Methods addItem and update item and delete
	
	public static void addItem(CartItem item) {
		int itemId = item.getId();
		if(cartItems.containsKey(itemId)) {
			 CartItem existingItem = cartItems.get(itemId);
			 existingItem.setQuantity(existingItem.getQuantity()+item.getQuantity());
		}
		else {
			cartItems.put(itemId,item);
		}
	}
	
	
	public static void updateItem(int itemId,int quantity) {
		
		if(cartItems.get(itemId).getQuantity()<=0) {
			cartItems.remove(itemId);
		}
		else {
			cartItems.get(itemId).setQuantity(quantity);
		}
	}
	
	
	public static void deleteItem(int itemId) {
		cartItems.remove(itemId);
	}
//------------------------------------------------------------------------------------------------
	public static Map<Integer,CartItem> getItems() {
		
		return cartItems;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
