package com.delicious.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delicious.dao.SysRecommendDao;
import com.delicious.dao.UserDao;
import com.delicious.model.SysRecommend;
import com.delicious.util.DbUtil;

public class IndexServlet extends HttpServlet {
	
	DbUtil dbUtil=new DbUtil();
	SysRecommendDao sysRecDao=new SysRecommendDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con=null;
		try {
			con=dbUtil.getCon();
			List<SysRecommend> list=sysRecDao.arithmeticRec(con);
		    request.setAttribute("sysRecList",list);
			request.getRequestDispatcher("jsp/index.jsp").forward(request, response);
		}catch (Exception e) {
		
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
			
				e.printStackTrace();
			}
		}

		
	}


}
