package com.delicious.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.delicious.model.FoodKind;
import com.delicious.model.FoodTaste;
import com.delicious.model.PageBean;
import com.delicious.util.StringUtil;

public class FoodTasteDao {
	public ResultSet tasteList(Connection con,PageBean pageBean,FoodTaste foodTaste)throws Exception{
		StringBuffer sb=new StringBuffer("select * from dr_taste");
		if(foodTaste!=null && StringUtil.isNotEmpty(foodTaste.getTasteName())){
			sb.append(" and foodtaste like '%"+foodTaste.getTasteName()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		//System.out.println(sb.toString());
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}

}
