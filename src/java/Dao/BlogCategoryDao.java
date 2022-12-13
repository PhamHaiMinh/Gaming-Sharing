/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import Model.BlogCategory;

/**
 *
 * @author Admin
 */
public interface BlogCategoryDao extends BaseDao<BlogCategory>{
    public boolean deleteCategory(String[] listIdDelete);
    public boolean isCategoryExist(String name);
    public BlogCategory getCategory(String id);
    public boolean viewed(String id);
}
