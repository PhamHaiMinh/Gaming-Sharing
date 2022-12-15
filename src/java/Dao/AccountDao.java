/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Account;

/**
 *
 * @author haimi
 */
public interface AccountDao {

    Account login(String username, String password);

    boolean checkEmailExist(String email);

    void updatePass(String emailString, String password);

    String register(Account acc);

    void changePassword(Account a);

    Account check(String username, String password);

    Account get(int id);
    
    public boolean updateEmail(int id, String email);
    
}
