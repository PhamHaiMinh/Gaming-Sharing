/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.BlogDao;
import Dao.DBContext;
import Model.Blog;
import Model.BlogCategory;
import Model.Category;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    public boolean deleteBlog(String[] listIdDelete) {
        String str = "";
        if (listIdDelete.length == 1) {
            str = "'" + listIdDelete[0] + "'";
        } else {
            for (int i = 0; i < listIdDelete.length - 1; i++) {
                str += "'" + listIdDelete[i] + "',";
            }
            str += "'" + listIdDelete[listIdDelete.length - 1] + "'";
        }
        String sql = "DELETE FROM Blog WHERE id IN (" + str + ")";
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
    public ArrayList<Blog> getListBlogStaff(String title, String catId, String create_time) {
        ArrayList<Blog> listBlog = new ArrayList<Blog>();
        String sql = "SELECT b.id, b.title, c.name, b.create_time,"
                + " b.viewed, b.image FROM Blog AS b, BlogCategory AS c"
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
        String sql = "SELECT b.id,b.categoryId, b.title, b.body, b.create_time,b.viewed, b.image FROM Blog AS b"
                + " WHERE b.categoryId='" + catId + "'  ORDER BY b.create_time DESC,b.priority DESC ";
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
                tg[2] += "/" + tg[1] + "/" + tg[0];
                blog.setCreate_time(tg[2]);
                blog.setViewed(rs.getInt(6));
                blog.setImage(rs.getString(7));
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
        ArrayList<Blog> listBlog = new ArrayList<Blog>();
        String sql = "SELECT b.id,b.categoryId, b.title, b.body, b.create_time,"
                + " b.viewed FROM Blog AS b "
                + " WHERE b.categoryId='" + catId + "' AND b.id!='" + id
                + "' ORDER BY t.thoigiandang DESC";
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
                blog.setViewed(rs.getInt(6));
                listBlog.add(blog);
            }
            db.closeConnection(conn, pstm, rs);
        } catch (Exception e) {
            e.getStackTrace();
        }
        return listBlog;
    }

    @Override
    public ArrayList<Blog> getRecommendBlog(String recommend) {
        String sort = "b.priority DESC,b.viewed DESC";
        if ("viewed".equals(recommend)) {
            sort = "b.viewed DESC,b.priority DESC";
        }
        ArrayList<Blog> listBlog = new ArrayList<Blog>();
        String sql = "SELECT b.id,b.categoryId, b.title, b.body, b.create_time,"
                + " b.viewed FROM Blog AS b ORDER BY " + sort;
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
                blog.setViewed(rs.getInt(6));
                listBlog.add(blog);
            }
            db.closeConnection(conn, pstm, rs);
        } catch (Exception e) {
            e.getStackTrace();
        }
        return listBlog;
    }

    @Override
    public boolean viewed(String id) {
        String sql = "UPDATE Blog SET viewed=viewed+1 WHERE id=? LIMIT 1";

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
    public boolean insert(Blog blog) {
        String sql = "INSERT INTO Blog (categoryId,title,body,"
                + "create_time,priority,viewed,source,image) VALUES (?,?,?,FORMAT(GetDate(),'yyyy-MM-dd'),?,?,?,?)";
        boolean result = false;
        try {
            Connection conn = db.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, blog.getCatId());
            pstm.setString(2, blog.getTitle());
            pstm.setString(3, blog.getBody());
            pstm.setInt(4, blog.getPriority());
            pstm.setInt(5, blog.getViewed());
            pstm.setString(6, blog.getSource());
            pstm.setString(7, blog.getImage());
            pstm.executeUpdate();
            result = true;
            db.closeConnection(conn, pstm);
        } catch (Exception e) {
            e.getStackTrace();
        }
        System.out.println(blog.toString());
        return result;
    }

    @Override
    public boolean update(Blog blog) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "UPDATE Blog SET categoryId=?,title=?,body=?,priority=?,source=?,image=? WHERE id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, blog.getCatId());
            ps.setString(2, blog.getTitle());
            ps.setString(3, blog.getBody());
            ps.setInt(4, blog.getPriority());
            ps.setString(5, blog.getSource());
            ps.setString(6, blog.getImage());
            ps.setString(7, blog.getId());
            System.out.println(ps.executeUpdate());

            System.out.println("run done");
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException ex) {
            Logger
                    .getLogger(BlogDaoImpl.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return false;
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

    private Blog getBlogCategory(Connection connection, Blog blog) {
        try {
            String quesry = "select * from BlogCategory where id=?";
            PreparedStatement prS = connection.prepareStatement(quesry);
            prS.setString(1, blog.getCatId());
            ResultSet resultSet = prS.executeQuery();
            while (resultSet.next()) {
                BlogCategory blogCategory = new BlogCategory();
                blogCategory.setId(resultSet.getString("id"));
                blogCategory.setName(resultSet.getString("name"));
                blog.setBlogCategory(blogCategory);
            }
        } catch (SQLException e) {
            Logger
                    .getLogger(BlogDaoImpl.class.getName())
                    .log(Level.SEVERE, null, e);
        }
        return blog;
    }

    @Override
    public String uploadImage(Part filePart, HttpServletRequest request, Blog item) {
        if (filePart.getSize() == 0) {
            return new BlogDaoImpl().get(Integer.parseInt(item.getId())).getImage();
        } else {
            if ((Integer.parseInt(item.getId())) != 0) {
                try {
                    String fileName = Paths
                            .get(filePart.getSubmittedFileName())
                            .getFileName()
                            .toString();
                    Cloudinary cloudinary = new Cloudinary(
                            ObjectUtils.asMap(
                                    "cloud_name",
                                    "dphdoh9qo",
                                    "api_key",
                                    "899222149965195",
                                    "api_secret",
                                    "MtwIam7__8S6GKlnSEPxG-6Akl0"
                            )
                    );
                    cloudinary.config.secure = true;
                    filePart.write(request.getRealPath("/image") + fileName);
                    Map path = ObjectUtils.asMap(
                            "public_id",
                            "Home/Images/Blog/" + item.getId(),
                            "overwrite",
                            true,
                            "resource_type",
                            "image"
                    );
                    Map uploadResult = cloudinary
                            .uploader()
                            .upload(request.getRealPath("image") + fileName, path);
                    filePart.delete();
                    System.out.println(uploadResult.get("secure_url").toString());
                    return uploadResult.get("secure_url").toString();
                } catch (IOException ex) {
                    Logger
                            .getLogger(BlogDaoImpl.class.getName())
                            .log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void destroyImage(int id) {
        try {
            Cloudinary cloudinary = new Cloudinary(
                    ObjectUtils.asMap(
                            "cloud_name",
                            "dphdoh9qo",
                            "api_key",
                            "899222149965195",
                            "api_secret",
                            "MtwIam7__8S6GKlnSEPxG-6Akl0"
                    )
            );
            cloudinary.config.secure = true;
            Map path = ObjectUtils.asMap("resource_type", "image");
            cloudinary
                    .uploader()
                    .destroy("Home/Images/Blog/" + Integer.toString(id), path);
        } catch (IOException ex) {
            Logger
                    .getLogger(BlogDaoImpl.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Blog getLast() {
        DBContext dBContext = new DBContext();
        Blog blog = new Blog();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select top 1  * from Blog ORDER BY id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                blog = new Blog(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getString("body"),
                        rs.getString("create_time"),
                        rs.getString("image"),
                        rs.getString("categoryId"),
                        rs.getInt("viewed"),
                        rs.getInt("priority"),
                        rs.getString("source")
                );
                blog = getBlogCategory(connection, blog);
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, e);
        }
        return blog;
    }

    @Override
    public Blog getBlogDetail(String id) {
        String sql = "SELECT b.*, c.name FROM Blog AS b, BlogCategory AS c"
                + " WHERE b.categoryId = c.id AND b.id ='" + id + "'";
        //System.out.println(sql);
        Blog blog = null;
        try {
            Connection conn = db.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(sql);
            if (rs.next()) {
                blog = new Blog();
                blog.setCategory(rs.getString("name"));
                blog.setId(rs.getString("id"));
                blog.setCatId(rs.getString("categoryId"));
                blog.setTitle(rs.getString("title"));
                blog.setBody(rs.getString("body"));
                String[] tg = rs.getString("create_time").split("-");
                tg[2] += "-" + tg[1] + "-" + tg[0];

                blog.setCreate_time(tg[2]);
                blog.setViewed(rs.getInt("viewed"));
                blog.setPriority(rs.getInt("priority"));
                blog.setSource(rs.getString("source"));
                blog.setImage(rs.getString("image"));
            }
            db.closeConnection(conn, pstm, rs);
        } catch (Exception e) {
            e.getStackTrace();
        }

        return blog;
    }

}
