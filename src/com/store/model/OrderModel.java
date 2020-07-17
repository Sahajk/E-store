package com.store.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.sql.DataSource;

import com.store.entity.Cart;
import com.store.entity.Order;
import com.store.entity.OrderDetails;
import com.store.entity.Product;

public class OrderModel {

	public int addOrder(DataSource dataSource, OrderDetails odetails) {
		// TODO Auto-generated method stub
		Connection connect = null;
		PreparedStatement statement = null;
		PreparedStatement st=null;
		PreparedStatement st3=null;
		
		PreparedStatement st5=null;
		try {
			connect = dataSource.getConnection();
			String sid = null;
			String name = odetails.getUsername();
			String contact = odetails.getContact();
			String address = odetails.getAddress();
			String pay_mode = odetails.getPaymode();
			String uid=odetails.getUid();
			String date = new SimpleDateFormat("dd-MM-yy").format(new Date());
			String query2= "Select * from cart where uid='"+uid+"'";
			st=connect.prepareStatement(query2);
			ResultSet rs = st.executeQuery();
			ArrayList<Cart> cartList = new ArrayList<Cart>();
			while(rs.next()) {
				int pid=rs.getInt("pid");
				int qty=rs.getInt("qty");
				sid = rs.getString("sid");
				Cart data = new Cart();
				data.setPid(pid);
				data.setQty(qty);
				cartList.add(data);
			}
			String query ="insert into order_date (uid,sid,odate,name,address,contact,pay_mode) values (?,?,?,?,?,?,?)";
			statement = connect.prepareStatement(query);
			statement.setString(1,uid);
			statement.setString(2,sid);
			statement.setString(3,date);
			statement.setString(4,name);
			statement.setString(5,address);
			statement.setString(6,contact);
			statement.setString(7,pay_mode);
			statement.execute();
			
			int oid = 0;
			String query3 ="select max(s_no) as sno from order_date";
			st3=connect.prepareStatement(query3);
			ResultSet rs3 = st3.executeQuery();
			if(rs3.next()) {
				oid=rs3.getInt("sno");
			}
			System.out.println(oid);
			if(oid>0) {
				for(Cart c:cartList) {
					PreparedStatement st4=null;
					int pid = c.getPid();
					int qty = c.getQty();
				String query4 ="insert into orderdetail (order_id,pid,qty) values (?,?,?)";
				st4 = connect.prepareStatement(query4);
				st4.setInt(1,oid);
				st4.setInt(2,pid);
				st4.setInt(3,qty);
				st4.execute();
				}
				
				String query5 ="delete from cart where uid=?";
				st5 = connect.prepareStatement(query5);
				st5.setString(1,uid);
				st5.execute();
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
	
	public ArrayList<Product> getOrderProducts(DataSource dataSource, int order_id) {
		// TODO Auto-generated method stub
		Connection connect = null;
		PreparedStatement statement = null;
		ArrayList<Product> pList = new ArrayList<>();
		try {
			connect = dataSource.getConnection();
			String query2= "Select product.p_name,product.p_mrp,product.s_no,product.p_image,orderdetail.qty from product,orderdetail where orderdetail.order_id='"+order_id+"' and orderdetail.pid=product.s_no";
			statement=connect.prepareStatement(query2);
			ResultSet rs = statement.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("p_name");
				int mrp=rs.getInt("p_mrp");
				int qty=rs.getInt("qty");
				String image = rs.getString("p_image");
				int sno=rs.getInt("s_no");
				Product pr = new Product();
				pr.setP_image(image);
				pr.setP_name(pname);
				pr.setP_mrp(mrp);
				pr.setQty(qty);
				pr.setS_no(sno);
				pList.add(pr);
			}
			
						
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
		return pList;
	}
	
	public ArrayList<Order> getOrderListUser(DataSource dataSource, String uid) {
		// TODO Auto-generated method stub
		Connection connect = null;
		PreparedStatement statement = null;
		ArrayList<Order> oList = new ArrayList<>();
		try {
			connect = dataSource.getConnection();
			String query2= "select * from order_date where uid='"+uid+"'";
			statement=connect.prepareStatement(query2);
			ResultSet rs = statement.executeQuery();
			
			while(rs.next()) {
				int order_id = rs.getInt("s_no");
				int status = rs.getInt("status");
				String order_date = rs.getString("odate");
				String name = rs.getString("name");
				String contact = rs.getString("contact");
				String pay_mode = rs.getString("pay_mode");
				String address=rs.getString("address");
				String sid=rs.getString("sid");
				Order o = new Order();
				o.setContact(contact);
				o.setName(name);
				o.setOrder_id(order_id);
				o.setOrder_date(order_date);
				o.setPay_mode(pay_mode);
				o.setStatus(status);
				o.setAddress(address);
				o.setSid(sid);
				oList.add(o);
			}
			
						
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
		return oList;
	}
	
	public ArrayList<Order> getOrderListSeller(DataSource dataSource, String sid) {
		// TODO Auto-generated method stub
		Connection connect = null;
		PreparedStatement statement = null;
		ArrayList<Order> oList = new ArrayList<>();
		try {
			connect = dataSource.getConnection();
			String query2= "select * from order_date where sid='"+sid+"'";
			statement=connect.prepareStatement(query2);
			ResultSet rs = statement.executeQuery();
			
			while(rs.next()) {
				int order_id = rs.getInt("s_no");
				int status = rs.getInt("status");
				String order_date = rs.getString("odate");
				String name = rs.getString("name");
				String contact = rs.getString("contact");
				String pay_mode = rs.getString("pay_mode");
				String address=rs.getString("address");
				String uid=rs.getString("uid");
				
				Order o = new Order();
				o.setContact(contact);
				o.setName(name);
				o.setOrder_id(order_id);
				o.setOrder_date(order_date);
				o.setPay_mode(pay_mode);
				o.setStatus(status);
				o.setAddress(address);
				o.setUid(uid);
				oList.add(o);
			}
			
						
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
		return oList;
	}

}
