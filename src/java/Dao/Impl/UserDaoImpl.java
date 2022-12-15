/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.DBContext;
import Dao.UserDao;
import Model.Account;
import Model.Address;
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


    @Override
    public int getNumberGenOfStaff(boolean gender) {
        DBContext dBContext = new DBContext();
        int output = -1;
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select count(id) as count from [dbo].[User] "
                    + "where gender = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, gender);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                output = rs.getInt("count");
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return output;
    }

    @Override
    public User get2(int user_id) {
        DBContext dBContext = new DBContext();
        User user = new User();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "SELECT u.[id]\n"
                    + "                      ,[account_id]\n"
                    + "                         ,[last_name]\n"
                    + "                         ,[middle_name]\n"
                    + "                          ,[first_name]\n"
                    + "                          ,[gender]\n"
                    + "                         ,[phone]\n"
                    + "                    	  ,a.email\n"
                    + "						  ,p.full_name as province\n"
                    + "						  ,d.full_name as district\n"
                    + "						  ,w.full_name as ward\n"
                    + "						  ,address_detail\n"
                    + "                     FROM [dbo].[User] u left join Account a\n"
                    + "                     on u.account_id = a.id left join Address ad\n"
                    + "					 on u.id = ad.user_id left join wards w\n"
                    + "					 on ad.ward_code = w.code left join districts d\n"
                    + "					 on w.district_code = d.code left join provinces p\n"
                    + "					 on d.province_code = p.code\n"
                    + "                      where u.id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setFirst_name(rs.getString("first_name"));
                user.setMiddle_name(rs.getString("middle_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setGender(rs.getBoolean("gender"));
                user.setPhone(rs.getString("phone"));
                user.setAccount(new Account(rs.getInt("account_id"), rs.getString("email")));
                user.setId(user_id);
                user.setAddress(new Address(
                        rs.getString("province"),
                        rs.getString("district"),
                        rs.getString("ward"),
                        rs.getString("address_detail")
                ));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return user;
    }

    @Override
    public String getAddress(int id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "   select [address_detail] from [Address] where [user_id] =  " + id;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
}
