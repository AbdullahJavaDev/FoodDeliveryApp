package daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionFactory;
import dao.UserDAO;
import model.User;

public class UserDaoImp implements UserDAO {
	
	private static final String GET_ALL_USERS_QUERY="SELECT *FROM `User`";
	private static final String GET_USER_QUERY="SELECT * FROM `User` WHERE `email`=? and `passWord`=?";
	private static final String UPDATE_QUERY="UPDATE `User` SET `Name`=?, `PassWord`=? ,`Phone`=? ,`Address`=?, `Role`=? WHERE `UserId`=?";
	private static final String INSERT_USER_QUERY="INSERT INTO `User`(`Name`,`Username`,`PassWord`,`Email`,`Phone`,`Address`,`Role`)"
			+ "VALUES(?,?,?,?,?,?,?)";
	private static final String DELETE_USER_QUERY="DELETE FROM `User` WHERE UserId=?";
	
	
//----------------------------------------------------------------
	@Override
	public List getAllUsers() {
		ArrayList<User>ar=new ArrayList<User>();
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		try (Statement stmt=con.createStatement();
			ResultSet res=stmt.executeQuery(GET_ALL_USERS_QUERY);){
			while(res.next()) {
				User user=extractUser(res);
				ar.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ar;
	}
	
//-----------------------------------------------------------------------	
	@Override
	public User getUser(String email,String passWord) {
		User user=null;
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		//Complete the query
		try(PreparedStatement pstmt=con.prepareStatement(GET_USER_QUERY);
			) {
			pstmt.setString(1, email);
			pstmt.setString(2, passWord);
			ResultSet res=pstmt.executeQuery();	
			res.next();
			user=extractUser(res);
					
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return user;
	}
	
//-----------------------------------------------------------------	
	@Override
	public boolean updateUser(User user) {
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		//Complete the query
		try {
			PreparedStatement pstmt=con.prepareStatement(UPDATE_QUERY);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getPassWord());
			pstmt.setString(3,user.getPhone());
			pstmt.setString(4,user.getAddress());
			pstmt.setString(5,user.getRole());
			pstmt.setInt(6,user.getUserId());
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
	public boolean insertUser(User user) {
		//Get the Connection
		Connection con=ConnectionFactory.requestConnection();
		//Complete the Query
		try(PreparedStatement pstmt=con.prepareStatement(INSERT_USER_QUERY);) {
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getUsername());
			pstmt.setString(3,user.getPassWord());
			pstmt.setString(4,user.getEmail());
			pstmt.setString(5,user.getPhone());
			pstmt.setString(6,user.getAddress());
			pstmt.setString(7,user.getRole());
			int result=pstmt.executeUpdate();	
			if(result>=1) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

//------------------------------------------------------------------	
	@Override
	public boolean deleteUser(int UserId) {
		//Get the connection
		Connection con=ConnectionFactory.requestConnection();
		//complete the  query
		try(PreparedStatement pstmt=con.prepareStatement(DELETE_USER_QUERY);) {
			pstmt.setInt(1, UserId);
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
	public User extractUser(ResultSet res) throws SQLException {
		//Extracting the data
		int userId1=res.getInt("UserId");
		String name=res.getString("Name");
		String username=res.getString("Username");
		String passWord=res.getString("PassWord");
		String email=res.getString("Email");
		String phone=res.getString("Phone");
		String address=res.getString("Address");
		String role=res.getString("Role");
		
		User user=new User(userId1,name,username,passWord,email,phone,address,role,null,null);
		return user;
	}
//--------------------------------------------------------------------	
}	