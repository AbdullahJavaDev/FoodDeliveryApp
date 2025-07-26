package daoimplementation;
import dao.RestaruntDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionFactory;
import dao.RestaruntDAO;
import model.Restarunt;

public class RestaruntDaoImp implements RestaruntDAO{

//----------------------------------------------------------------------------------------------------------	
	@Override
	public List getAllRestarunts() {
		ArrayList<Restarunt>ar=new ArrayList<Restarunt>();
		Restarunt r=null;
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		String GET_ALL_RESTAURANTS="SELECT * FROM `Restaurant`";
		try {
			Statement stmt=con.createStatement();
			ResultSet res=stmt.executeQuery(GET_ALL_RESTAURANTS);
			while(res.next()) {
			r=extractRestarunt(res);
			ar.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return ar;
	}

//----------------------------------------------------------------------------------------------------------------------	
	@Override
	public Restarunt getRestarunt(int restaruntId) {
		Restarunt r=null;
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		String GET_RESTARUNT="SELECT * FROM `Restaurant` WHERE `RestaurantId`=?";
		try {
			PreparedStatement pstmt=con.prepareStatement(GET_RESTARUNT);
			pstmt.setInt(1, restaruntId);
			ResultSet res=pstmt.executeQuery();
			res.next();
			r=extractRestarunt(res);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

//---------------------------------------------------------------------------------------------------------------------	
	@Override
	public boolean updateRestarunt(Restarunt r) {
		
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		String UPDATE_RESTARUNT="UPDATE `Restarunt` SET `Name`=?, `Address`=?, `Phone`=?, `Rating`=?,`CuisineType`=?, `IsActive`=?, `Eta`=?, `AdminUserId`=?, `ImagePath`=? WHERE `RestaurantId`=?";
		try {
			PreparedStatement pstmt=con.prepareStatement(UPDATE_RESTARUNT);
			pstmt.setString(1,r.getName());
			pstmt.setString(2,r.getAddress());
			pstmt.setString(3,r.getPhone());
			pstmt.setDouble(4,r.getRating());
			pstmt.setString(5,r.getCusineType());
			pstmt.setBoolean(6,r.isActive());
			pstmt.setInt(7,r.getEta());
			pstmt.setInt(8,r.getAdminUserId());
			pstmt.setString(9,r.getImagePath());
			pstmt.setInt(10,r.getRestaurantId());
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

//--------------------------------------------------------------------------------------------------------------	
	@Override
	public boolean insertRestarunt(Restarunt r) {
		//Get the connection 
		Connection con=ConnectionFactory.requestConnection();
		String INSERT_RESTARUNT_DETAILS="INSERT INTO `Restaurant`(`Name`,`Address`,`Phone`,`Rating`,`cuisineType`,`IsActive`,`Eta`,`AdminUserId`,`ImagePath`) VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt=con.prepareStatement(INSERT_RESTARUNT_DETAILS);
			pstmt.setString(1,r.getName());
			pstmt.setString(2,r.getAddress());
			pstmt.setString(3,r.getPhone());
			pstmt.setDouble(4,r.getRating());
			pstmt.setString(5,r.getCusineType());
			pstmt.setBoolean(6, true);
			pstmt.setInt(7,r.getEta());
			pstmt.setInt(8,r.getAdminUserId());
			pstmt.setString(9,r.getImagePath());
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

//-----------------------------------------------------------------------------------------------------------	
	@Override
	public boolean deleteRestarunt(int restaruntId) {
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		String DELETE_RESTARUNT_DETAILS="DELETE FROM `Restaurant` WHERE `RestaurantId`=?";
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE_RESTARUNT_DETAILS);
			pstmt.setInt(1, restaruntId);
			int result=pstmt.executeUpdate();
			if(result>=1) {
				return true;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

//------------------------------------------------------------------------------------------------------------	
	//Extract the restaurant details
	public Restarunt extractRestarunt(ResultSet res) {
		Restarunt r=null;
		try {
			int restaruntId=res.getInt("RestaurantId");
			String name = res.getString("Name");
			String address=res.getString("Address");
			String phone=res.getString("Phone");
			float rating=res.getFloat("Rating");
			String cusineType=res.getString("CuisineType");
			boolean isActive=res.getBoolean("IsACtive");
			int eta=res.getInt("Eta");
			int adminUserId=res.getInt("AdminUserId");
			String imagePath=res.getString("ImagePath");
			r=new Restarunt(restaruntId,name,address,phone,rating,cusineType,isActive,eta,adminUserId,imagePath);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return r;
	}
//------------------------------------------------------------------------------------------------------------
}
