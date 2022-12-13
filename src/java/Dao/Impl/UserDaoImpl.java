/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.DBContext;
import Dao.UserDao;
import Model.Account;
import Model.Role;
import Model.User;
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

    @Override
    public List<User> getListUser(String roleId, String gender, String active) {
        DBContext dBContext = new DBContext();
        List<User> list = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "  select u.*, a.*,r.* from Account a left join [User] u on a.id =u.account_id\n"
                    + "  left join [Role] r on r.id = a.role_id \n"
                    + "  where a.role_id like  '%" + roleId + "%'  and u.gender like  '%" + gender + "%'  and a.active like  '%" + active + "%' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            System.out.println("sql");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setFirst_name(rs.getString(3));
                user.setMiddle_name(rs.getString(4));
                user.setLast_name(rs.getString(5));
                user.setGender(rs.getBoolean(6));
                user.setPhone(rs.getString(7));
                user.setAvt(rs.getString(8));
                Account account = new Account(rs.getInt(9), rs.getString(10), rs.getString(11), rs.getInt(14), rs.getString(12), rs.getBoolean(13), rs.getString(16));
                user.setAccount(account);
                list.add(user);
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    @Override
    public void deleteStaff(String id) {

        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "   delete [User] where account_id = ? \n"
                    + "  delete Account where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void changeStatus(String id, String status) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "   update Account set active = ? where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void updateStaff(String id, String status, String role) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "    update Account set active = ?,role_id = ? where id = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, role);
            ps.setString(3, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public List<Role> getAllRole() {
        DBContext dBContext = new DBContext();
        List<Role> list = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql = " select * from [Role] ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setRid(rs.getInt(1));
                role.setName(rs.getString(2));
                list.add(role);
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    @Override
    public User getById(String id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "  select u.*, a.*,r.* from Account a left join [User] u on a.id =u.account_id\n"
                    + "  left join [Role] r on r.id = a.role_id \n"
                    + "  where a.id = " + id;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setFirst_name(rs.getString(3));
                user.setMiddle_name(rs.getString(4));
                user.setLast_name(rs.getString(5));
                user.setGender(rs.getBoolean(6));
                user.setPhone(rs.getString(7));
                user.setAvt(rs.getString(8));
                Account account = new Account(rs.getInt(9), rs.getString(10), rs.getString(11), rs.getInt(14), rs.getString(12), rs.getBoolean(13), rs.getString(16));
                user.setAccount(account);
                return user;
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public static void main(String[] args) {
        new UserDaoImpl().updateStaff("1", "0", "2");

    }
}
