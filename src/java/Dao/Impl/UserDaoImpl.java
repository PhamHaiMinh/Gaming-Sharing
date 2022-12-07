/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.DBContext;
import Dao.UserDao;
import Model.Account;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class UserDaoImpl implements UserDao {

    @Override
    public User get(int id) {
        DBContext dBContext = new DBContext();
        User user = new User();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "  select * from [User] where account_id =  " + id;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setFirst_name(rs.getString(3));
                user.setMiddle_name(rs.getString(4));
                user.setLast_name(rs.getString(5));
                user.setGender(rs.getBoolean(6));
                user.setPhone(rs.getString(7));
                user.setAvt(rs.getString(8));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return user;
    }

    @Override
    public boolean update(User user) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "   update [User] set [last_name] = ?   ,[middle_name]   = ?  ,[first_name] = ?   ,[gender] = ?   ,[phone] = ?   ,[avt] = ?  where [account_id] = " + user.getId();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getLast_name());
            ps.setString(2, user.getMiddle_name());
            ps.setString(3, user.getFirst_name());
            ps.setBoolean(4, user.isGender());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getAvt());
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    @Override
    public List<User> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(User item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
