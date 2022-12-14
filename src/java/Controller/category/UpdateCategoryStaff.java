/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.category;

import Dao.Impl.CategoryDaoImpl;
import Model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author haimi
 */
public class UpdateCategoryStaff extends HttpServlet {

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
  // + sign on the left to edit the code.">
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
    CategoryDaoImpl categoryDaoImpl = new CategoryDaoImpl();
    int id = request.getParameter("id") != null
      ? Integer.parseInt(request.getParameter("id"))
      : 0;
    Category category = categoryDaoImpl.get(id);
    request.setAttribute("category", category);
    request
      .getRequestDispatcher("categoryUpdate.jsp")
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
    CategoryDaoImpl categoryDaoImpl = new CategoryDaoImpl();
    int id = request.getParameter("id") != null
      ? Integer.parseInt(request.getParameter("id"))
      : 0;
    String name = request.getParameter("name").trim();
    boolean status = false;
    if (name != null && name.matches(".*\\w.*")) {
      Category category = new Category(id, name);
      status = categoryDaoImpl.update(category);
      response.sendRedirect(
        request.getContextPath() + "/staff/category?status=" + status
      );
    } else {
      response.sendRedirect(
        request.getContextPath() + "/staff/category?status=" + status
      );
    }
  }
}
