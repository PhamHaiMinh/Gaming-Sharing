package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Dao.AccountDao;
import Model.Account;
import Dao.Impl.AccountDaoImpl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author haimi
 */
@WebServlet(urlPatterns = {"/login"})
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account user = (Account) request.getSession().getAttribute("account");
        if (user == null) {
            String username = "";
            String password = "";
            Cookie ck[] = request.getCookies();
            for (Cookie ck1 : ck) {
                if (ck1.getName().equalsIgnoreCase("username")) {
                    username = ck1.getValue();
                }
                if (ck1.getName().equalsIgnoreCase("password")) {
                    password = ck1.getValue();
                }
            }
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.getRequestDispatcher("/common/login.jsp").forward(request, response);
        } else {
            int type = user.getRole();
            switch (type) {
                case 1:
                    response.sendRedirect(request.getContextPath() + "/admin");
                    break;
                case 2:
                    response.sendRedirect(request.getContextPath() + "/staff");
                    break;
                case 3:
                    response.sendRedirect(request.getContextPath());
                    break;
                default:
                    request.getRequestDispatcher("/common/login.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Account user = (Account) request.getSession().getAttribute("user");
        if (user == null) {
            AccountDao db = new AccountDaoImpl();
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();
            if (!isValid(password)) {
                // sai dinh dang pass
                request.setAttribute("username", username);
                request.setAttribute("password", password);
                request.setAttribute("errorPassword", "Password is not valid");
                request.getRequestDispatcher("common/login.jsp").forward(request, response);
            } else {
                Account u = db.login(username, password);
                if (u.getId() == 0) {
                    request.setAttribute("login", false);
                    request.setAttribute("username", username);
                    request.setAttribute("password", password);
                    request.getRequestDispatcher("common/login.jsp").forward(request, response);
                } else {
                    if (request.getParameter("remember") != null) {
                        Cookie userCookie = new Cookie("username", u.getUsername());
                        Cookie passCookie = new Cookie("password", u.getPassword());
                        userCookie.setMaxAge(60 * 60 * 24);
                        passCookie.setMaxAge(60 * 60 * 24);
                        response.addCookie(userCookie);
                        response.addCookie(passCookie);
                    }
                    request.getSession().setAttribute("account", u);
                    switch (u.getRole()) {
                        case 1:
                            response.sendRedirect(request.getContextPath() + "/admin");
                            break;
                        case 2:
                            response.sendRedirect(request.getContextPath() + "/staff");
                            break;
                        case 3:
                            response.sendRedirect(request.getContextPath());
                            break;
                        default:
                            request.setAttribute("login", false);
                            request.setAttribute("username", username);
                            request.setAttribute("password", password);
                            request.getRequestDispatcher("/common/login.jsp").forward(request, response);
                    }
                }
            }
        } else {
            int type = user.getRole();
            switch (type) {
                case 1:
                    response.sendRedirect(request.getContextPath() + "/admin");
                    break;
                case 2:
                    response.sendRedirect(request.getContextPath() + "/staff");
                    break;
                case 3:
                    response.sendRedirect(request.getContextPath());
                    break;
                default:
                    request.getRequestDispatcher("/common/login.jsp").forward(request, response);
            }
        }

    }

    public static boolean isValid(String password) {
        String PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,16}$";
        Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }
}
