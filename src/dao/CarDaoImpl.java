package dao;

import java.util.ArrayList;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import beans.Car;
import beans.Owner;

public class CarDaoImpl extends HibernateDaoSupport implements CarDao {
	
    @Override
	public ArrayList queryCars() {
		ArrayList arrayList = new ArrayList();
		arrayList = (ArrayList) getHibernateTemplate().find("from beans.Car");//选择所有车辆
		
		for(int i=0;i<arrayList.size();i++){
			System.out.println(i+" "+arrayList.get(i));
		}
		
		return arrayList;
	}

	@Override
	public ArrayList queryOwnerCars(int id) {
		ArrayList arrayList = new ArrayList();
		arrayList = (ArrayList) getHibernateTemplate().find("from beans.Car where ownerId="+id);//选择所有车辆
		
		for(int i=0;i<arrayList.size();i++){
			System.out.println(i+" "+arrayList.get(i));
		}
		
		return arrayList;
	}
	/*保存*/
	public void save(Car car){
         getHibernateTemplate().save(car);
    }
    
    public static void main(String[] args){
    	//System.out.println("test");
    	BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");
    	CarDao  carDao=(CarDao) factory.getBean("CarDao");
    	Car car = new Car();
    	car.setId(3);
    	car.setName("ooxxoo");
    	//carDao.save(car);
    	//carDao.delete(2);
    	carDao.update(car);
    }

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Car car = new Car();
		car.setId(id);
		getHibernateTemplate().delete("beans.Car", car);
	}

	@Override
	public void update(Car car) {
		// TODO Auto-generated method stub
		
		getHibernateTemplate().update("beans.Car", car);
	}

	@Override
	public Car queryCar(int id) {
		Car car = new Car();
		car =(Car) getHibernateTemplate().get("beans.Car",id);//选择所有车辆

		return car;
	}
	
	
	
    
}
