package daoimplementation;
import dao.MenuDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Menu;
import connection.ConnectionFactory;
public class MenuDaoImp implements MenuDAO{
	
	private static final String GET_ALL_MENU_DETAILS="SELECT * FROM `menu` WHERE `RestaurantId` = ?";
	private static final String GET_MENU_DETAILS="SELECT * FROM `menu` WHERE `menuId`=?";
	private static final String UPDATE_MENU_DETAILS="UPDATE  `menu` SET `RestaurantId`=? , `ItemName`=? , `Description`=? , `Price`=? , `Rating`=? , `IsAvailable`=? ,`ImagePath`=? WHERE `MenuId`=?";
	private static final String INSERT_MENU_DETAILS="INSERT INTO `menu'(`RestaurantId`,`ItemName`,`Description`,`Price`,`Rating`,`IsAvailable`,`ImagePath`) VALUES(?,?,?,?,?,?,?)";
	private static final String DELETE_MENU_DETAILS="DELETE FROM `menu` WHERE `menuId`=?";
	
//-----------------------------------------------------------------------------------------------------------	
	@Override
	public List getAllMenuDetails(int restaruntId) {
		ArrayList<Menu>ar=new ArrayList<Menu>();
		Menu m=null;
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		
		try(PreparedStatement pstmt=con.prepareStatement(GET_ALL_MENU_DETAILS);){
			pstmt.setInt(1, restaruntId);
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				m=extractMenu(res);
				ar.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ar;
	}

//-------------------------------------------------------------------------------------------------------------------------------	

	@Override
	public Menu getMenuDetails(int menuId) {
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		Menu m=null;
		//complete the query
		try(PreparedStatement pstmt=con.prepareStatement(GET_MENU_DETAILS);
				) {
			pstmt.setInt(1,menuId);
			ResultSet res=pstmt.executeQuery();
			res.next();
			m=extractMenu(res);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
//------------------------------------------------------	

	@Override
	public boolean updateMenuDetails(Menu m) {
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		//complete the query
		
		try(PreparedStatement pstmt=con.prepareStatement(UPDATE_MENU_DETAILS);) {
			pstmt.setInt(1,m.getRestaurantId());
			pstmt.setString(2,m.getItemName());
			pstmt.setString(3,m.getDescription());
			pstmt.setFloat(4,m.getPrice());
			pstmt.setFloat(5,m.getRating());
			pstmt.setBoolean(6,m.isAvailable());
			pstmt.setString(7,m.getImagePath());
			pstmt.setInt(8,m.getMenuId());
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
//-------------------------------------------------------------------------------------------------------------------
	@Override
	public boolean insertMenuDetails(Menu m) {
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(INSERT_MENU_DETAILS);
			pstmt.setInt(1, m.getRestaurantId());
			pstmt.setString(2,m.getItemName());
			pstmt.setString(3,m.getDescription());
			pstmt.setFloat(4,m.getPrice());
			pstmt.setFloat(5,m.getRating());
			pstmt.setBoolean(6,m.isAvailable());
			pstmt.setString(7,m.getImagePath());
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

//------------------------------------------------------------------------------------------------	
	@Override
	public boolean  deleteMenuDetails(int menuId) {
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		//complete the query
		try(PreparedStatement pstmt=con.prepareStatement(DELETE_MENU_DETAILS);) {
			
			pstmt.setInt(1, menuId);
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

//---------------------------------------------------------------------------------------------------
//Extract the details
	public Menu extractMenu(ResultSet res) {
		Menu m=null;
		try {
			int menuId = res.getInt(1);
			int restaruntId=res.getInt(2);
			String itemName=res.getString(3);
			String description=res.getString(4);
			float price=res.getFloat(5);
			float rating=res.getFloat(6);
			boolean isAvailable=res.getBoolean(7);
			String imagePath=res.getString(8);
			m=new Menu(menuId,restaruntId,itemName,description,price,rating,isAvailable,imagePath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return m;	
	}
//---------------------------------------------------------------------------------------------------
}
