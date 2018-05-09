package com.delicious.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delicious.model.Admin;

public class AdminLoginServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName=request.getParameter("username");
		String passWord=request.getParameter("password");
		if(userName.equals("admin")&&passWord.equals("admin")){
			Admin admin=new Admin();
			admin.setUserName(userName);
			admin.setPassWord(passWord);
			HttpSession session=request.getSession();  //登陆成功，用户存入session中方便使用
			session.setAttribute("currentAdmin", admin);
			request.getRequestDispatcher("admin/main.jsp").forward(request, response);
			
		}

		
	}

}
