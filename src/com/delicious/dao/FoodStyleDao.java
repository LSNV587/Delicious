package com.delicious.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.delicious.dao.*;
import com.delicious.model.*;
import com.delicious.util.*;
public class FoodStyleDao {
	public ResultSet styleList(Connection con,PageBean pageBean,FoodStyle foodStyle)throws Exception{
		StringBuffer sb=new StringBuffer("select * from dr_style");
		if(foodStyle!=null && StringUtil.isNotEmpty(foodStyle.getStyleName())){
			sb.append(" and foodKind like '%"+foodStyle.getStyleName()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		//System.out.println(sb.toString());
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}

}
