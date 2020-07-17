package com.store.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import com.store.entity.Seller;


public class SellerModel {

	public boolean signupSeller(DataSource dataSource, Seller newSeller) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=dataSource.getConnection();
			String username=newSeller.getSname();
			String email=newSeller.getSid();
			String password=newSeller.getSpass();
			String city=newSeller.getScity();
			String address=newSeller.getSaddress();
			String simage=newSeller.getSellerImage();
			
			String query = "insert into sellersignup (s_id,s_name,s_address,s_city,s_pass,simage) values (?,?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, username);
			ps.setString(3, address);
			ps.setString(4, city);
			ps.setString(5, password);
			ps.setString(6, simage);
			
			ps.execute();
			con.close();

		return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean loginSeller(DataSource dataSource, Seller getSeller) {
		// TODO Auto-generated method stub
		Connection con;
		Statement st;
		
		try {
			con=dataSource.getConnection();
			st=con.createStatement();
			String email=getSeller.getSid();
			String password=getSeller.getSpass();
			ResultSet rs=st.executeQuery("select * from sellersignup where s_id='"+email+"'and s_pass='"+password+"'");
			if(rs.next()) {
				con.close();
				return true;
				
			}
			else {
				return false;
			}
			}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return false;
	}

	public List<Seller> sellerList(DataSource dataSource, String city) {
		List<Seller> sellerList=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String getcity=city;
		try {
			con=dataSource.getConnection();
			String query = "Select * from sellersignup where s_city='"+getcity+"'";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				
				Seller data=new Seller();
				data.setS_no(rs.getInt("s_no"));
				data.setSname(rs.getString("s_name"));
				data.setScity(rs.getString("s_city"));
				data.setSaddress(rs.getString("s_address"));
				data.setSid(rs.getString("s_id"));
				data.setSpass(rs.getString("s_pass"));
				data.setSellerImage(rs.getString("simage"));
				
				
				sellerList.add(data);
				
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return sellerList;
	
	}

	public List<Seller> allsellerList(DataSource dataSource) {
		// TODO Auto-generated method stub
		List<Seller> allsellerList=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=dataSource.getConnection();
			String query = "Select * from sellersignup ";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				
				Seller data=new Seller();
				data.setS_no(rs.getInt("s_no"));
				data.setSname(rs.getString("s_name"));
				data.setScity(rs.getString("s_city"));
				data.setSaddress(rs.getString("s_address"));
				data.setSid(rs.getString("s_id"));
				data.setSpass(rs.getString("s_pass"));
				data.setSellerImage(rs.getString("simage"));
				
				
				allsellerList.add(data);
				
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return allsellerList;
	}

	public List<Seller> sellerDetail(DataSource dataSource, String sid) {
		// TODO Auto-generated method stub
		List<Seller> sellerDetail=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=dataSource.getConnection();
			String query = "SELECT * FROM sellersignup where s_id='"+sid+"'";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				Seller data=new Seller();
				data.setS_no(rs.getInt("s_no"));
				data.setSname(rs.getString("s_name"));
				data.setScity(rs.getString("s_city"));
				data.setSaddress(rs.getString("s_address"));
				data.setSid(rs.getString("s_id"));
				data.setSpass(rs.getString("s_pass"));
				data.setSellerImage(rs.getString("simage"));
				
				
				sellerDetail.add(data);
				
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return sellerDetail;
	}

	public boolean updateSeller(DataSource dataSource, Seller updateSeller, String sid) {
		// TODO Auto-generated method stub
		Connection connect = null;
		PreparedStatement statement = null;
		
		try {
			connect = dataSource.getConnection();
		
			String name = updateSeller.getSname();
			String address = updateSeller.getSaddress();
			String city=updateSeller.getScity();
			String pass=updateSeller.getSpass();
			String query = "update sellersignup  set  s_name = ? ,s_address=?, s_pass=? , s_city=? where s_id = ?";
			statement = connect.prepareStatement(query);
			
			statement.setString(1, name);
			statement.setString(2, address);
			statement.setString(3, pass);
			statement.setString(4, city);
			statement.setString(5,sid);
			statement.execute();
			
			
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

	public boolean updateImage(DataSource dataSource, Seller sellerimage, String sid) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=dataSource.getConnection();
			String imagename=sellerimage.getSellerImage();
			String query = "update sellersignup  set simage = ? where s_id = ? ";
			ps=con.prepareStatement(query);
			ps.setString(1, imagename);
			ps.setString(2, sid);
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

	

	


