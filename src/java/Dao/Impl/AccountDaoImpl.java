/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.AccountDao;
import Dao.DBContext;
import Model.Account;
import Model.SendEmail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author haimi
 */
public class AccountDaoImpl implements AccountDao {

    @Override
    public Account login(String username, String password) {
        DBContext dBContext = new DBContext();
        Account user = new Account();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "select id, username, password, role_id, email, active from Account where username  = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getBoolean(6)
                );
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return user;
    }

    @Override
    public void changePassword(String passString, int id) {
        DBContext dBContext = new DBContext();
        Connection connection = dBContext.getConnection();
        String sql = "update Account set [password]=? where [id]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, passString);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    @Override
    public String register(Account acc) {
        String email = acc.getEmail();
        String username = acc.getUsername();
        String password = acc.getPassword();
        DBContext dBContext = new DBContext();
        Connection connection = dBContext.getConnection();
        PreparedStatement st;
        try {
            st = connection.prepareStatement("SELECT * FROM Account where username=?");
            st.setString(1, username);
            //            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String checkUser = rs.getString("username");
                if (username.equals(checkUser)) {
                    return "Username already exist";
                    //                } else if (email.equals(checkMail)) {
                    //                    return "Email already exist";
                }
            } else {
                st = connection.prepareStatement("INSERT INTO Account(username, password, role_id, email) VALUES(?,?,?,?)");
                st.setString(1, username);
                st.setString(2, password);
                st.setInt(3, 3);
                st.setString(4, email);
                int i = st.executeUpdate();
                if (i != 0) {
                    SendEmail se = new SendEmail(email, username);
                    se.sendMail();
                    return "Success";
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "error";
    }

    public static void main(String[] args) {
        String email = "philonghiryu@gmail.com";
        String username = "longnt2";
        String password = "Ryu@0000";
        AccountDaoImpl accDao = new AccountDaoImpl();
        Account acc = new Account(username, password, 3, email);
        String msg = accDao.register(acc);
        System.out.println(msg);
    }

    @Override
    public boolean checkEmailExist(String email) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "  select id from Account where [email] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getString(1) == null) {
                    return false;
                } else {
                    return true;
                }
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
        return false;
    }

    @Override
    public void updatePass(String email, String password) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "   update Account set [password] = ? where  [email] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void changePassword(Account a) {
        DBContext dBContext = new DBContext();
        Connection connection = dBContext.getConnection();
        String sql = "update account set password=? where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getPassword());
            st.setString(2, a.getUsername());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public Account check(String username, String password) {
        String sql = "select * from Account where username=? and password=?";
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(
                        username,
                        password,
                        rs.getInt("role"),
                        rs.getString("email")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Account get(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[active]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[Account]\n"
                + "  where id = ?";
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(id, rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public boolean updateEmail(int id, String email) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "UPDATE [dbo].[Account]\n"
                    + "   SET [email] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setInt(2, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException e) {
            System.out.println("Error at account");
        }
        return false;
    }

}