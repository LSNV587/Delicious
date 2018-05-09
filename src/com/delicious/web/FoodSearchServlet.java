package com.delicious.web;

import java.io.IOException;
import java.io.PrintWriter;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.delicious.dao.*;
import com.delicious.util.*;
import com.delicious.model.*;

public class FoodSearchServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	FoodDao foodDao=new FoodDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String foodId=request.getParameter("id");
		Connection con=null;
		List<Food> list=null;
		try{
			con=dbUtil.getCon();
			if(foodId==null){
		    list=foodDao.foodSearchList(con);
		    request.setAttribute("searchlist",list);
		    request.getRequestDispatcher("jsp/search.jsp").forward(request, response);
			}else{
				List foodDetail=foodDao.findById(con, Integer.parseInt(foodId));
				 request.setAttribute("foodDetail",foodDetail);
				 request.getRequestDispatcher("jsp/detail.jsp").forward(request, response); 
			}
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
