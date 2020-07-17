package com.store.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import com.store.entity.MainCategory;


public class MainCategoryModel {

	public List<MainCategory> mList(DataSource dataSource) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				List<MainCategory> mList=new ArrayList<>();
				Connection con=null;
				Statement st=null;
				
				ResultSet rs=null;
				
				try {
					con=dataSource.getConnection();
					String query = "Select * from maincategory";
					
					st = con.createStatement();
					rs = st.executeQuery(query);
					while(rs.next()) {
						
						
						MainCategory rdd=new MainCategory(rs.getInt("s_no"),rs.getString("c_name"));
						mList.add(rdd);
						
						}
					con.close();
//					String query2="Select * from subcategory where mc_id="+rs.getInt("s_no");
//					st2 = con.createStatement();
//					rs2 = st.executeQuery(query2);
//					ArrayList<Subcategory> subcat=new ArrayList();
//					while(rs2.next()) {
//						Subcategory sc=new Subcategory(rs2.getInt("s_no"),rs2.getInt("mc_id"),rs2.getString("sc_name"));
//						subcat.add(sc);
//					}
					
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				return mList;
	}

}
