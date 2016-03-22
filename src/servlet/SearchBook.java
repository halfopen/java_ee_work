package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import beans.Book;

import dao.BookDao;

public class SearchBook extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchBook() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
        try {
        	String l_price = request.getParameter("l_price");
        	String h_price = request.getParameter("h_price");
        	//System.out.print("价格从"+l_price +" 到 "+h_price+" 的有:<br />");
        	
        	Double start = Double.parseDouble(l_price);
        	Double end = Double.parseDouble(h_price);
        	
        	BookDao bookDao = new BookDao();
        	//out.print(start+" "+end);
        	ArrayList books = bookDao.queryBooks(start, end);
        	//out.print(books);
        	
        	net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray.fromObject(books);
        	out.println(jsonArray.toString());
		} catch (Exception e) {
			// TODO: handle exception
			out.print("False");
		}
        
    	/*
    	JSONObject jsonObject = new JSONObject();  
    	
    	jsonObject.put("books", books);
    	
    	JSONArray jsonArray = new JSONArray();  
        jsonArray.add(jsonObject);  
    	PrintWriter out = response.getWriter();  
        out.write(jsonArray.toString());  */
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
