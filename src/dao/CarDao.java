package dao;

import java.util.ArrayList;

import beans.Car;

public interface CarDao {
    public void save(Car car); //保存车
    public void update(Car car);
    public void delete(int id);
    public ArrayList queryCars(); //查询所有车
    public Car queryCar(int id);
    public ArrayList queryOwnerCars(int id);
}