/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.Impl.ProductDaoImpl;
import Dao.ProductDao;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author haimi
 */
public class ListProductStaff extends HttpServlet {

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
    int page = request.getParameter("page") != null
      ? Integer.parseInt(request.getParameter("page"))
      : 1;
    String status = request.getParameter("status");
    List<Product> products = productDaoImpl.getAll(page);
    int count = productDaoImpl.getAll().size();
    int endpage = count / 5;
    if (count % 5 != 0) {
      endpage++;
    }
    request.setAttribute("endpage", endpage);
    request.setAttribute("products", products);
    request.setAttribute("status", status);
    request
      .getRequestDispatcher("product/productList.jsp")
      .forward(request, response);
  }
}