/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.BlogDao;
import Dao.DBContext;
import Model.Blog;
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
public class BlogDaoImpl implements BlogDao {

    private PreparedStatement pstm;
    private Statement stm;
    private ResultSet rs;
    DBContext db = new DBContext();

    @Override
    public int getTotal(String title, String catId, String create_time) {
        int total = 0;
        String sql = "SELECT COUNT(id) AS total FROM Blog AS b WHERE 1";
        if (!"".equals(title)) {
            sql += " AND b.title LIKE '%" + title + "%'";
        }
        if (!"".equals(catId)) {
            sql += " AND b.categoryId='" + catId + "'";
        }
        if (!"".equals(create_time)) {
            sql += " AND b.create_time ='" + create_time + "'";
        }
        try {
            Connection conn = db.getConnection();
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    @Override
    public boolean deleteTinTucAdmin(String[] listIdDelete) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Blog> getListBlogStaff(String title, String catId, String create_time) {
        ArrayList<Blog> listBlog = new ArrayList<Blog>();
        String sql = "SELECT b.id, b.title, c.name, b.create_time,"
                + " b.viewed, b.image, b.browser FROM Blog AS b, BlogCategory AS c"
                + " WHERE b.categoryId = c.id"
                + " ORDER BY b.create_time DESC ";
        try {
            Connection conn = db.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getString(1));
                blog.setTitle(rs.getString(2));
                blog.setCategory(rs.getString(3));

                String[] tg = rs.getString(4).split("-");
                tg[2] += "/" + tg[1] + "/" + tg[0];
                blog.setCreate_time(tg[2]);

                blog.setViewed(rs.getInt(5));
                blog.setImage(rs.getString(6));
                blog.setBrowser(rs.getInt(7));
                listBlog.add(blog);
            }
            db.closeConnection(conn, pstm, rs);
            pstm.close();
        } catch (Exception e) {
            e.getStackTrace();
        }
        return listBlog;
    }

    @Override
    public ArrayList<Blog> getListBlog(String catId) {
        ArrayList<Blog> listBlog = new ArrayList<Blog>();
        String sql = "SELECT b.id,b.categoryId, b.title, b.body, b.create_time, b.image,b.viewed FROM Blog AS b"
                + " WHERE b.categoryId='" + catId + "' AND b.browser=1 ORDER BY t.create_time DESC,b.prioritized DESC LIMIT ";
        try {
            Connection conn = db.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getString(1));
                blog.setCatId(rs.getString(2));
                blog.setTitle(rs.getString(3));
                blog.setBody(rs.getString(4));
                String[] tg = rs.getString(5).split("-");
                tg[2] += "-" + tg[1] + "-" + tg[0];
                blog.setCreate_time(tg[2]);
                blog.setImage(rs.getString(6));
                blog.setViewed(rs.getInt(7));
                listBlog.add(blog);
            }
            db.closeConnection(conn, pstm, rs);
        } catch (Exception e) {
            e.getStackTrace();
        }
        return listBlog;
    }

    @Override
    public ArrayList<Blog> getRelatedBlog(String id, String catId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Blog> getRecommendBlog(String relate) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean viewed(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int getTotal(String title, String catId) {
        int total = 0;
        String sql = "SELECT COUNT(id) AS total FROM Blog AS b WHERE browser=1";
        if (!"".equals(title)) {
            sql += " AND b.title LIKE '%" + title + "%'";
        }
        if (!"".equals(catId)) {
            sql += " AND b.categoryId='" + catId + "'";
        }
        try {
            Connection conn = db.getConnection();
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    @Override
    public Blog get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Blog> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(Blog item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Blog item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void setActive(String id, int browser) {
        String sql = "UPDATE Blog SET browser = ? WHERE id = ?";
        try {
            Connection conn = db.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, browser);
            pstm.setString(2, id);
            pstm.executeUpdate();
            db.closeConnection(conn, pstm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
