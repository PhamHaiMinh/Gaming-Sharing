/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import Model.Order;

/**
 *
 * @author LENOVO
 */
public interface OrderDAO extends BaseDao<Order>{
    public int getProfitFromDate(java.sql.Date date);
}
