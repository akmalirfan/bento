/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import common.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Akmal Irfan
 */
@WebServlet(name = "AddNewUserServlet", urlPatterns = {"/AddNewUserServlet"})
public class AddNewUserServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /*String query =
                    "INSERT INTO user (username, password, phone, email, address) " +
                    "VALUES ('" + request.getParameter("username")
                    + "','" + request.getParameter("password")
                    + "','" + request.getParameter("phone")
                    + "','" + request.getParameter("email")
                    + "','" + request.getParameter("address") + "')";
            DB.update(query);*/
            
            String query =
                    "INSERT INTO user (username, password, phone, email, address, level)"
                    + "VALUES(?,?,?,?,?,?)";
            
            try (PreparedStatement pstmt = DB.getConnection().prepareStatement(query)) {
                pstmt.setString(1, request.getParameter("username"));
                pstmt.setString(2, request.getParameter("password"));
                pstmt.setString(3, request.getParameter("phone"));
                pstmt.setString(4, request.getParameter("email"));
                pstmt.setString(5, request.getParameter("address"));
                pstmt.setInt(6, 1);
                pstmt.executeUpdate();

                pstmt.close();
            } catch (SQLException se) {
                System.out.println(se);
            }
            
            response.sendRedirect(request.getContextPath() + "/login.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
