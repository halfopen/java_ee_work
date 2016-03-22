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

public class EditCarAction {
	private String name;
	private int car_owner;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	public int getCar_owner() {
		return car_owner;
	}
	public void setCar_owner(int car_owner) {
		this.car_owner = car_owner;
	}
	
	
	public void execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
	    ServletContext servletContext = ServletActionContext.getServletContext();
	    request.getSession();
	    HttpServletResponse response = ServletActionContext.getResponse();
		
		System.out.println("execute");
		System.out.print(name+" "+car_owner);
		Car car =new Car();
		
		car.setName(name);
		car.setOwnerId(car_owner);
		
		BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");
    	CarDao  carDao=(CarDao) factory.getBean("CarDao");
		try{
			if(request.getParameter("id")!=null &&  !request.getParameter("id").equals("null")){ //如果有id,更新车辆信息		
				
				System.out.println("更新 id="+request.getParameter("id"));
				car.setId(Integer.parseInt(request.getParameter("id")));
				carDao.update(car);
			}else{  //添加新车
				System.out.println("添加");
				carDao.save(car); 
			}  	
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("index3.jsp");

		
	}
}
