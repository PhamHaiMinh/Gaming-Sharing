/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class Order {
    private int id;
    private int user_id;
    private ArrayList<Product> products = new ArrayList<>();
    private String status;
    private java.sql.Date day_create;

    public Order() {
    }

    public Order(int id, int user_id, String status, Date day_create) {
        this.id = id;
        this.user_id = user_id;
        this.status = status;
        this.day_create = day_create;
    }
    
    public Order(int id, String status, Date day_create) {
        this.id = id;
        this.status = status;
        this.day_create = day_create;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDay_create() {
        return day_create;
    }

    public void setDay_create(Date day_create) {
        this.day_create = day_create;
    }
    
    
}
