/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.struts2.jasper.tagplugins.jstl.core.Out;

import com.sun.org.apache.xml.internal.security.algorithms.implementations.IntegrityHmac.IntegrityHmacSHA512;

import beans.Book;
import beans.User;

/**
 * @author halfopen
 *
 */
public class UserDao {
	/*登录*/
	public User login(String name, String password){
		User user=new User();

		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		
		//newUser.setLastLoginTime(time);
    	
    	Connection conn=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
			Statement stmt=conn.createStatement();
			String sql = "SELECT * FROM  `t_user` WHERE NAME='"+name+"' AND PASSWORD='"+password+"'";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next())
    		{
				System.out.println("login success");
				int id = Integer.parseInt(rs.getString("id"));
				//System.out.print(id);
				user.setId(id);
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setLastLoginTime(time);
				user.setLoginTimes(Integer.parseInt(rs.getString("login_times")) +1);
				user.setUserStatus(Integer.parseInt(rs.getString("status")));
				user.setUserType(Integer.parseInt(rs.getString("type")));
				
				sql = "UPDATE `t_user` SET `last_login_time` = '"+time+"' , login_times='"+user.getLoginTimes()+"' WHERE `t_user`.`id` = "+user.getId()+"";
				System.out.print(sql);
				int r = stmt.executeUpdate(sql);
    		}else{
    			System.out.println("用户不存在");
    			user=null;
    		}
			rs.close();
			
    	}catch (Exception e) {
			// TODO: handle exception
    		e.printStackTrace();
    		//user=null;
		}
		return user;
	}
	
	//删除用户
	public Boolean deleteUser(int id){
		Boolean resultBoolean=false;
    	
    	Connection conn=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
			Statement stmt=conn.createStatement();
			String sql = "DELETE FROM `mytest`.`t_user` WHERE `t_user`.`id` = "+id+"";
			System.out.println(sql);
			int rs=stmt.executeUpdate(sql);
			resultBoolean=true;
    	}catch (Exception e) {
			// TODO: handle exception
    		resultBoolean=false;
		}
		return resultBoolean;
	}
	/* 注册*/
	public Boolean add(String name, String password, String email, int userType){
		Boolean resultBoolean=false;
		//User newUser =new  User();
		/*
		newUser.setName(name);
		newUser.setPassword(password);
		newUser.setEmail(email);
		newUser.setUserType(userType);
		newUser.setUserStatus(0);
		newUser.setLoginTimes(0);
		*/
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		
		//newUser.setLastLoginTime(time);
		
    	
    	Connection conn=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
			Statement stmt=conn.createStatement();
			String sql = "INSERT INTO `t_user` (`id`, `name`, `password`, `email`, `last_login_time`, `login_times`, `type`, `status`) VALUES (NULL, '"+name+"', '"+password+"', '"+email+"', '"+time+"', '0', '"+userType+"', '0')";
			System.out.println(sql);
			int rs=stmt.executeUpdate(sql);
			resultBoolean=true;
    	}catch (Exception e) {
			// TODO: handle exception
    		resultBoolean=false;
		}
		return resultBoolean;
	}
	
	public Boolean update(int id, String name, String password, String email){
		Boolean resultBoolean=false;
    	
    	Connection conn=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
			Statement stmt=conn.createStatement();
			String sql = "UPDATE `mytest`.`t_user` SET `name` = '"+name+"', `password` = '"+password+"', `email` = '"+email+"' WHERE `t_user`.`id` = "+id+"";
			System.out.println(sql);
			int rs=stmt.executeUpdate(sql);
			resultBoolean=true;
    	}catch (Exception e) {
			// TODO: handle exception
    		resultBoolean=false;
		}
		return resultBoolean;
	}
		
	public ArrayList queryUsers(){
			
			ArrayList users = new ArrayList();
			
			Connection conn=null;
			try
	    	{
	        	Class.forName("com.mysql.jdbc.Driver");
	    		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
	    		Statement stmt=conn.createStatement();
	    		ResultSet rs=stmt.executeQuery("select * "+"from t_user ");
	    		while(rs.next())
	    		{
	    			User user = new User();
	    			user.setId(Integer.parseInt(rs.getString("id")) );
					user.setEmail(rs.getString("email"));
					user.setName(rs.getString("name"));
					user.setPassword(rs.getString("password"));
					user.setLastLoginTime(rs.getString("last_login_time"));
					user.setLoginTimes(Integer.parseInt(rs.getString("login_times")));
					user.setUserStatus(Integer.parseInt(rs.getString("status")));
					user.setUserType(Integer.parseInt(rs.getString("type")));
	    			users.add(user);
	    		}
	    		rs.close();
	    	}
	    	catch(Exception e){
	    		e.printStackTrace();
	    	}finally{
	    		try{
	    			if(conn!=null){
	    				conn.close();
	    				conn=null;
	    			}
	    			}catch (Exception e2) {
						// TODO: handle exception
	    				
					}
	    	}
	    	
			
			return users;
		}
	
	public User queryUser(int id){
		User user = new User();
		
		Connection conn=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
			Statement stmt=conn.createStatement();
			String sql = "SELECT * FROM  `t_user` WHERE ID='"+id+"'";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				user.setId(id);
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setLastLoginTime(rs.getString("last_login_time"));
				user.setLoginTimes(Integer.parseInt(rs.getString("login_times")));
				user.setUserStatus(Integer.parseInt(rs.getString("status")));
				user.setUserType(Integer.parseInt(rs.getString("type")));
			}
    	}catch (Exception e) {
			// TODO: handle exception
    		user = null;
		}
		return user;
	}
	
	
	public Boolean setAdmin(int id, int type){
		Boolean resultBoolean=false;
		
		Connection conn=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
			Statement stmt=conn.createStatement();
			String sql = "UPDATE `t_user` SET `type` = '"+type+"'  WHERE `id` = "+id+"";
			System.out.println(sql);
			int rs=stmt.executeUpdate(sql);
			resultBoolean=true;
    	}catch (Exception e) {
			// TODO: handle exception
    		resultBoolean=false;
		}
		
		return resultBoolean;
	}
	
	public Boolean setUserStatus(int id, int status){
		Boolean resultBoolean=false;
		
		Connection conn=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
			Statement stmt=conn.createStatement();
			String sql = "UPDATE `mytest`.`t_user` SET `status` = '"+status+"'  WHERE `t_user`.`id` = "+id+"";
			System.out.println(sql);
			int rs=stmt.executeUpdate(sql);
			resultBoolean=true;
    	}catch (Exception e) {
			// TODO: handle exception
    		resultBoolean=false;
		}
		
		return resultBoolean;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println(new UserDao().add("qxk", "bankaifuck", "halfopen@yeah.net", 1));
		System.out.print(new UserDao().setAdmin(7, 0));
	}

}
