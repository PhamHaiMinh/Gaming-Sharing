/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Cancel;

import Dao.Impl.CancelDaoImpl;
import Dao.Impl.OrderDAOImpl;
import Model.Cancel;
import Model.Order;
import Model.Page;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class ListCancel extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CancelDaoImpl cancelDaoImpl = new CancelDaoImpl();
        int page = request.getParameter("page") != null
                ? Integer.parseInt(request.getParameter("page"))
                : 1;
        String status = request.getParameter("status");
        List<Cancel> cancels = cancelDaoImpl.getAll(page);
        int count = cancelDaoImpl.getAll().size();
        int endpage = count / 5;
        if (count % 5 != 0) {
            endpage++;
        }
        Page pageClass = new Page(page, endpage);
        List<String> pages = pageClass.listPage();
        request.setAttribute("page", Integer.toString(page));
        request.setAttribute("pages", pages);
        request.setAttribute("cancels", cancels);
        request.setAttribute("status", status);
        request
                .getRequestDispatcher("/staff/cancel/list.jsp")
                .forward(request, response);
    }

}
