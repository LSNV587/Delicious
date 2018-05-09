package com.delicious.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delicious.dao.FoodDao;
import com.delicious.model.Food;
import com.delicious.model.SysRecommend;
import com.delicious.util.DbUtil;

public class FoodMenuServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	FoodDao foodDao=new FoodDao();


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag=request.getParameter("flag");
		Connection con=null;
		List<Food> list=null;
		try{
			con=dbUtil.getCon();
			if(flag==null){
				 list=foodDao.foodMenuList(con,0);
			}
			 if(flag!=null){
				 if(flag.equals("distance")){
						list=foodDao.foodMenuList(con,1);
					}
				   if(flag.equals("price")){
						 list=foodDao.foodMenuList(con,2);
					} 
				   if(flag.equals("score")){
						 list=foodDao.foodMenuList(con,3);
					} 
			 }
			
			
		 		
		    request.setAttribute("foodlist",list);
		    request.getRequestDispatcher("jsp/menu.jsp").forward(request, response);
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
