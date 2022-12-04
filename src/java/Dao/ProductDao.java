/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Product;
import java.util.List;

/**
 *
 * @author haimi
 */
public interface ProductDao extends BaseDao<Product>, BaseImageDao<Product> {

    public List<Product> search(String search);

    public List<Product> getAll(int page);

    public Product getLast();

}
