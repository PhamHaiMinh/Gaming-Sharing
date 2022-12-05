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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author haimi
 */
public class ListProduct extends HttpServlet {

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
  protected void doGet(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    // DAO import
    ProductDao pdao = new ProductDaoImpl();
    CategoryDao categoryDaoImpl = new CategoryDaoImpl();
    String sort = request.getParameter("sort") != null
      ? request.getParameter("sort").trim()
      : "";
    String name = request.getParameter("search") != null
      ? request.getParameter("search").trim()
      : "";
    int categoryId = request.getParameter("category") != null
      ? Integer.parseInt(request.getParameter("category"))
      : 0;
    int minPrice = request.getParameter("minPrice") != null &&
      !"".equals(request.getParameter("minPrice"))
      ? Integer.parseInt(request.getParameter("minPrice"))
      : 0;
    int maxPrice = request.getParameter("maxPrice") != null &&
      !"".equals(request.getParameter("maxPrice"))
      ? Integer.parseInt(request.getParameter("maxPrice"))
      : 0;
    List<Category> categories = new ArrayList<>();
    Category all = new Category();
    all.setId(0);
    all.setName("Tất cả");
    categories.add(all);
    for (Category cat : categoryDaoImpl.getAll()) {
      categories.add(cat);
    }
    List<Product> products = pdao.search(
      sort,
      categoryId,
      minPrice,
      maxPrice,
      name
    );
    request.setAttribute("sort", sort);
    request.setAttribute("search", name);
    request.setAttribute("categoryId", categoryId);
    request.setAttribute("minPrice", minPrice);
    request.setAttribute("maxPrice", maxPrice);
    request.setAttribute("categories", categories);
    request.setAttribute("products", products);
    request.getRequestDispatcher("productList.jsp").forward(request, response);
  }
}
