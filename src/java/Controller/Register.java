/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.Impl.AccountDaoImpl;
import Model.Account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Register extends HttpServlet {

    private final AccountDaoImpl account = new AccountDaoImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn-register") != null) {
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Account acc = new Account();
            acc.setEmail(email);
            acc.setUsername(username);
            acc.setPassword(password);

            AccountDaoImpl ad = new AccountDaoImpl();

            String str;
            try {
                str = ad.register(acc);
                if (str.equals("Success")) {
//                    out.println("<script type=\"text/javascript\">");
//                    out.println("alert('Check your email to verify');");
//                    out.println("window.location.href = \"login.jsp\";");
//                    out.println("</script>");
                    request.setAttribute("success", str + "! Check your email to verify");
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.include(request, response);
                } else if (str.equals("Username already exist")) {
                    request.setAttribute("userError", "Username '" + username + "' already exist");
                    request.setAttribute("example", "You can try: " + username + "1, " + username + "12, " + username + "123");
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.include(request, response);
                } else if (str.equals("Email already exist")) {
                    request.setAttribute("emailError", "Email '" + email + "' already exist");
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.include(request, response);
                } else {
                    request.setAttribute("error", str);
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.include(request, response);
                    response.sendRedirect("register.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }
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
