package dao;
import model.Menu;
import java.util.List;

import model.Menu;

public interface MenuDAO {

	//Get the All menu details
	public List getAllMenuDetails(int restaruntId);
	
	//Get the a particular menuDetail
	public Menu getMenuDetails(int menuId);
	
	//Update the menu details
	public boolean updateMenuDetails(Menu m);
	
	//insert the menu details
	public boolean insertMenuDetails(Menu m);
	
	//delete the menu details
	public boolean  deleteMenuDetails(int id);
}
