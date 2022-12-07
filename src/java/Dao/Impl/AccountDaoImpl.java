/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.AccountDao;
import Dao.DBContext;
import Model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.SendEmail;
import Model.User;

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
            String sql = "select id, username, password, role_id, email, active from Account where username  = ? and password = ?";
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
                String checkMail = rs.getString("email");
                if (username.equals(checkUser)) {
                    return "Username already exist";
//                } else if (email.equals(checkMail)) {
//                    return "Email already exist";
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
            }
        } catch (SQLException e) {
        }
        return "error";
    }

    public static void main(String[] args) {
        String username = "longnt2";
        String password = "Long12345";
        String email = "longnt@gmail.com";
        int roleid = 0;
        Account acc = new Account(username, password, roleid, email);
        AccountDaoImpl ad = new AccountDaoImpl();
        System.out.println(ad.getProfile("4"));
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
    public User getProfile(String id) {
        DBContext dBContext = new DBContext();
        User user = new User();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "  select * from [User] where id =  " + id;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setFirst_name(rs.getString(3));
                user.setMiddle_name(rs.getString(4));
                user.setLast_name(rs.getString(5));
                user.setGender(rs.getBoolean(6));
                user.setPhone(rs.getString(7));
                user.setAvatar(rs.getString(8));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return user;
    }

    @Override
    public void updateProfile(String id, String first_name, String middle_name, String last_name, String genderString, String phoneString, String avt) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "   update [User] set [last_name] = ?   ,[middle_name]   = ?  ,[first_name] = ?   ,[gender] = ?   ,[phone] = ?   ,[avt] = ?  where [account_id] = " + id;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, last_name);
            ps.setString(2, middle_name);  
            ps.setString(3, first_name);
            ps.setString(4, genderString);
            ps.setString(5, phoneString);
            ps.setString(6, avt);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        
    }
}
