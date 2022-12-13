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

    @Override
    public BlogCategory getCategory(String id) {
        BlogCategory blogCat = null;
        String sql = "SELECT * FROM BlogCategory WHERE id='" + id + "'";
        System.out.println(sql);
        try {
            Connection conn = db.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                blogCat = new BlogCategory();
                blogCat.setId(rs.getString(1));
                blogCat.setName(rs.getString(2));
                blogCat.setDescription(rs.getString(3));
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
                blogCat.setId(rs.getString(1));
                blogCat.setName(rs.getString(2));
                blogCat.setDescription(rs.getString(3));
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
            pstm.setString(3, blogCat.getId());
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

    @Override
    public boolean viewed(String id) {
        String sql = "UPDATE BlogCategory SET viewed=viewed+1 WHERE id=? LIMIT 1";
        boolean result = false;
        try {
            Connection conn = db.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.executeUpdate();
            result = true;
            db.closeConnection(conn, pstm);
        } catch (Exception e) {
            e.getStackTrace();
        }
        return result;
    }

    @Override
    public BlogCategory get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
