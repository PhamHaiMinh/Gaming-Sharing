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
import java.sql.SQLException;
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
        int total = 0;
        String sq = "";
        if (!"".equals(catName)) {
            sq += " AND name LIKE '%" + catName + "%'";
        }
        String sql = "SELECT COUNT(id) AS total FROM BlogCategory WHERE 1" + sq;
        // System.out.println(sql);
        try {
            Connection conn = db.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt("total");
            }
            db.closeConnection(conn, pstm, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // System.out.println(total);
        return total;
    }

    @Override
    public ArrayList<BlogCategory> searchCategory(String name, int offset, int row_count) {
        ArrayList<BlogCategory> listCategory = new ArrayList<BlogCategory>();
        String sqlLimit = " ORDER BY id LIMIT " + offset + "," + row_count;
        String sq = "";
        if (!"".equals(name)) {
            sq += " AND name LIKE '%" + name + "%'";
        }
        String sql = "SELECT * FROM BlogCategory WHERE 1" + sq + sqlLimit;
        try {
            Connection conn = db.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                BlogCategory blogCat = new BlogCategory();
                blogCat.setName(rs.getString(1));
                blogCat.setDescription(rs.getString(2));
                listCategory.add(blogCat);
            }
            db.closeConnection(conn, pstm, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listCategory;
    }

    @Override
    public BlogCategory get(int id) {
        BlogCategory blogCat = null;
        String sql = "SELECT * FROM BlogCategory WHERE id='" + id + "'";
        System.out.println(sql);
        try {
            Connection conn = db.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                blogCat = new BlogCategory();
                blogCat.setName(rs.getString(1));
                blogCat.setDescription(rs.getString(2));
                System.out.println(blogCat.getName());

            }
            db.closeConnection(conn, pstm, rs);
        } catch (Exception e) {
            e.getStackTrace();
        }
        return blogCat;
    }

    @Override
    public List<BlogCategory> getAll() {
        ArrayList<BlogCategory> listCategory = new ArrayList<BlogCategory>();
        String sql = "SELECT * FROM BlogCategory";
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
    public boolean insert(BlogCategory blogCat) {
        String sql = "INSERT INTO BlogCategory (name,description) VALUES (?,?)";
        boolean result = false;
        try {
            Connection conn = db.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, blogCat.getName());
            pstm.setString(2, blogCat.getDescription());
            pstm.executeUpdate();
            result = true;
            db.closeConnection(conn, pstm);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean update(BlogCategory blogCat) {
        String sql = "UPDATE BlogCategory SET name=?,description=? WHERE id=?";
        boolean result = false;
        try {
            Connection conn = db.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, blogCat.getName());
            pstm.setString(2, blogCat.getDescription());
            pstm.setInt(3, blogCat.getId());
            pstm.executeUpdate();
            result = true;
            db.closeConnection(conn, pstm);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean deleteCategory(String[] listIdDelete) {
        String sq = "";
        if (listIdDelete.length == 1) {
            sq = listIdDelete[0];
        } else {
            for (int i = 0; i < listIdDelete.length - 1; i++) {
                sq += listIdDelete[i] + "','";
            }
            sq += listIdDelete[listIdDelete.length - 1];
        }
        String sql = "DELETE FROM BlogCategory WHERE id IN ('" + sq + "')";
        int delete = 0;
        try {
            Connection conn = db.getConnection();
            stm = conn.createStatement();
            delete = stm.executeUpdate(sql);
            db.closeConnection(conn, pstm, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return delete != 0;
    }

    @Override
    public boolean isCategoryExist(String name) {
        String sql = "SELECT * FROM BlogCategory WHERE name = ?";
        boolean result = false;
        try {
            Connection conn = db.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, name);
            rs = pstm.executeQuery();
            if (rs.next()) {
                result = true;
            }
            db.closeConnection(conn, pstm, rs);
        } catch (Exception e) {
            e.getStackTrace();
        }
        return result;
    }
}
