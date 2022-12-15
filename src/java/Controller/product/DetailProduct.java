/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.product;

import Dao.Impl.CategoryDaoImpl;
import Dao.Impl.ProductDaoImpl;
import Dao.ProductDao;
import Model.Category;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author haimi
 */
public class DetailProduct extends HttpServlet {

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
        ProductDao productDaoImpl = new ProductDaoImpl();
        CategoryDaoImpl categoryDao = new CategoryDaoImpl();
        int id = request.getParameter("id") != null
                ? Integer.parseInt(request.getParameter("id"))
                : 0;
        Product product = productDaoImpl.getofUser(id);
        List<Product> products = productDaoImpl.getTop5OfCategory(product.getCategory().getId());

        List<Category> categories = categoryDao.getAll();
        request.setAttribute("categories", categories);
        request.setAttribute("products", products);
        request.setAttribute("product", product);
        request
                .getRequestDispatcher("productDetail.jsp")
                .forward(request, response);
    }

}
