package com.delicious.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.delicious.dao.*;
import com.delicious.model.*;
import com.delicious.util.*;
public class FoodKindDao {
	public ResultSet kindList(Connection con,PageBean pageBean,FoodKind foodKind)throws Exception{
		StringBuffer sb=new StringBuffer("select * from dr_kind");
		if(foodKind!=null && StringUtil.isNotEmpty(foodKind.getKindName())){
			sb.append(" and foodKind like '%"+foodKind.getKindName()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		//System.out.println(sb.toString());
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}

}
