package com.delicious.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.delicious.dao.SysRecommendDao;
import com.delicious.model.SysRecommend;
import com.delicious.util.DbUtil;
import com.delicious.util.ResponseUtil;
import com.delicious.util.StringUtil;

public class SysRecommendSaveServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	SysRecommendDao sysRecDao=new SysRecommendDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String recid=request.getParameter("recid");
		String foodName=request.getParameter("foodname");
		String foodDesc=request.getParameter("fooddesc");
		String picUrl=request.getParameter("picurl");
		SysRecommend sysRec=new SysRecommend();
	     sysRec.setRecid(Integer.parseInt(recid));
		 sysRec.setFoodName(foodName);
		 sysRec.setFoodDesc(foodDesc);
		 sysRec.setPicUrl(picUrl);
		Connection con=null;
			try{
				con=dbUtil.getCon();
				int saveNums=0;
				JSONObject result=new JSONObject();
					saveNums=sysRecDao.sysRecModify(con, sysRec);
			
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
