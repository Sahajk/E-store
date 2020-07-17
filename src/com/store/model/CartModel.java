package com.store.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.store.entity.Cart;


public class CartModel {

	public int addCart(DataSource dataSource, Cart cartproduct) {
		// TODO Auto-generated method stub
		Connection connect = null;
		PreparedStatement statement = null;
		PreparedStatement st=null;
		try {
			connect = dataSource.getConnection();
			int pid =cartproduct.getPid();
			int qty=cartproduct.getQty();
			String sid=cartproduct.getSid();
			String uid=cartproduct.getUid();
			String query2= "Select * from cart where pid='"+pid+"' and sid='"+sid+"' and uid='"+uid+"'";
			st=connect.prepareStatement(query2);
			ResultSet rs = st.executeQuery();
			int count = 0;
			int serial = 0;
			if(rs.next()) {
				count = rs.getInt("qty");
				serial = rs.getInt("s_no");
			}
			if(count>0) {
				count++;
				String query ="update cart set qty=? where s_no="+serial;
				statement = connect.prepareStatement(query);
				statement.setInt(1,count);
				statement.execute();
			}
			else {
			String query ="insert into cart (pid,sid,qty,uid) values (?,?,?,?)";
			statement = connect.prepareStatement(query);
			statement.setInt(1,pid);
			statement.setString(2,sid);
			statement.setInt(3,qty);
			statement.setString(4,uid);
			statement.execute();
			}
			return 1;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
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

	public List<Cart> cartproducts(DataSource dataSource, String uid) {
		// TODO Auto-generated method stub
		List<Cart> cartproducts=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String query = "Select product.p_name,product.p_mrp,product.p_image,cart.s_no,cart.pid,cart.sid,cart.qty,cart.uid from product , cart  where uid='"+uid+"' and product.s_no=cart.pid ";
			 
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
	
				Cart rdd=new Cart();
				rdd.setS_no(rs.getInt("s_no"));
				rdd.setPid(rs.getInt("pid"));
				rdd.setSid(rs.getString("sid"));
				rdd.setQty(rs.getInt("qty"));
				rdd.setUid(rs.getString("uid"));
				rdd.setPmrp(rs.getInt("p_mrp"));
				rdd.setPname(rs.getString("p_name"));
				rdd.setPimage(rs.getString("p_image"));
				
				
				
				cartproducts.add(rdd);
				
			}
			con.close();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cartproducts;
	}

	public int updateCartInc(DataSource dataSource, Cart cartproduct) {
		// TODO Auto-generated method stub
		Connection connect = null;
		PreparedStatement statement = null;
		
		try {
			connect = dataSource.getConnection();
		
			int sno = cartproduct.getS_no();
			int qty=cartproduct.getQty();
			qty = qty+1;
			String query2 = "update cart  set  qty = ?  where s_no = ? ";
			statement = connect.prepareStatement(query2);
			
			statement.setInt(1, qty);
			statement.setInt(2, sno);
		
			statement.execute();
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		finally {
			try {
				connect.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
	}
	
	public int updateCartDec(DataSource dataSource, Cart cartproduct) {
		// TODO Auto-generated method stub
		Connection connect = null;
		PreparedStatement statement = null;
		
		try {
			connect = dataSource.getConnection();
		
			int sno = cartproduct.getS_no();
			int qty=cartproduct.getQty();
			qty = qty-1;
			if(qty==0) {
				return 0;
			}
			String query2 = "update cart  set  qty = ?  where s_no = ? ";
			statement = connect.prepareStatement(query2);
			
			statement.setInt(1, qty);
			statement.setInt(2, sno);
		
			statement.execute();
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		finally {
			try {
				connect.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
	}

	public void deleteItem(DataSource dataSource, Cart deletedItem) {
		// TODO Auto-generated method stub
		Connection connect = null;
		PreparedStatement statement = null;
		try {
			connect = dataSource.getConnection();
			int cartS_no = deletedItem.getS_no();
			
			String query = "delete from cart where s_no = ? ";
			statement = connect.prepareStatement(query);
			statement.setInt(1, cartS_no);
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
