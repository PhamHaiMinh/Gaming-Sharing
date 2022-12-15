/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CategoryDao;
import Dao.Impl.CategoryDaoImpl;
import Dao.Impl.ProductDaoImpl;
import Dao.ProductDao;
import Model.Category;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Random;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})
public class Home extends HttpServlet {

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
        ProductDao productDao = new ProductDaoImpl();
        List<Product> products = productDao.getAll();
        CategoryDaoImpl categoryDao = new CategoryDaoImpl();

        List<Category> categories = categoryDao.getAll();
        List<Product> productsNew = productDao.getTop6New();  
        List<Product> productsView = productDao.getTop6View();

        request.setAttribute("productsNew", productsNew);   
        request.setAttribute("productsView", productsView);
        request.setAttribute("categories", categories);

        request.setAttribute("slide1", getRandomElement(products).getImage());
        request.setAttribute("slide2", getRandomElement(products).getImage());
        request.setAttribute("slide3", getRandomElement(products).getImage());
        request.setAttribute("slide4", getRandomElement(products).getImage());
        request.setAttribute("slide5", getRandomElement(products).getImage());
        request.setAttribute("slide6", getRandomElement(products).getImage());
        request.setAttribute("slide7", getRandomElement(products).getImage());
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    private Product getRandomElement(List<Product> list) {
        Random rand = new Random();
        return list.get(rand.nextInt(list.size()));
    }
}
