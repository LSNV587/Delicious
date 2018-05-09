package com.delicious.util;
import java.sql.Connection;
import java.sql.DriverManager;
public class DbUtil {
	//private String dbUrl="jdbc:mysql://rm-wz92xgx1257i75y77o.mysql.rds.aliyuncs.com:3306/db_delicious?characterEncoding=UTF-8";
	private String dbUrl="jdbc:mysql://127.0.0.1:3306/db_delicious?characterEncoding=UTF-8";
	private String dbUserName="root";
	private String dbPassword="123456";
	private String jdbcName="com.mysql.jdbc.Driver";
	
	/**
	 * ��ȡ��ݿ�����
	 * @return
	 * @throws Exception
	 */
	public Connection getCon() throws Exception{
		Class.forName(jdbcName);
		Connection con=DriverManager.getConnection(dbUrl,dbUserName,dbPassword);
		return con;
	}
	
	/**
	 * �ر���ݿ�����
	 * @param con
	 * @throws Exception
	 */
	public void closeCon(Connection con) throws Exception{
		if(con!=null){
			con.close();
		}
	}
	
	public static void main(String[] args) {
		DbUtil dbUtil=new DbUtil();
		try {	
			dbUtil.getCon();
			System.out.println("��ݿ����ӳɹ�");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
