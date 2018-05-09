package com.delicious.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.delicious.dao.SysRecommendDao;
import com.delicious.model.Food;
import com.delicious.model.PageBean;
import com.delicious.model.SysRecommend;
import com.delicious.util.DbUtil;
import com.delicious.util.JsonUtil;
import com.delicious.util.ResponseUtil;

public class RecommendListServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	SysRecommendDao sysRecDao=new SysRecommendDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SysRecommend sysRec=new SysRecommend();
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(sysRecDao.sysRecList(con,pageBean, sysRec));
			//System.out.println("hrh--"+jsonArray.toString());
			//int total=sysRecDao.foodCount(con,food);
			result.put("rows", jsonArray);
			//result.put("total", total);
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
