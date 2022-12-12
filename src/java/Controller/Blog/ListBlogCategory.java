/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Blog;

import Dao.Impl.BlogCategoryDaoImpl;
import Model.BlogCategory;
import Model.Pagination;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListBlogCategory", urlPatterns = {"/staff/ListBlogCategory"})
public class ListBlogCategory extends HttpServlet {

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
            out.println("<title>Servlet ListBlogCategory</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListBlogCategory at " + request.getContextPath() + "</h1>");
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
        String msg = "";
        if (request.getAttribute("msg") != null) {
            msg = (String) request.getAttribute("msg");
        }
        BlogCategoryDaoImpl blogCat = new BlogCategoryDaoImpl();
        Pagination pagination = new Pagination();

        int current_page = 1;
        if (request.getParameter("page") != null) {
            current_page = Integer.parseInt(request.getParameter("page"));
        }
        int total = blogCat.getTotalSearch("");
        int row_count = pagination.getRowCountAdmin();
        request.setAttribute("pages", pagination.getPages(total, row_count));
        request.setAttribute("current_page", current_page);
        List<BlogCategory> listCategory = blogCat.getAll();
        request.setAttribute("listCategory", listCategory);
        if (listCategory.size() == 0) {
            msg += "\nKhông tồn tại dữ liệu!";
        } else {
            request.setAttribute("listCategory", listCategory);
        }
        request.setAttribute("error", msg);
        request.getRequestDispatcher("blog/list_blog_category.jsp").forward(request, response);
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
