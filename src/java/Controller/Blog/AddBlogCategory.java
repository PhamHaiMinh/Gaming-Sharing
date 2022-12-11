/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Blog;

import Dao.Impl.BlogCategoryDaoImpl;
import Model.BlogCategory;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AddBlogCategory extends HttpServlet {

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
            out.println("<title>Servlet AddBlogCategory</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBlogCategory at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("blog/add_blog_category.jsp").forward(request, response);
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
        BlogCategoryDaoImpl blogCat = new BlogCategoryDaoImpl();
			String error="";
			if(request.getParameter("add")!=null){
				String catName, description;
				catName = request.getParameter("catName");
				if(blogCat.isCategoryExist(catName)){
					error+= "Tên danh mục đã bị trùng";
				}else{
					description = request.getParameter("description");
					BlogCategory blogCategory = new BlogCategory();
					blogCategory.setName(catName);
					blogCategory.setDescription(description);
					
					if(blogCat.insert(blogCategory)){
						error += "Thêm danh mục thành công";
						request.setAttribute("msg", error);
						request.getRequestDispatcher("blog/list_blog_category.jsp").forward(request, response);
						return;
					}else{
						error+="Thêm dữ liệu vào database thất bại";
					}
				}
				request.setAttribute("error", error);
				request.getRequestDispatcher("blog/add_blog_category.jsp").forward(request, response);
			}
			if(request.getParameter("showadd")!=null){
				request.getRequestDispatcher("blog/add_blog_category.jsp").forward(request, response);
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
