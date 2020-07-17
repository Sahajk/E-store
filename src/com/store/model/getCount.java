package com.store.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.HashMap;

import java.util.Map;

import javax.sql.DataSource;



public class getCount {

	public Map<String, Long> cList(DataSource dataSource) {
		// TODO Auto-generated method stub
		System.out.println("method innn" );
		Connection con=null;
		Statement st=null;
		Statement st1=null;
		Statement st2=null;
		Statement st3=null;
		ResultSet rs=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		Map<String,Long> map=new HashMap<>();
		
		
		try {
			con=dataSource.getConnection();
			String query = "Select count(*) from usersigndetails";
			String query1 = "Select count(*) from order_date";
			String query2 = "Select count(*) from product";
			String query3 = "Select count(*) from sellersignup";
			
						
			st = con.createStatement();
			st1=con.createStatement();
			st2=con.createStatement();
			st3=con.createStatement();
			
			rs = st.executeQuery(query);
			rs1 = st1.executeQuery(query1);
			rs2 = st2.executeQuery(query2);
			rs3 = st3.executeQuery(query3);
			
			
			Long userCount=(long) 0;
			Long orderCount=(long) 0;
			Long productCount=(long) 0;
			Long sellerCount=(long) 0;
			if(rs.next()) {
				 userCount=rs.getLong(1);
			}
			if(rs1.next()) {
				 orderCount=rs1.getLong(1);
			}
			if(rs2.next()) {
				 productCount=rs2.getLong(1);
			}
			if(rs3.next()) {
				 sellerCount=rs3.getLong(1);
			}
			
			
			map.put("userCount", userCount);
			map.put("orderCount", orderCount);
			map.put("productCount", productCount);
			map.put("sellerCount", sellerCount);
			
			System.out.print(userCount);
			
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
