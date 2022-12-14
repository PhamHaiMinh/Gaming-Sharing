/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import Model.Blog;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public interface BlogDao extends BaseDao<Blog> {

    public void setActive(String id, int browser);

    public int getTotal(String title, String catId, String create_time);

    public boolean deleteBlog(String[] listIdDelete);

    public ArrayList<Blog> getListBlogStaff(String title, String catId, String create_time);

    public ArrayList<Blog> getListBlog(String catId);

    public ArrayList<Blog> getRelatedBlog(String id, String catId);

    public ArrayList<Blog> getRecommendBlog(String relate);

    public boolean viewed(String id);

    public int getTotal(String title, String catId);
}
