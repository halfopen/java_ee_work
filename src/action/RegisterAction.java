package action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import dao.UserDao;

import beans.User;

public class RegisterAction {
	private String name;
	private String password;
	private String email;
	private int userType;
	public RegisterAction(){
		userType=1;  /*默认添加普通用户*/
	}
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
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
	    ServletContext servletContext = ServletActionContext.getServletContext();
	    request.getSession();
	    HttpServletResponse response = ServletActionContext.getResponse();
	    
	    Boolean resultBoolean=new UserDao().add(name, password, email, userType);
	    if(resultBoolean==true){
	    	response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("login.jsp");
	    }else{
	    	response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("info.jsp");
	    }
	}
}
