package com.delicious.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delicious.dao.UserDao;
import com.delicious.model.User;
import com.delicious.util.DbUtil;
import com.delicious.util.MD5;
import com.delicious.util.StringUtil;

public class RegisterServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	UserDao userDao=new UserDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		String userName=request.getParameter("userName");
		String nickname=request.getParameter("nickName");
		String nickName=null;
		if(nickname!=null){
		   nickName=new String(nickname.getBytes("ISO-8859-1"),"UTF-8");  
		}
		//System.out.println(nickName);
		String passWord=request.getParameter("passWord");
		request.setAttribute("userName", userName);
		request.setAttribute("nickName", nickName);
		request.setAttribute("passWord", passWord);
		if(StringUtil.isEmpty(userName)||StringUtil.isEmpty(passWord)||StringUtil.isEmpty(nickName)){
			request.setAttribute("error", "必填信息不能为");
			request.getRequestDispatcher("jsp/register.jsp").forward(request, response);
			return;
		}
		Connection con=null;
		try {
			con=dbUtil.getCon();
			User user=new User();
			//TODO:此处调用MD5加密函数，对密码进行加密转换
			String Md5Pass=MD5.getMD5(passWord);
			user.setUserName(userName);
			user.setNickName(nickName);
			user.setPassWord(Md5Pass);
			int flag=userDao.registerUser(con, user);
			if(flag>0){
				out.print("<script>alert('注册成功!即将跳转登陆页面...');window.location.href='jsp/login.jsp'</script>");
			}else{
				out.print("<script>alert('注册失败!');window.location.href='jsp/register.jsp'</script>");
				}
			User currentUser=userDao.validateUser(con, user); //登陆验证，并返回状态
		} catch (Exception e) {
		
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
