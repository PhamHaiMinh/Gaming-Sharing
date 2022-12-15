/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.staff;

import Dao.Impl.AccountDaoImpl;
import Dao.Impl.AddressDAOImpl;
import Dao.Impl.OrderDAOImpl;
import Dao.Impl.ProductDaoImpl;
import Dao.Impl.UserDaoImpl;
import Model.District;
import Model.Product;
import Model.Province;
import Model.User;
import Model.Ward;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class OrderEdit extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditCancel</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCancel at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int order_id = Integer.parseInt(request.getParameter("id"));
        UserDaoImpl ud = new UserDaoImpl();
        OrderDAOImpl od = new OrderDAOImpl();
        ProductDaoImpl pd = new ProductDaoImpl();
        AddressDAOImpl ad = new AddressDAOImpl();
        User u = ud.get2(od.getUserID(order_id));
        request.setAttribute("user", u);
        ArrayList<Product> products = new ArrayList<>();
        ArrayList<Product> products_order = od.getListProductIDbyOrderID(order_id);
        for(Product p : products_order){
            products.add(pd.getProductbyOrder(p));
        }
        ArrayList<Province> provinces = ad.getAllProvinces();
        ArrayList<District> districts = ad.getAllDistricts();
        ArrayList<Ward> wards = ad.getAllWards();
        request.setAttribute("provinces", provinces);
        request.setAttribute("districts", districts);
        request.setAttribute("wards", wards);
        request.setAttribute("products", products);
        request.setAttribute("id", order_id);
        request.getRequestDispatcher("../edit.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int order_id = Integer.parseInt(request.getParameter("id"));
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        OrderDAOImpl od = new OrderDAOImpl();
        AccountDaoImpl ac = new AccountDaoImpl();
        AddressDAOImpl ad = new AddressDAOImpl();
        UserDaoImpl ud = new UserDaoImpl();
        //doi thg tin
        int user_id = od.getUserID(order_id);
        int account_id = ud.getAccountID(user_id);
        boolean phone_up = ud.updateUserPhone(user_id, phone);
        boolean email_up = ac.updateEmail(account_id, email);
        boolean address_up = ad.updateAddressDetail(user_id, address);
        boolean status = od.changeStatusID(order_id, 2);
        response.sendRedirect(request.getContextPath()+"/staff/order");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
