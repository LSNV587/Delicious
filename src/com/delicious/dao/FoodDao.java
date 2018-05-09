package com.delicious.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.delicious.model.*;
import com.delicious.util.*;
public class FoodDao {
	public ResultSet foodList(Connection con,PageBean pageBean,Food food)throws Exception{
		StringBuffer sb=new StringBuffer("select  a.foodid,a.sellerid,c.kindid,d.tasteid,e.styleid,b.shopname,a.foodname,c.kindname,d.tastename,e.stylename," +
				                                            "a.foodpicture,a.foodprice,a.remark,a.updatetime  from dr_food a,dr_seller b,dr_kind c,dr_taste d,dr_style e " +
				                                            " where a.sellerid=b.sellerid and a.foodkind=c.kindid and a.foodtaste=d.tasteid and a.foodstyle=e.styleid ");
		if(StringUtil.isNotEmpty(food.getFoodName())){
			sb.append(" and a.foodname like '%"+food.getFoodName()+"%'");
		}
		if(food.getSellerId()!=0){
			sb.append(" and a.sellerid ='"+food.getSellerId()+"'");
		}
		if(food.getFoodKind()!=0){
			sb.append(" and a.foodkind ='"+food.getFoodKind()+"'");
		}
		if(food.getFoodTaste()!=0){
			sb.append(" and a.foodtaste ='"+food.getFoodTaste()+"'");
		}
		if(food.getFoodStyle()!=0){
			sb.append(" and a.foodstyle ='"+food.getFoodStyle()+"'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		//System.out.println("foodDao:foodlist"+sb.toString());
		return pstmt.executeQuery();
	}
	public int foodAdd(Connection con,Food food)throws Exception{
		String sql="insert into dr_food values(null,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, food.getSellerId());
		pstmt.setString(2, food.getFoodName());
		pstmt.setInt(3, food.getFoodKind());
		pstmt.setInt(4, food.getFoodTaste());
		pstmt.setInt(5, food.getFoodStyle());
		pstmt.setString(6, food.getFoodPicture());
		pstmt.setDouble(7, food.getFoodPrice());
		pstmt.setString(8 ,food.getRemark());
		pstmt.setString(9, food.getUpdateTime());
		return pstmt.executeUpdate();
	}
	public int foodModify(Connection con,Food food)throws Exception{
		String sql="update dr_food set sellerid=?,foodname=?,foodkind=?,foodtaste=?,foodstyle=?,foodpicture=?,foodprice=?,remark=?,updatetime=? where foodid=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, food.getSellerId());
		pstmt.setString(2, food.getFoodName());
		pstmt.setInt(3, food.getFoodKind());
		pstmt.setInt(4, food.getFoodTaste());
		pstmt.setInt(5, food.getFoodStyle());
		pstmt.setString(6, food.getFoodPicture());
		pstmt.setDouble(7, food.getFoodPrice());
		pstmt.setString(8, food.getRemark());
		pstmt.setString(9, food.getUpdateTime());
		pstmt.setInt(10, food.getId());
		return pstmt.executeUpdate();
	}
	public int foodCount(Connection con,Food food)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from dr_food a where 1=1 ");		
		if(StringUtil.isNotEmpty(food.getFoodName())){
			sb.append(" and a.foodname like '%"+food.getFoodName()+"%'");
		}
		if(food.getSellerId()!=0){
			sb.append(" and a.sellerid ='"+food.getSellerId()+"'");
		}
		if(food.getFoodKind()!=0){
			sb.append(" and a.foodkind ='"+food.getFoodKind()+"'");
		}
		if(food.getFoodTaste()!=0){
			sb.append(" and a.foodtaste ='"+food.getFoodTaste()+"'");
		}
		if(food.getFoodStyle()!=0){
			sb.append(" and a.foodstyle ='"+food.getFoodStyle()+"'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		//System.out.println(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	public int foodDelete(Connection con,String delIds)throws Exception{
		String sql="delete from dr_food where foodid in("+delIds+")";
		//System.out.println(sql);
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public List<Food> foodMenuList (Connection con,int flag)throws Exception{
		String sql="";
		if(flag==0){
			//查询全部美食
		 sql="select * from dr_food t";
		}
		if(flag==1){
			//按距离排序
			sql="select t.* from dr_food t,dr_seller p where t.sellerid=p.sellerid order by p.distance asc ";
		}
		if(flag==2){
			//按价格排序
			sql="select t.* from dr_food t order by t.foodprice asc ";
		}
		if(flag==3){
			//好评排序算法
			sql="select x.* from dr_food x, (select t.foodid ,count(1) as num,sum(rate) as total," +   
					"(sum(rate)/count(1)) as score  from dr_comment t group by t.foodid)y " +
					"where x.foodid=y.foodid  order by y.score desc ";
		}
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		List<Food> list=new ArrayList<Food>();
		while(rs.next()){
			Food food=new Food();
		    food.setId(rs.getInt("foodid"));
		    food.setFoodName(rs.getString("foodname"));
		    food.setFoodPicture(rs.getString("foodpicture"));
		    food.setFoodPrice(rs.getInt("foodprice"));
		    food.setRemark(rs.getString("remark"));
			list.add(food);
		}
		return list;	
	}
	public List<Food> foodSearchList (Connection con)throws Exception{
		String sql="select * from dr_food ";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		List<Food> list=new ArrayList<Food>();
		while(rs.next()){
			Food food=new Food();
		    food.setId(rs.getInt("foodid"));
		    food.setFoodName(rs.getString("foodname"));
			list.add(food);
		}
		return list;	
	}
	public List findById(Connection con,int id)throws Exception{
		String sql="select  a.foodid,a.sellerid,c.kindid,d.tasteid,e.styleid,b.shopname,a.foodname,c.kindname,d.tastename,e.stylename," +
				 "a.foodpicture,a.foodprice,b.distance,b.slogan,a.updatetime  from dr_food a,dr_seller b,dr_kind c,dr_taste d,dr_style e " +
				" where a.sellerid=b.sellerid and a.foodkind=c.kindid and a.foodtaste=d.tasteid and a.foodstyle=e.styleid and a.foodid="+id;
		PreparedStatement pstmt=con.prepareStatement(sql);
		//pstmt.setInt(1,id);
		System.out.println(sql);
		ResultSet rs=pstmt.executeQuery();
		ArrayList list=new ArrayList();
		if(rs.next()){
		list.add(id);//0                                
		list.add(rs.getString("foodpicture"));//1
		list.add(rs.getString("shopname"));//2
		list.add(rs.getString("foodname"));//3
		list.add(rs.getString("kindname"));//4
		list.add(rs.getString("tastename"));//5
		list.add(rs.getString("stylename"));//6
		list.add(rs.getInt("foodprice"));//7
		list.add(rs.getInt("distance"));//8
		list.add(rs.getString("slogan"));//9
		list.add(rs.getString("updatetime"));//10
		}
		return list;
		
	}

}
