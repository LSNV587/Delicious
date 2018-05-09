package com.delicious.web;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.delicious.model.*;
import com.delicious.dao.SysRecommendDao;
import com.delicious.util.DbUtil;
import com.delicious.util.JsonUtil;
import com.delicious.util.ResponseUtil;

public class SysRecommendServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	SysRecommendDao sysRecDao=new SysRecommendDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con=null;
		try{
			con=dbUtil.getCon();
			List<SysRecommend> list=sysRecDao.arithmeticRec(con);
		    request.setAttribute("sysRecList",list);
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
