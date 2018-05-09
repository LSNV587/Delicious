package com.delicious.web;

import java.io.IOException;
import java.io.PrintWriter;

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


public class SellerListServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	SellerDao sellerDao=new SellerDao();

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String shopName=request.getParameter("shopname");
		String shopKepper=request.getParameter("shopkepper");
		String tel=request.getParameter("tel");
		Seller seller=new Seller();
		if(shopName!=null){
			if(StringUtil.isNotEmpty(shopName)){
				seller.setShopName(shopName);
			}
			if(StringUtil.isNotEmpty(shopKepper)){
				seller.setShopKepper(shopKepper);
			}
			if(StringUtil.isNotEmpty(tel)){
				seller.setTel(tel);
			}		
		}	
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(sellerDao.sellerList(con, pageBean,seller));
			int total=sellerDao.sellerCount(con,seller);
			result.put("rows", jsonArray);
			result.put("total", total);
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
