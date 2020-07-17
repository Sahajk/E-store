package com.store.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import com.store.entity.User;

public class UserModel {

	public boolean signupUser(DataSource dataSource, User newUser) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;
		try {
			con=dataSource.getConnection();
			String username=newUser.getName();
			String email=newUser.getUid();
			String password=newUser.getPass();
			String city=newUser.getCity();
			String address=newUser.getAddress();
			String pincode=newUser.getPincode();
			
			String query = "insert into usersigndetails (u_id,name,address,city,pincode,uimage) values (?,?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, username);
			ps.setString(3, address);
			ps.setString(4, city);
			ps.setString(5, pincode);
			ps.setString(6,"none.jpg");
			ps.execute();
			String query2 = "insert into userlogindetails (u_id,pass) values (?,?)";
			ps1=con.prepareStatement(query2);
			ps1.setString(1, email);
			ps1.setString(2, password);
			ps1.execute();
			con.close();
		return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public User loginCheck(DataSource dataSource, User getUser) {
		// TODO Auto-generated method stub
		Connection con;
		Statement st;
		User data =new User();
		try {
			con=dataSource.getConnection();
			st=con.createStatement();
			String email=getUser.getUid();
			String password=getUser.getPass();
			ResultSet rs=st.executeQuery("SELECT usersigndetails.name,usersigndetails.city FROM userlogindetails,usersigndetails where userlogindetails.u_id = '"+email+"' and userlogindetails.pass = '"+password+"' and usersigndetails.u_id=userlogindetails.u_id");
			
			if(rs.next()) {
				data.setName(rs.getString("name"));
				data.setCity(rs.getString("city"));
				con.close();
				return data;
			}
			else {
				return null;
			}
			}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return null;
	}

	public List<User> userDetail(DataSource dataSource, String uid) {
		// TODO Auto-generated method stub
		List<User> userDetail=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=dataSource.getConnection();
			String query = "SELECT usersigndetails.s_no, usersigndetails.uimage,usersigndetails.name,usersigndetails.city,usersigndetails.pincode,usersigndetails.address,usersigndetails.u_id, userlogindetails.pass FROM userlogindetails,usersigndetails where userlogindetails.u_id = '"+uid+"' and userlogindetails.u_id=usersigndetails.u_id";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				User rdd=new User();
				rdd.setS_no(rs.getInt("s_no"));
				rdd.setName(rs.getString("name"));
				rdd.setAddress(rs.getString("address"));
				rdd.setCity(rs.getString("city"));
				rdd.setPass(rs.getString("pass"));
				rdd.setPincode(rs.getString("pincode"));
				rdd.setUid(rs.getString("u_id"));
				rdd.setUimage(rs.getString("uimage"));
				userDetail.add(rdd);
				
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return userDetail;
	}

	public boolean updateUser(DataSource dataSource, User updateUser, String userid) {
		Connection connect = null;
		PreparedStatement statement = null;
		PreparedStatement st = null;
		try {
			connect = dataSource.getConnection();
		
			String name = updateUser.getName();
			String address = updateUser.getAddress();
			String pincode=updateUser.getPincode();
			String city=updateUser.getCity();
			String pass=updateUser.getPass();
			String query = "update usersigndetails  set  name = ? ,address=?, pincode=? , city=? where u_id = ?";
			String query2 = "update userlogindetails  set  pass = ?  where u_id = ? ";
			statement = connect.prepareStatement(query);
			
			statement.setString(1, name);
			statement.setString(2, address);
			statement.setString(3, pincode);
			statement.setString(4, city);
			statement.setString(5, userid);
			st = connect.prepareStatement(query2);
			
			st.setString(1, pass);
			st.setString(2,userid);
			statement.execute();
			st.execute();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			try {
				connect.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

	public boolean updateImage(DataSource dataSource, User userimage, String uid) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=dataSource.getConnection();
			String imagename=userimage.getUimage();
			String query = "update usersigndetails  set uimage = ? where u_id = ? ";
			ps=con.prepareStatement(query);
			ps.setString(1, imagename);
			ps.setString(2, uid);
			ps.execute();
			con.close();
		return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}


}
