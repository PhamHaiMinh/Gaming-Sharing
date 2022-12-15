/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Product;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author haimi
 */
public interface ProductDao extends BaseDao<Product>, BaseImageDao<Product> {

    public List<Product> search(
            String sort,
            int categoryId,
            long minPrice,
            long maxPrice,
            String name
    );

    public List<Product> getAll(int page);

    public Product getLast();

    public Product getProductById(String id);

    public Product getProductbyOrder(Product input);


    public List<Product> getofCategory(int categoryId, int page);

    public List<Product> getofCategory(int id);

    public List<Product> getTop5OfCategory(int id);

    public Product getofUser(int id);

    public List<Product> getTop6New();

    public List<Product> getTop6View();

}
