package com.delicious.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.delicious.model.*;
import com.delicious.util.*;;
public class SellerDao {
	
	public ResultSet sellerList(Connection con,PageBean pageBean,Seller seller)throws Exception{
		StringBuffer sb=new StringBuffer("select * from dr_seller a where 1=1 ");
				
		if(StringUtil.isNotEmpty(seller.getShopName())){
			sb.append(" and a.shopname like '%"+seller.getShopName()+"%'");
		}
		if(StringUtil.isNotEmpty(seller.getShopKepper())){
			sb.append(" and a.shopkepper like '%"+seller.getShopKepper()+"%'");
		}
		if(StringUtil.isNotEmpty(seller.getTel())){
			sb.append(" and a.tel like '%"+seller.getTel()+"%'");
		}
		
	
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		//System.out.println(sb.toString());
		return pstmt.executeQuery();
	}
	
	public int sellerCount(Connection con,Seller seller)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from dr_seller s where 1=1 ");
		if(StringUtil.isNotEmpty(seller.getShopName())){
			sb.append(" and s.shopname like '%"+seller.getShopName()+"%'");
		}
		if(StringUtil.isNotEmpty(seller.getShopKepper())){
			sb.append(" and s.shopkepper like '%"+seller.getShopKepper()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	public int sellerAdd(Connection con,Seller seller)throws Exception{
		String sql="insert into dr_seller values(null,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, seller.getShopName());
		pstmt.setString(2, seller.getShopKepper());
		pstmt.setString(3, seller.getTel());
		pstmt.setString(4, seller.getLogo());
		pstmt.setInt(5, seller.getDistance());
		pstmt.setString(6 ,seller.getSlogan());
		pstmt.setString(7, seller.getUpdateTime());
		return pstmt.executeUpdate();
	}
	public int sellerModify(Connection con,Seller seller)throws Exception{
		String sql="update dr_seller set shopname=?,shopkepper=?,tel=?,logo=?,distance=?,slogan=?,updatetime=? where sellerid=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, seller.getShopName());
		pstmt.setString(2, seller.getShopKepper());
		pstmt.setString(3, seller.getTel());
		pstmt.setString(4, seller.getLogo());
		pstmt.setInt(5, seller.getDistance());
		pstmt.setString(6 ,seller.getSlogan());
		pstmt.setString(7, seller.getUpdateTime());
		pstmt.setInt(8, seller.getSellerId());
		return pstmt.executeUpdate();
	}
	
	public int sellerDelete(Connection con,String delIds)throws Exception{
		String sql="delete from dr_seller where sellerid in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public ResultSet sellerComboList(Connection con,PageBean pageBean,Seller seller)throws Exception{
		StringBuffer sb=new StringBuffer("select t.sellerid,t.shopname from dr_seller t");
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	

}
