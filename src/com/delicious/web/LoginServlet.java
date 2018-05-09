package com.delicious.web;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.delicious.dao.SysRecommendDao;
import com.delicious.dao.UserDao;
import com.delicious.model.SysRecommend;
import com.delicious.model.User;
import com.delicious.util.DbUtil;
import com.delicious.util.MD5;
import com.delicious.util.StringUtil;
public class LoginServlet extends HttpServlet {
	DbUtil dbUtil=new DbUtil();
	UserDao userDao=new UserDao();
	//SysRecommendDao sysRecDao=new SysRecommendDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String passWord=request.getParameter("passWord");
		request.setAttribute("userName", userName);
		request.setAttribute("passWord", passWord);
		if(StringUtil.isEmpty(userName)||StringUtil.isEmpty(passWord)){
			request.setAttribute("error", "用户名或密码不能为");
			request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
			return;
		}
		//User user=new User(userName,passWord);
		Connection con=null;
		try {
			con=dbUtil.getCon();
			User user=new User();
			//TODO:此处调用MD5加密函数，对密码进行加密转换
			String Md5Pass=MD5.getMD5(passWord);
			user.setUserName(userName);
			user.setPassWord(Md5Pass);
			User currentUser=userDao.validateUser(con, user); //登陆验证，并返回状态
			if(currentUser==null){
				request.setAttribute("error", "用户名或密码错误");
				request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
			}else{		
				HttpSession session=request.getSession();  //登陆成功，用户存入session中方便使用
				session.setAttribute("currentUser", currentUser);
				System.out.println(currentUser.getNickName());
//				List<SysRecommend> list=sysRecDao.sysRecList(con);
//			    request.setAttribute("sysRecList",list);
				request.getRequestDispatcher("index").forward(request, response);
				//response.sendRedirect("jsp/index.jsp");
			}
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

	


