/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.Impl.AccountDaoImpl;
import Model.Account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class Register extends HttpServlet {

    private final AccountDaoImpl account = new AccountDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("common/register.jsp").forward(request, response);
    }

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
            String str;
            str = account.register(acc);
            switch (str) {
                case "Success": {
                    request.setAttribute("success", str + "! Check your email to verify");
                    RequestDispatcher rd = request.getRequestDispatcher("common/register.jsp");
                    rd.include(request, response);
                    break;
                }
                case "Username already exist": {
                    request.setAttribute("userError", "Username '" + username + "' already exist");
                    request.setAttribute("example", "You can try: " + username + "1, " + username + "12, " + username + "123");
                    RequestDispatcher rd = request.getRequestDispatcher("common/register.jsp");
                    rd.include(request, response);
                    break;
                }
                default: {
                    request.setAttribute("error", str);
                    RequestDispatcher rd = request.getRequestDispatcher("common/register.jsp");
                    rd.include(request, response);
                    break;
                }
            }
        }
    }

}
