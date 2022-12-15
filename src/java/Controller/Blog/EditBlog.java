/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Blog;

import Dao.Impl.BlogCategoryDaoImpl;
import Dao.Impl.BlogDaoImpl;
import Model.Blog;
import Model.BlogCategory;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class EditBlog extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditBlog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBlog at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDaoImpl blogDao = new BlogDaoImpl();
        String id = request.getParameter("id");
        Blog old = blogDao.getBlogDetail(id);
        if (request.getParameter("edit") != null) {
            String title, source, body, category;
            int priority;
            title = request.getParameter("title");
            category = request.getParameter("category");
            source = request.getParameter("source");
            body = request.getParameter("body");
            priority = Integer.parseInt(request.getParameter("priority"));
            Part filePart = request.getPart("image");
            Blog blog = new Blog();
            blog.setId(id);
            blog.setCatId(category);
            blog.setTitle(title);
            blog.setBody(body);
            blog.setSource(source);
            blog.setPriority(priority);
            String image = blogDao.uploadImage(filePart, request, blog);
            blog.setImage(image);

            if (blogDao.update(blog)) {
                boolean status = blogDao.update(blog);
                response.sendRedirect(request.getContextPath() + "/staff/blog/list-blog?status=" + status);
            } else {
                request.setAttribute("error", "Thêm dữ liệu vào database thất bại");
                BlogCategoryDaoImpl blogCat = new BlogCategoryDaoImpl();
                List<BlogCategory> listCategory = blogCat.getAll();
                request.setAttribute("listCategory", listCategory);
                if (old != null) {
                    request.setAttribute("blog", old);
                    request.getRequestDispatcher("edit_blog.jsp").forward(request, response);
                }
            }

        }
        if (request.getParameter("showedit") != null) {
            BlogCategoryDaoImpl blogCat = new BlogCategoryDaoImpl();
            List<BlogCategory> listCategory = blogCat.getAll();
            request.setAttribute("listCategory", listCategory);
            if (old != null) {
                request.setAttribute("blog", old);
                request.getRequestDispatcher("edit_blog.jsp").forward(request, response);
            } else {
                response.sendRedirect("list-blog");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
