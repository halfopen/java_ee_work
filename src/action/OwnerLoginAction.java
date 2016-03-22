package action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import beans.Owner;
import beans.User;

import dao.OwnerDao;
import dao.UserDao;

public class OwnerLoginAction {
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
		
		System.out.println("execute");
		System.out.print(name+" "+password);
		Owner owner =null;
		BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");
    	OwnerDao  ownerDao=(OwnerDao) factory.getBean("OwnerDao");
    	owner = ownerDao.login(name, password);
    	System.out.println(owner);
    	if(owner == null){
    		System.out.println("登录失败");
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("info.jsp");
    	}else{
			System.out.print("登录成功");
            HttpSession session=request.getSession(true);  
            session.setAttribute("owner_id",owner.getId());  
            session.setAttribute("owner_name",owner.getName());  
            session.setAttribute("owner_type", owner.getType());
            System.out.println("用户类型:"+owner.getType());
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("index3.jsp");
		}		
		
	}
}
