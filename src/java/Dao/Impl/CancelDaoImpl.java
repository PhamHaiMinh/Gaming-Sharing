/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.CancelDao;
import Dao.DBContext;
import Model.Cancel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author haimi
 */
public class CancelDaoImpl implements CancelDao {

    @Override
    public ArrayList<Cancel> getAll(int page) {
        DBContext dBContext = new DBContext();
        ArrayList<Cancel> cancels = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "select * from Cancel\n"
                    + "order by id asc\n"
                    + "offset ? rows fetch next 5 rows only";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cancel cancel = new Cancel();
                cancel.setId(rs.getInt("id"));
                cancel.setName(rs.getString("name"));
                cancels.add(cancel);
            }
        } catch (SQLException e) {
            Logger.getLogger(CancelDaoImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return cancels;
    }

    @Override
    public Cancel get(int id) {
        DBContext dBContext = new DBContext();
        Cancel cancel = new Cancel();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "select * from Cancel where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cancel.setId(rs.getInt("id"));
                cancel.setName(rs.getString("name"));
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(CancelDaoImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return cancel;
    }

    @Override
    public List<Cancel> getAll() {
        DBContext dBContext = new DBContext();
        ArrayList<Cancel> cancels = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "select * from Cancel";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cancel cancel = new Cancel();
                cancel.setId(rs.getInt("id"));
                cancel.setName(rs.getString("name"));
                cancels.add(cancel);
            }
        } catch (SQLException e) {
            Logger.getLogger(CancelDaoImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return cancels;
    }

    @Override
    public boolean insert(Cancel item) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "insert into Cancel (name) values(?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, item.getName());
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException e) {
            Logger.getLogger(CancelDaoImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    @Override
    public boolean update(Cancel item) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "UPDATE Cancel SET [name] = ? WHERE id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, item.getName());
            ps.setInt(2, item.getId());
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException e) {
            Logger.getLogger(CancelDaoImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "delete from Cancel  where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException e) {
            Logger.getLogger(CancelDaoImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

}
