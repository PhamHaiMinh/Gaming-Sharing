/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.Impl.ProductDaoImpl;
import Dao.Impl.UserDaoImpl;
import Dao.ProductDao;
import Dao.UserDao;
import Model.Account;
import Model.Cart;
import Model.CartItem;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Checkout extends HttpServlet {

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
            out.println("<title>Servlet Checkout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Checkout at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        if (session.getAttribute("account") != null) {
            Account a = (Account) session.getAttribute("account");
            UserDao dao = new UserDaoImpl();
            User account = dao.get(a.getId());
            String address = dao.getAddress(a.getId());
            request.setAttribute("user", account);
            request.setAttribute("address", address);

        }
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Object object = session.getAttribute("cart");
        ProductDao pdao = new ProductDaoImpl();
        Cart cart = null;
        List<CartItem> items = new ArrayList<>();
        String mess = "";
        // Check the variable object is not null or not
        if (object != null) {
            cart = (Cart) object;
            for (CartItem item : cart.getItems()) {
                Product product = pdao.getProductById(String.valueOf(item.getProduct().getId()));

                int quantity = item.getQuantity();
                if (product.getQuantity() == 0) {
                    mess += "The product: " + product.getName() + " run out of stock <Br> ";
                }
                if (item.getQuantity() > product.getQuantity()) {
                    mess += "The product: " + product.getName() + " just have " + product.getQuantity() + " in stockNot enough to by.  <Br>";
                }
                CartItem newitem = new CartItem(product, quantity);
                items.add(newitem);
            }
            cart.setItems(items);
        } else {
            cart = new Cart(items);
            response.getWriter().print(cart.getItems().size());
        }
        if (true) {

        }
        if (mess.equals("")) {
            response.sendRedirect("home");
        } else {
            response.getWriter().print("<h1 style=\"text-align: center;\">Error</h1>");
            response.getWriter().print("<h1 style=\"text-align: center;\">"+mess+"</h1>");
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
