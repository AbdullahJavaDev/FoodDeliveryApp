package dao;
import model.Restarunt;
import java.util.List;

import model.Restarunt;

public interface RestaruntDAO {
	
	//Get all Restaurant details
	public List getAllRestarunts();
	
	//Get a particular Restaurant
	public Restarunt getRestarunt(int id);
	
	//update the restaurant details
	public boolean updateRestarunt(Restarunt r);
	
	//insert the restaurant details
	public boolean insertRestarunt(Restarunt r);
	
	//delete the restaurant details
	public boolean  deleteRestarunt(int id);
	
}
