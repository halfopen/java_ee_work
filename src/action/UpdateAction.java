package action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import dao.UserDao;

import beans.User;

public class UpdateAction {
	private String name;
	private String password;
	private String email;
	private int id;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
	    ServletContext servletContext = ServletActionContext.getServletContext();
	    request.getSession();
	    HttpServletResponse response = ServletActionContext.getResponse();
	    
	    Boolean resultBoolean=new UserDao().update(id, name, password, email);
	    if(resultBoolean==true){
	    	response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("login.jsp");
	    }
	}
}
