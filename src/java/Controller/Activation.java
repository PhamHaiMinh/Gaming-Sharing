/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class Activation extends HttpServlet {
    DBContext dbc = new DBContext();
    Connection connection = dbc.getConnection();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("key1");
        String username = request.getParameter("key2");
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement("SELECT email, username, active FROM Account WHERE email=? AND username=? AND active=0");
            ps.setString(1, email);
            ps.setString(2, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ps = connection.prepareStatement("UPDATE Account SET active=1 where email=? and username=?");
                ps.setString(1, email);
                ps.setString(2, username);
                int i = ps.executeUpdate();
                
                 response.setContentType("text/html");
                if(i==1){
                    response.sendRedirect("login");
                }else{
                    response.sendRedirect("register");
                }
            }
        } catch (IOException | SQLException e) {
            System.out.println("Error "+e);
        }
    }
}
