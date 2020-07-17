package com.store.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import javax.sql.DataSource;

import com.store.entity.Product;

public class ProductModel {

	public boolean addProduct(DataSource dataSource, Product product) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=dataSource.getConnection();
			String sId=product.getS_id();
			int scId=product.getSc_id();
			String pname=product.getP_name();
			String pdes=product.getP_des();
			String ptype=product.getP_type();
			int pmrp=product.getP_mrp();
			String pimage=product.getP_image();
			int mcId=product.getMc_id();
			
			String query = "insert into product (s_id,p_name,p_mrp,p_des,sc_id,p_type,p_image,mc_id) values (?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setString(1, sId);
			ps.setString(2, pname);
			ps.setInt(3, pmrp);
			ps.setString(4, pdes);
			ps.setInt(5, scId);
			ps.setString(6, ptype);
			ps.setString(7, pimage);
			ps.setInt(8,mcId);
			ps.execute();
			con.close();

		return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Product> pList(DataSource dataSource, String sId) {
		// TODO Auto-generated method stub
		List<Product> pList=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=dataSource.getConnection();
			String query = "Select * from product where s_id='"+sId+"'";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				
				
				Product rdd=new Product(rs.getInt("s_no"),rs.getString("p_name"),rs.getString("p_des"),rs.getInt("p_mrp"),rs.getInt("sc_id"),rs.getString("p_type"),rs.getString("p_image"),rs.getString("s_id"),rs.getInt("mc_id"));
				pList.add(rdd);
				
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return pList;
	}

	public List<Product> upList(DataSource dataSource) {
		// TODO Auto-generated method stub
		List<Product> upList=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String sellername="sahajkhatri19@gmail.com";
		try {
			con=dataSource.getConnection();
			String query = "Select * from product where s_id='"+sellername+"'";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
	
				Product rdd=new Product(rs.getInt("s_no"),rs.getString("p_name"),rs.getString("p_des"),rs.getInt("p_mrp"),rs.getInt("sc_id"),rs.getString("p_type"),rs.getString("p_image"),rs.getString("s_id"),rs.getInt("mc_id"));
				upList.add(rdd);
				
			}
			con.close();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return upList;
	}

	public List<Product> productList(DataSource dataSource, String sid) {
		// TODO Auto-generated method stub
		List<Product> productList=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=dataSource.getConnection();
			String query = "Select * from product where s_id='"+sid+"'";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				
				
				Product pd=new Product(rs.getInt("s_no"),rs.getString("p_name"),rs.getString("p_des"),rs.getInt("p_mrp"),rs.getInt("sc_id"),rs.getString("p_type"),rs.getString("p_image"),rs.getString("s_id"),rs.getInt("mc_id"));
				productList.add(pd);
				
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return productList;
	}

	public List<Product> productDetailList(DataSource dataSource, int pid) {
		// TODO Auto-generated method stub
		List<Product> productDetailList=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=dataSource.getConnection();
			String query = "Select * from product where s_no='"+pid+"'";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				
				
				Product pdddd=new Product(rs.getInt("s_no"),rs.getString("p_name"),rs.getString("p_des"),rs.getInt("p_mrp"),rs.getInt("sc_id"),rs.getString("p_type"),rs.getString("p_image"),rs.getString("s_id"),rs.getInt("mc_id"));
				productDetailList.add(pdddd);
				
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return productDetailList;
			}

	public List<Product> productListByCat(DataSource dataSource, String sid, int mid) {
		// TODO Auto-generated method stub
		List<Product> productListByCat=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=dataSource.getConnection();
			String query = "Select * from product where s_id='"+sid+"'and mc_id='"+mid+"'";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				
				
				Product pd=new Product(rs.getInt("s_no"),rs.getString("p_name"),rs.getString("p_des"),rs.getInt("p_mrp"),rs.getInt("sc_id"),rs.getString("p_type"),rs.getString("p_image"),rs.getString("s_id"),rs.getInt("mc_id"));
				productListByCat.add(pd);
				
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return productListByCat;
	}

	public List<Product> productListMS(DataSource dataSource, String sid, int mid) {
		// TODO Auto-generated method stub
		List<Product> productListMS=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=dataSource.getConnection();
			String query = "Select * from product where s_id='"+sid+"'and mc_id='"+mid+"'";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				
				
				Product pd=new Product(rs.getInt("s_no"),rs.getString("p_name"),rs.getString("p_des"),rs.getInt("p_mrp"),rs.getInt("sc_id"),rs.getString("p_type"),rs.getString("p_image"),rs.getString("s_id"),rs.getInt("mc_id"));
				productListMS.add(pd);
				
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return productListMS;
	}

	public boolean updateImage(DataSource dataSource, Product image, int pid) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=dataSource.getConnection();
			String imagename=image.getP_image();
			String query = "update product  set p_image = ? where s_no = ? ";
			ps=con.prepareStatement(query);
			ps.setString(1, imagename);
			ps.setInt(2, pid);
			ps.execute();
			con.close();
		return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public void updateProduct(DataSource dataSource, Product updateDetail, int upid) {
		// TODO Auto-generated method stub
		
		Connection connect = null;
		PreparedStatement statement = null;
		
		try {
			connect = dataSource.getConnection();
			String pname=updateDetail.getP_name();
			String pdes=updateDetail.getP_des();
			String ptype=updateDetail.getP_type();
			int pmrp=updateDetail.getP_mrp();
			int pid=updateDetail.getS_no();
			
			String query = "update product  set  p_name = ? ,p_des=?, p_type=? , p_mrp=? where s_no = ?";

			statement = connect.prepareStatement(query);
			
			statement.setString(1, pname);
			statement.setString(2, pdes);
			statement.setString(3, ptype);
			statement.setInt(4, pmrp);
			statement.setInt(5, pid);
		
			statement.execute();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
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

		
	}


