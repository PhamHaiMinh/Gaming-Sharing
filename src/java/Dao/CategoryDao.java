/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import Model.Category;
import java.util.ArrayList;

/**
 *
 * @author haimi
 */
public interface CategoryDao extends BaseDao<Category> {

    public ArrayList<Category> search(String name);

    public ArrayList<Category> getAll(int page);
}
