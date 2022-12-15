/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import Model.Role;
import Model.User;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface UserDao extends BaseDao<User>{
    public List<User> getListUser(String roleIdString,String genderString,String active);
    public  void deleteStaff(String id);
    public void changeStatus(String id, String status);
    public void updateStaff(String id, String status, String role);
    public User getById(String id);
    public List<Role> getAllRole();
    public int getNumberGenOfStaff(boolean gender);
    public User get2(int user_id);
    public String getAddress(int id);
}
