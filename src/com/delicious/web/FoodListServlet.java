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


public class FoodListServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	FoodDao foodDao=new FoodDao();
	


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sellerId=request.getParameter("sellerid");
		String foodName=request.getParameter("foodname");
		//System.out.println(foodName);
		String foodKind=request.getParameter("kindid");
		String foodTaste=request.getParameter("tasteid");
		String foodStyle=request.getParameter("styleid");
		Food food=new Food();
		if(foodName!=null){
			if(StringUtil.isNotEmpty(sellerId)){
				food.setSellerId(Integer.parseInt(sellerId));
			}
			food.setFoodName(foodName);
			if(StringUtil.isNotEmpty(foodKind)){
				food.setFoodKind(Integer.parseInt(foodKind));
			}
			if(StringUtil.isNotEmpty(foodTaste)){
				food.setFoodTaste(Integer.parseInt(foodTaste));
			}
			if(StringUtil.isNotEmpty(foodStyle)){
				food.setFoodStyle(Integer.parseInt(foodStyle));
			}
		}
		
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
	
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(foodDao.foodList(con, pageBean,food));
			int total=foodDao.foodCount(con,food);
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
