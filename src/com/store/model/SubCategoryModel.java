package com.store.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import com.store.entity.Subcategory;

public class SubCategoryModel {


	public List<Subcategory> subList(DataSource dataSource, int mcId) {
		// TODO Auto-generated method stub
		List<Subcategory> subList=new ArrayList<>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String query = "Select * from subcategory where mc_Id='"+mcId+"'";
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				Subcategory rdd=new Subcategory(rs.getInt("s_no"),rs.getInt("mc_id"),rs.getString("sc_name"));
				subList.add(rdd);
				
				}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return subList;
	}

}
