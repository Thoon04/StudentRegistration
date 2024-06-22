package student_registration.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import student_registration.models.Login;

import student_registration.models.User;

public class UserReposistory {
	public static Connection con=null;
	static {
		con = MyConnection.getConnection();
	}
	
	public int add(User user) { 
		int result=0;
		if (!checkEmail(user.getUserEmail())) {
		String sql="INSERT INTO user(userName,userEmail,password,confirmPassword,userRole) "
				+ "VALUES(?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getUserEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getConfirmPassword());
			ps.setString(5, user.getUserRole());
			result=ps.executeUpdate();
		
			
			
		}catch(SQLException e) {
			result=0;
			System.out.println("insert error: "+e);
		}
		}
		return result;
	}
	
	public int edit(User user) {
		int result=0;
		String sql="UPDATE user SET userID=?,userName=?,userEmail=?,password=?,confirmPassword=?,userRole=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getUserEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getConfirmPassword());
			ps.setString(5, user.getUserRole());
			result=ps.executeUpdate();
			
		}catch(SQLException e) {
			result=0;
			System.out.println("user edit error: "+e);
		}
		return result;
	}
	public int delete(Integer userId) {
		int result=0;
		String sql="DELETE FROM user WHERE userId=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1 , userId);
			result=ps.executeUpdate();
			
		}catch(SQLException e) {
			result=0;
			System.out.println("User delete err: "+e);
		}
		return result;
	}
	
	public List<User>getAll(){
		
		List<User> users=new ArrayList<>();
		String sql="SELECT * FROM user";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setPassword(rs.getString("password"));
				user.setConfirmPassword(rs.getString("confirmPassword"));
				user.setUserRole(rs.getString("userRole"));
			}
		}catch(SQLException e) {
			System.out.println("User select error: "+e);
		}
		return users;
	}
	
	public User getById(Integer userId) {
		User user=null;
		
		String sql="SELECT * FROM user WHERE userId=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, userId);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			user=new User();
			
			user.setUserId(rs.getInt("userId"));
			user.setUserName(rs.getString("userName"));
			user.setUserEmail(rs.getString("userEmail"));
			user.setPassword(rs.getString("password"));
			user.setConfirmPassword(rs.getString("confirmPassword"));
			user.setUserRole(rs.getString("userRole"));
		}
		}catch(SQLException e) {
			System.out.println("user select err: "+e);
		}
		return user;
	}
	public User loginUser(Login login) {
		
		User user=null;
		
		String sql="SELECT * FROM user where userEmail=? and password=?";
		
		try {
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setString(1, login.getUserEmail());
		ps.setString(2, login.getPassword());
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			user=new User();
			user.setUserId(rs.getInt("userId"));
			user.setUserName(rs.getString("userName"));
			user.setUserEmail(rs.getString("userEmail"));
			user.setPassword(rs.getString("password"));
			user.setConfirmPassword(rs.getString("confirmPassword"));
			user.setUserRole(rs.getString("userRole"));
			
		}
		
		
		}catch(SQLException e) {
			System.out.println("User Select :"+e.getMessage());
	}
	
		return user;
		
	}

	
	public boolean checkEmail(String userEmail) {
		boolean status=false;
		
		
		try {
			PreparedStatement ps = con.prepareStatement("select userEmail from user where userEmail=?");
			ps.setString(1,userEmail);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				status=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("check email :"+e.getMessage());
		}
		
		return status;
	}
	
}
