package dao;

import java.util.ArrayList;

import beans.Car;
import beans.Owner;

public interface OwnerDao {
    public void save(Owner owner); //保存
    public ArrayList queryOwners(); //查询所有
    public Owner queryOwner(int id);
    public void update(Owner owner);
    
    public Owner login(String name, String password);
}