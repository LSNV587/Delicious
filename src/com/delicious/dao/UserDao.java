package com.delicious.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.delicious.model.*;
import com.delicious.util.MD5;
public class UserDao {
	//登陆认证
	public User validateUser(Connection con,User user)throws Exception{
		String md5PassWord=MD5.getMD5(user.getPassWord());
		
		User resultUser=null;
		String sql="select * from dr_user where userName=? and password=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getPassWord());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			resultUser=new User();
			resultUser.setUserName(rs.getString("userName"));
			resultUser.setNickName(rs.getString("nickName"));
			//resultUser.setPassWord(rs.getString("password"));
		}
		return resultUser;
//		StringBuffer sb=new StringBuffer("select * from dr_user t where 1=1 ");
//		if(StringUtil.isNotEmpty(user.getUserName())&&StringUtil.isNotEmpty(user.getPassWord())){
//			sb.append(" and t.username="+user.getUserName()+" ");
//			sb.append(" and t.password="+user.getPassWord()+" ");
//			System.out.println(sb.toString());
//		
//			PreparedStatement pstmt=con.prepareStatement(sb.toString());
//			ResultSet rs=pstmt.executeQuery();
//			if(rs.next()){
//				System.out.println("11111111");
//				return "success";
//			}else{
//				System.out.println("222222");
//				return "failed";
//			}
//		}
//		else{
//			return "null";
//		}		
	}
	//注册新用户
	public int registerUser(Connection con,User user)throws Exception{
		String md5PassWord=MD5.getMD5(user.getPassWord());
		String sql="insert into dr_user values(null,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getPassWord());
		pstmt.setString(3,user.getNickName());
		pstmt.setString(4,"");
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    
		String datetime = tempDate.format(new java.util.Date());    
		pstmt.setString(5 ,datetime);	
		return pstmt.executeUpdate();
	}
//	public static void main(String args[]) throws Exception
//	{
//		User user =new User();
//		user.setUserName("hrh");
//		user.setPassWord("123456");
//		user.setPassWord(MD5.getMD5(user.getPassWord()));
//		user.setNickName("老酸奶");
//		user.setUserPicture("aaa.jpg");
//		user.setUpdateTime("20171125");
//		DbUtil dbUtil=new DbUtil();
//		UserDao userDao=new UserDao();
//		Connection con=null;
//		con=dbUtil.getCon();
//		int num=userDao.registerUser(con, user);
//		if(num>0) System.out.println("注册成功！");
//	}
	
}

