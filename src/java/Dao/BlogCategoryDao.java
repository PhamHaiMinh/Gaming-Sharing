/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import Model.BlogCategory;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public interface BlogCategoryDao {
    public ArrayList<BlogCategory> getListCategory();
    public int getTotalSearch(String catName);
    public ArrayList<BlogCategory> searchCategory(String name, int offset, int row_count);
}
