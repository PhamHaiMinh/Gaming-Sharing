/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.product;

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
public class CreateProductStaff extends HttpServlet {

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
    CategoryDao categoryDaoImpl = new CategoryDaoImpl();
    List<Category> categories = categoryDaoImpl.getAll();
    request.setAttribute("categories", categories);
    request
      .getRequestDispatcher("/staff/product/productAdd.jsp")
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
    String name = request.getParameter("name").trim();
    Part filePart = request.getPart("image");
    int categoryId = request.getParameter("categoryId") != null
      ? Integer.parseInt(request.getParameter("categoryId"))
      : 0;
    int quantity = request.getParameter("quantity") != null
      ? Integer.parseInt(request.getParameter("quantity"))
      : 0;
    int price = request.getParameter("price") != null
      ? Integer.parseInt(request.getParameter("price"))
      : 0;
    String description = request.getParameter("description").trim();
    Product product = new Product(
      name,
      price,
      quantity,
      description,
      categoryId
    );
    if (dao.insert(product)) {
      product = dao.getLast();
      String image = dao.uploadImage(filePart, request, product);
      product.setImage(image);
      boolean status = dao.update(product);
      response.sendRedirect(
        request.getContextPath() + "/staff/product?status=" + status
      );
    } else {
      CategoryDao categoryDaoImpl = new CategoryDaoImpl();
      List<Category> categories = categoryDaoImpl.getAll();
      request.setAttribute("categories", categories);
      request
        .getRequestDispatcher("/staff/product/productAdd.jsp")
        .forward(request, response);
    }
  }
}
