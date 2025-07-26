package dao;
import model.User;
import java.util.List;

import model.User;

public interface UserDAO {

	//Get the All the users
	public List getAllUsers();
	
	//Get the a particular user
	public User getUser(String email,String passWord);
	
	//Update the user details
	public boolean updateUser(User user);
	
	//insert the user details
	public boolean insertUser(User user);
	
	//delete the user details
	public boolean deleteUser(int UserId);
}
