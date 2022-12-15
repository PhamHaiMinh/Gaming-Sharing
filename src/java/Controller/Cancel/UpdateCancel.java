/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Cancel;

import Dao.Impl.CancelDaoImpl;
import Dao.Impl.CategoryDaoImpl;
import Model.Cancel;
import Model.Category;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class UpdateCancel extends HttpServlet {

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
        CancelDaoImpl cancelDaoImpl = new CancelDaoImpl();
        int id = request.getParameter("id") != null
                ? Integer.parseInt(request.getParameter("id"))
                : 0;
        Cancel cancel = cancelDaoImpl.get(id);
        request.setAttribute("cancel", cancel);
        request.getRequestDispatcher("/staff/cancel/update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CancelDaoImpl cancelDaoImpl = new CancelDaoImpl();
        int id = request.getParameter("id") != null
                ? Integer.parseInt(request.getParameter("id"))
                : 0;
        String name = request.getParameter("name").trim();
        boolean status = false;
        if (name != null && name.matches(".*\\w.*")) {
            Cancel cancel = new Cancel(id, name);
            status = cancelDaoImpl.update(cancel);
            response.sendRedirect(
                    request.getContextPath() + "/staff/cancel?status=" + status
            );
        } else {
            response.sendRedirect(
                    request.getContextPath() + "/staff/cancel?status=" + status
            );
        }
    }
}
