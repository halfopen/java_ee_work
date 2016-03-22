package action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.OwnerDao;
import dao.UserDao;

import beans.Owner;
import beans.User;

public class OwnerRegisterAction {
	private String name;
	private String password;

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
	
	public void execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
	    ServletContext servletContext = ServletActionContext.getServletContext();
	    request.getSession();
	    HttpServletResponse response = ServletActionContext.getResponse();
	    BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");
    	OwnerDao  ownerDao=(OwnerDao) factory.getBean("OwnerDao");
    	Owner owner = new Owner();
    	owner.setName(name);
    	owner.setPassword(password);
    	owner.setType(1);
    	try{
    		ownerDao.save(owner);
        	response.setContentType("text/html; charset=utf-8");
    		response.sendRedirect("index3.jsp");
    	}catch (Exception e) {
			// TODO: handle exception
    		e.printStackTrace();
    		response.setContentType("text/html; charset=utf-8");
    		response.sendRedirect("info.jsp?info=注册失败");
		}
    	

	}
}
