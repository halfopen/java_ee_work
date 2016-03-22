package action;

import java.net.URLEncoder;
import java.net.URLDecoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.jasper.tagplugins.jstl.core.Out;

import beans.User;

import dao.UserDao;

public class LoginAction {
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
	
	@SuppressWarnings("deprecation")
	public void execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
	    ServletContext servletContext = ServletActionContext.getServletContext();
	    request.getSession();
	    HttpServletResponse response = ServletActionContext.getResponse();
		
		System.out.println("execute");
		System.out.print(name+" "+password);
		
		UserDao userDao = new UserDao();
		User user=new User();
		user=userDao.login(name, password);
		System.out.println(user);
		if(user==null){
			System.out.println("登录失败");
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("info.jsp?info=登录失败");
		}else{
			System.out.print("登录成功");
            //从已经建好的Session中取数据，如果没有Session则自动创建  
            HttpSession session=request.getSession(true);
            
            if(user.getUserStatus()==0){
            	response.setContentType("text/html; charset=utf-8");
            	String url = "info.jsp?info=user account locked!";
            	
    			response.sendRedirect(url);
    			return ;
            }
            
            //设置Session值  
            session.setAttribute("id",user.getId());  
            session.setAttribute("name",user.getName());  
            session.setAttribute("login_times",user.getLoginTimes());  
            session.setAttribute("last_login_time", user.getLastLoginTime());
            session.setAttribute("user_type", user.getUserType());
            System.out.println("用户类型:"+user.getUserType());
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("userHome.jsp");
		}
		
		
	}
}
