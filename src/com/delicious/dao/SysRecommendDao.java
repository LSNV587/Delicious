package com.delicious.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.delicious.model.*;
import com.delicious.util.*;
import java.util.ArrayList;
import java.util.List;
public class SysRecommendDao {
	public List<SysRecommend> sysRecList (Connection con)throws Exception{
		String sql="select * from dr_sys_recommend";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		List<SysRecommend> list=new ArrayList<SysRecommend>();
		while(rs.next()){
			SysRecommend sysRec=new SysRecommend();
			sysRec.setRecid(rs.getInt("recid"));
			sysRec.setFoodName(rs.getString("foodname"));
			sysRec.setFoodDesc(rs.getString("fooddesc"));
			sysRec.setPicUrl(rs.getString("picurl"));
			list.add(sysRec);
		
		}
		return list;	
	}
	public ResultSet sysRecList(Connection con,PageBean pageBean,SysRecommend sysRec)throws Exception{
		StringBuffer sb=new StringBuffer("select * from dr_sys_recommend");	
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	public int sysRecModify(Connection con,SysRecommend sysRec)throws Exception{

		String sql="update dr_sys_recommend  set foodname=?,fooddesc=?,picurl=?  where recid=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, sysRec.getFoodName());
		pstmt.setString(2, sysRec.getFoodDesc());
		pstmt.setString(3, sysRec.getPicUrl());
		pstmt.setInt(4, sysRec.getRecid());
	
		return pstmt.executeUpdate();
	}
	public List<SysRecommend> arithmeticRec (Connection con)throws Exception{
		//1、获取商家距离D(distance): 0~20 km  -5D+100
		//2、获取菜品价格P(price): 0~500 ￥ -1/5P+100
		//3、获取用户评分S(score): 0~5.0  20S
		//4、总评分:T(total)=(D*X*5+P*Y/5+S*Z*20)/3
		//5、推荐排行榜前4几位
		String sql="SELECT x . * , ROUND( ( tot.fscore + tot.dscore + tot.sscore) /3, 2 ) AS pf  "+
                         "FROM ( SELECT t.foodid, t.foodname, ( 100 - t.foodprice /5 ) AS fscore,  " +
                         "( 100 - p.distance *5 ) AS dscore, (q.score *20) AS sscore FROM dr_food t, dr_seller p, ( "+
                         "SELECT m.foodid, (SUM( rate ) / COUNT( 1 )) AS score "+
                         "FROM dr_comment m GROUP BY m.foodid )q "+
                         "WHERE t.sellerid = p.sellerid AND q.foodid = t.foodid)tot, dr_food x "+
                         "WHERE x.foodid = tot.foodid ORDER BY pf DESC LIMIT 0 , 4 ";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		List<SysRecommend> list=new ArrayList<SysRecommend>();
		while(rs.next()){
			SysRecommend sysRec=new SysRecommend();
			sysRec.setRecid(rs.getInt("foodid"));
			sysRec.setFoodName(rs.getString("foodname"));
			sysRec.setFoodDesc(rs.getString("pf"));
			sysRec.setPicUrl(rs.getString("foodpicture"));
			list.add(sysRec);
		}
		return list;	
	}
	

}
