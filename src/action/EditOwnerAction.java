package action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import beans.Car;
import beans.Owner;
import beans.User;

import dao.CarDao;
import dao.OwnerDao;
import dao.UserDao;

public class EditOwnerAction {
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
		Owner owner=new Owner();
		
		owner.setName(name);
		owner.setPassword(password);
		
		BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");
    	OwnerDao  ownerDao=(OwnerDao) factory.getBean("OwnerDao");
		try{
			if(request.getParameter("id")!=null &&  !request.getParameter("id").equals("null")){ //如果有id,更新车辆信息		
				
				System.out.println("更新 id="+request.getParameter("id"));
				owner.setId(Integer.parseInt(request.getParameter("id")));
				ownerDao.update(owner);
			}else{  //添加新车
				System.out.println("添加");
				ownerDao.save(owner); 
			}  	
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("index3.jsp");

		
	}
}
