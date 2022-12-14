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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
/**
 *
 * @author Admin
 */
public class AddBlog extends HttpServlet {

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
            out.println("<title>Servlet AddBlog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBlog at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("add") != null) {
            System.out.println("vao 0");
            BlogDaoImpl blogDao = new BlogDaoImpl();
            String title , source , body , category;
            int priority = 0;

            title = request.getParameter("title");
            category = request.getParameter("category");
            source = request.getParameter("source");
            body = request.getParameter("body");
            Blog blog = new Blog();
            blog.setCatId(category);
            blog.setTitle(title);
            blog.setBody(body);

            blog.setPriority(priority);
            blog.setViewed(0);
            blog.setSource(source);
            System.out.println("vao 1");

            if (blogDao.insert(blog)) {
                response.sendRedirect("list-blog");
            } else {
                request.setAttribute("error", "Thêm dữ liệu vào database thất bại");
                request.getRequestDispatcher("add_blog.jsp").forward(request, response);
            }
        }

        if (request.getParameter("showadd") != null) {
            BlogCategoryDaoImpl blogCat = new BlogCategoryDaoImpl();
            List<BlogCategory> listCategory = blogCat.getAll();
            request.setAttribute("listCategory", listCategory);
            System.out.println("2");
            request.getRequestDispatcher("add_blog.jsp").forward(request, response);
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
