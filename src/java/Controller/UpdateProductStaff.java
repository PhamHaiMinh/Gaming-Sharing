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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author haimi
 */
@MultipartConfig
public class UpdateProductStaff extends HttpServlet {

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
    ProductDao productDaoImpl = new ProductDaoImpl();
    int id = request.getParameter("id") != null
      ? Integer.parseInt(request.getParameter("id"))
      : 0;
    Product product = productDaoImpl.get(id);
    CategoryDao categoryDaoImpl = new CategoryDaoImpl();
    List<Category> categories = categoryDaoImpl.getAll();
    request.setAttribute("categories", categories);
    request.setAttribute("product", product);
    request
      .getRequestDispatcher("productUpdate.jsp")
      .forward(request, response);
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
  protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    ProductDao dao = new ProductDaoImpl();
    int id = request.getParameter("id") != null
      ? Integer.parseInt(request.getParameter("id"))
      : 0;
    String name = request.getParameter("name").trim();
    Part filePart = request.getPart("image");
    int categoryId = Integer.parseInt(request.getParameter("categoryId"));
    int price = Integer.parseInt(request.getParameter("price"));
    String description = request.getParameter("description").trim();
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    Product product = new Product(
      id,
      name,
      price,
      quantity,
      description,
      categoryId
    );
    String image = dao.uploadImage(filePart, request, product);
    product.setImage(image);
    boolean status = dao.update(product);
    response.sendRedirect(
      request.getContextPath() + "/staff/product?status=" + status
    );
  }
}
