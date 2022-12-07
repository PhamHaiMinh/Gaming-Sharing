/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.BlogCategoryDao;
import Dao.DBContext;
import Model.BlogCategory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BlogCategoryDaoImpl implements BlogCategoryDao {

    private PreparedStatement pstm;
    private Statement stm;
    private ResultSet rs;
    DBContext db = new DBContext();

    public int getTotalSearch(String catName) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<BlogCategory> searchCategory(String name, int offset, int row_count) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public BlogCategory get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<BlogCategory> getAll() {
        ArrayList<BlogCategory> listCategory = new ArrayList<BlogCategory>();
        String sql = "SELECT * FROM BlogCategory";
        //System.out.println(sql);
        try {
            Connection conn = db.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                BlogCategory blogCat = new BlogCategory();
                blogCat.setName(rs.getString(1));
                blogCat.setDescription(rs.getString(1));
                listCategory.add(blogCat);
            }
            db.closeConnection(conn, pstm, rs);
        } catch (Exception e) {
            e.getStackTrace();
        }
        return listCategory;
    }

    @Override
    public boolean insert(BlogCategory item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(BlogCategory item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
