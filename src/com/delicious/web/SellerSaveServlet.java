package com.delicious.web;

import java.io.IOException;
import java.sql.Connection;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.delicious.dao.*;
import com.delicious.util.*;
import com.delicious.model.*;

public class SellerSaveServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	SellerDao sellerDao=new SellerDao();

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String shopName=request.getParameter("shopname");
		String shopKepper=request.getParameter("shopkepper");
		String tel=request.getParameter("tel");
		String logo=request.getParameter("logo");
		String distance=request.getParameter("distance");
		String slogan=request.getParameter("slogan");
		String updateTime=request.getParameter("updatetime");
		String sellerId=request.getParameter("id");

	
		Seller seller=null;
		try {
		     seller =new Seller(shopName,shopKepper,tel,logo,Integer.parseInt(distance),slogan,updateTime);
		}  catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(StringUtil.isNotEmpty(sellerId)){
			seller.setSellerId(Integer.parseInt(sellerId));
		}
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(sellerId)){
				saveNums=sellerDao.sellerModify(con, seller);
			}else{
				saveNums=sellerDao.sellerAdd(con, seller);
				//System.out.println("hrh:"+saveNums);
			}
			if(saveNums>0){
				result.put("success", "true");
			}else{
				result.put("success", "true");
				result.put("errorMsg", "±£¥Ê ß∞‹");
			}
			ResponseUtil.write(response, result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
	}

	

}
