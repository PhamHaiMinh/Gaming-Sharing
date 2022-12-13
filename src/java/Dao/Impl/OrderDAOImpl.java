/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.DBContext;
import Dao.OrderDAO;
import Model.Order;
import Model.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class OrderDAOImpl implements OrderDAO {

    @Override
    public int getProfitFromDate(Date date) {
        DBContext dBContext = new DBContext();
        int profit = -1;
        try {
            Connection connection = dBContext.getConnection();
            String sql = "SELECT sum(price * o.[quantity]) as sum \n"
                    + "  FROM [dbo].[Order] o left join Product p\n"
                    + "  on o.product_id = p.id\n"
                    + "  where o.create_time = ? and status_id = 4";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, date);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                profit = rs.getInt("sum");
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("Error at orderimpl");
        }
        return profit;
    }

    @Override
    public Order get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(Order item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Order item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Order> getPendingCancelOrderID() {
        DBContext dBContext = new DBContext();
        ArrayList<Order> orders = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select * , name\n"
                    + "from [dbo].[Order] o left join [Status Order] s\n"
                    + "on o.status_id = s.id\n"
                    + "where status_id = 5;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("oid"));
                o.setStatus(rs.getString("name"));
                o.setDay_create(rs.getDate("create_time"));
                orders.add(o);
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("Error at orderimpl");
        }
        return orders;
    }

    @Override
    public int getUserID(int order_id) {
        DBContext dBContext = new DBContext();
        int id = -1;
        try {
            Connection connection = dBContext.getConnection();
            String sql = "SELECT [oid]\n"
                    + "      ,[user_id]\n"
                    + "      ,[product_id]\n"
                    + "      ,[quantity]\n"
                    + "      ,[create_time]\n"
                    + "      ,[status_id]\n"
                    + "      ,[reason_to_cancel]\n"
                    + "  FROM [dbo].[Order]\n"
                    + "  where oid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("user_id");
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("Error at orderimpl");
        }
        return id;
    }

    @Override
    public Product getProductbyID(int order_id) {
        DBContext dBContext = new DBContext();
        Product p = new Product();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "SELECT [oid]\n"
                    + "      ,[user_id]\n"
                    + "      ,[product_id]\n"
                    + "      ,[quantity]\n"
                    + "      ,[create_time]\n"
                    + "      ,[status_id]\n"
                    + "      ,[reason_to_cancel]\n"
                    + "  FROM [dbo].[Order]\n"
                    + "  where oid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p.setId(rs.getInt("product_id"));
                p.setQuantity(rs.getInt("quantity"));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("Error at orderimpl");
        }
        return p;
    }

  
}
