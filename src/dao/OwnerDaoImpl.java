package dao;

import java.util.ArrayList;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import antlr.collections.List;
import beans.Car;
import beans.Owner;

public class OwnerDaoImpl extends HibernateDaoSupport implements OwnerDao {
	
    @Override
	public ArrayList queryOwners() {
		// TODO Auto-generated method stub
		ArrayList arrayList = new ArrayList();
		arrayList = (ArrayList) getHibernateTemplate().find("from beans.Owner");//选择所有车辆
		
		//for(int i=0;i<arrayList.size();i++){
			//System.out.println(i+" "+arrayList.get(i));
		//}
		
		return arrayList;
	}

	@Override
	public Owner queryOwner(int id) {
		// TODO Auto-generated method stub
		Owner owner = new Owner();
		owner =(Owner) getHibernateTemplate().get("beans.Owner",id);//选择所有车辆

		return owner;
	}

	public void save(Owner owner){
         getHibernateTemplate().save(owner);
    }
    
    public static void main(String[] args){
    	//System.out.println("test");
    	BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");
    	OwnerDao  ownerDao=(OwnerDao) factory.getBean("OwnerDao");
    	Owner owner = new Owner();
    	//owner.setName("qxk");
    	//owner.setPassword("qxk");
    	//owner.setType(1);
    	
    	//car.setName("oooo");
    	//carDao.save(car);
    	//ownerDao.save(owner);
    	//System.out.println(ownerDao.queryOwner(2));
    }

	@Override
	public Owner login(String name, String password) {
		// TODO Auto-generated method stub
		Owner owner=null;
		try{
			//Owner example = new Owner();
			//example.setName(name);
			//example.setPassword(password);
			//ArrayList result=(ArrayList) getHibernateTemplate().findByExample("beans.Owner", example);
			
			String hql= "from beans.Owner o where o.name=? and o.password=?";

			ArrayList result = (ArrayList) this.getHibernateTemplate().find(hql, new String[]{name, password});
			
			if(result.size()>0){ 
				owner=(Owner) result.get(0);
			}else{
				System.out.println(result);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		
		
		return owner;
	}

	@Override
	public void update(Owner owner) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update("beans.Owner",owner);
	}
    
    
    
}
