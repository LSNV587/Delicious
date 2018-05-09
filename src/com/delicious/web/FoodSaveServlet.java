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

public class FoodSaveServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	FoodDao foodDao=new FoodDao();

	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sellerId=request.getParameter("sellerid");
		String foodName=request.getParameter("foodname");
		String kindId=request.getParameter("kindid");
		String tasteId=request.getParameter("tasteid");
		String styleId=request.getParameter("styleid");
		String foodPicture=request.getParameter("foodpicture");
		String foodPrice=request.getParameter("foodprice");
		String updateTime=request.getParameter("updatetime");
		String remark=request.getParameter("remark");
		String Id=request.getParameter("foodid");

		
		Food food=null;
		try {
			food = new Food(Integer.parseInt(sellerId),foodName, Integer.parseInt(tasteId), Integer.parseInt(kindId),  Integer.parseInt(styleId),foodPicture,
				Double.parseDouble(foodPrice),remark,updateTime);
		}  catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(StringUtil.isNotEmpty(Id)){
			food.setId(Integer.parseInt(Id));
		}
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(Id)){
				saveNums=foodDao.foodModify(con, food);
			}else{
				saveNums=foodDao.foodAdd(con, food);
				//System.out.println("hrh:"+saveNums);
			}
			//System.out.println(saveNums);
			if(saveNums>0){
				result.put("success", "true");
			}else{
				result.put("errorMsg", "修改失败");
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
