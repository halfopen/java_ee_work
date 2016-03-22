package dao;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import beans.Book;

import beans.Book;


public class BookDao {
	
	public Boolean addBook(String bookname, double bookprice){
		Connection conn=null;
		Boolean result = false;
		try
    	{
    		//1.加载驱动，使用反射知识
        	Class.forName("com.mysql.jdbc.Driver");
        	
    		//2.使用DriverManager获取数据库连接，其中返回的Connection就代表了Java程序和数据库的连接
    		//不同数据库的URL写法需要查看驱动文档，用户名、密码由DBA分配
    		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
    		//3.使用Connection来创建一个Statement对象
    		Statement stmt=conn.createStatement();
    		//4.执行SQL语句
    		//Statement有三种执行SQL语句的方法
    		String sql = "INSERT INTO T_BOOK (`BOOKID`, `BOOKNAME`, `BOOKPRICE`) VALUES (NULL, '"+bookname+"', '"+bookprice+"')";
    		System.out.println(sql);
    		int rs=stmt.executeUpdate(sql);
    		System.out.print(rs);
    		result=true;
    		/*while(rs.next())
    		{
    			
    			System.out.print(rs);
    		}*/
    		//rs.close();
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
		return result;
	}
	
	
	public Boolean updateBook(int id,String bookname, double bookprice){
		Connection conn=null;
		Boolean result = false;
		try
    	{
    		//1.加载驱动，使用反射知识
        	Class.forName("com.mysql.jdbc.Driver");
        	
    		//2.使用DriverManager获取数据库连接，其中返回的Connection就代表了Java程序和数据库的连接
    		//不同数据库的URL写法需要查看驱动文档，用户名、密码由DBA分配
    		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
    		//3.使用Connection来创建一个Statement对象
    		Statement stmt=conn.createStatement();
    		//4.执行SQL语句
    		//Statement有三种执行SQL语句的方法
    		String sql = "UPDATE `t_book` SET `BOOKNAME` = '"+bookname+"', `BOOKPRICE` = '"+bookprice+"' WHERE `t_book`.`BOOKID` = "+id;
    		System.out.println(sql);
    		int rs=stmt.executeUpdate(sql);
    		System.out.print(rs);
    		result=true;
    		/*while(rs.next())
    		{
    			
    			System.out.print(rs);
    		}*/
    		//rs.close();
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
		return result;
	}
	
	public Boolean deleteBook(int id){
		Connection conn=null;
		Boolean result = false;
		try
    	{
    		//1.加载驱动，使用反射知识
        	Class.forName("com.mysql.jdbc.Driver");
        	
    		//2.使用DriverManager获取数据库连接，其中返回的Connection就代表了Java程序和数据库的连接
    		//不同数据库的URL写法需要查看驱动文档，用户名、密码由DBA分配
    		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
    		//3.使用Connection来创建一个Statement对象
    		Statement stmt=conn.createStatement();
    		//4.执行SQL语句
    		//Statement有三种执行SQL语句的方法
    		String sql = "DELETE FROM `t_book` WHERE `BOOKID`="+id;
    		System.out.println(sql);
    		int rs=stmt.executeUpdate(sql);
    		System.out.print(rs);
    		result=true;
    		/*while(rs.next())
    		{
    			
    			System.out.print(rs);
    		}*/
    		//rs.close();
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
		return result;
	}
	
	public ArrayList queryBooks(double start, double end){
		
		ArrayList books = new ArrayList();
		
		Connection conn=null;
		try
    	{
    		//1.加载驱动，使用反射知识
        	Class.forName("com.mysql.jdbc.Driver");
        	
    		//2.使用DriverManager获取数据库连接，其中返回的Connection就代表了Java程序和数据库的连接
    		//不同数据库的URL写法需要查看驱动文档，用户名、密码由DBA分配
    		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
    		//3.使用Connection来创建一个Statement对象
    		Statement stmt=conn.createStatement();
    		//4.执行SQL语句
    		//Statement有三种执行SQL语句的方法
    		ResultSet rs=stmt.executeQuery("select * "+"from t_book where BOOKPRICE>"+start +" and BOOKPRICE <"+end);
    		while(rs.next())
    		{
    			//System.out.println(rs.getString(2));
    			Book book = new Book();
    			book.setBookid(rs.getString(1));
    			book.setBookname(rs.getString(2));
    			book.setBookprice( Double.parseDouble(rs.getString("BOOKPRICE")) );
    			books.add(book);
    			//book.disp();
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
    	
		
		return books;
	}
	
	public Book queryBook(int id){
			
			Book book = new Book();
			Connection conn=null;
			try
	    	{
	    		//1.加载驱动，使用反射知识
	        	Class.forName("com.mysql.jdbc.Driver");
	        	
	    		//2.使用DriverManager获取数据库连接，其中返回的Connection就代表了Java程序和数据库的连接
	    		//不同数据库的URL写法需要查看驱动文档，用户名、密码由DBA分配
	    		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
	    		//3.使用Connection来创建一个Statement对象
	    		Statement stmt=conn.createStatement();
	    		//4.执行SQL语句
	    		//Statement有三种执行SQL语句的方法
	    		ResultSet rs=stmt.executeQuery("select * "+"from t_book where BOOKID="+id);
	    		while(rs.next())
	    		{
	    			//System.out.println(rs.getString(2));
	    			
	    			book.setBookid(rs.getString(1));
	    			book.setBookname(rs.getString(2));
	    			book.setBookprice( Double.parseDouble(rs.getString("BOOKPRICE")) );
	    			//book.disp();
	    		}
	    		System.out.println(book);
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
	    	
			
			return book;
		}
	
	
	public static void main(String[] args){
		
//    	try
//    	{
//    		//1.加载驱动，使用反射知识
//        	Class.forName("com.mysql.jdbc.Driver");
//        	
//    		//2.使用DriverManager获取数据库连接，其中返回的Connection就代表了Java程序和数据库的连接
//    		//不同数据库的URL写法需要查看驱动文档，用户名、密码由DBA分配
//    		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","");
//    		//3.使用Connection来创建一个Statement对象
//    		Statement stmt=conn.createStatement();
//    		//4.执行SQL语句
//    		//Statement有三种执行SQL语句的方法
//    		ResultSet rs=stmt.executeQuery("select * "+"from t_book");
//    		while(rs.next())
//    		{
//    			System.out.println(rs.getString(2));
//    		}
//    	}
//    	catch(Exception e){
//    		e.printStackTrace();
//    	}
		
		new BookDao().updateBook(29, "adfasdf", 55);
	}
}
