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

/**
 *
 * @author haimi
 */
public class AccountDaoImpl implements AccountDao{

    @Override
    public Account login(String username, String password) {
        DBContext dBContext = new DBContext();
        Account user = new Account();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select * from Account where username  = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)
                        );
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, e);
        }
        return user;
    }
    public static void main(String[] args) {
        Account minh = new AccountDaoImpl().login("admin", "Pass@12345");
        System.out.println(minh.getUsername());
    }
    public String register(Account acc) throws SQLException {
        String email = acc.getEmail();
        String username = acc.getUsername();
        String password = acc.getPassword();
        DBContext dBContext = new DBContext();
        Connection connection= dBContext.getConnection();
        PreparedStatement st;
        try {
            st = connection.prepareStatement("SELECT * FROM Account where username=?");
            st.setString(1, username);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String checkUser = rs.getString("username");
                String checkMail = rs.getString("email");
                if (username.equals(checkUser)) {
                    return "Username already exist";
                } else if(email.equals(checkMail)){
                    return "Email already exist";
               
                } else {
                    st = connection.prepareStatement("INSERT INTO Account(username, password, roleid, email) VALUES(?,?,?,?)");
                    st.setString(1, username);
                    st.setString(2, password);
                    st.setInt(3, 1);
                    st.setString(4, email);

                    int i = st.executeUpdate();

                    if (i != 0) {
                        SendEmail se = new SendEmail(email, username);
                        se.sendMail();
                        return "Success";
                    }
                }
            }
        } catch (Exception e) {
        }
        return "error";
    }
}
