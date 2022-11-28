/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import java.util.List;

/**
 *
 * @author Admin
 */
public interface BaseDao<T> {

    T get(int id);

    List<T> getAll();

    boolean insert(T item);

    boolean update(T item);

    boolean delete(int id);

}
