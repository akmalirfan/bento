package user;

import common.DB;
import common.ResultList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kiwi (original author) & Irfan
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
            String username = request.getParameter("inputUsername");
            String password = request.getParameter("inputPassword");
            HttpSession session = ((HttpServletRequest) request).getSession();
            //String query = "SELECT * FROM user AS u, profile AS p WHERE u.username = p.username AND u.username='" + username + "'";
            String query = "SELECT * FROM user WHERE username = '"+username+"'";
            System.out.println(query);
            ResultList rl = DB.query(query);
            
            if (rl != null) {
                if (rl.next()) {
                    int level = Integer.parseInt(rl.getString("level"));
                    if (rl.getString("password").equals(password)) { // If valid password
                        session.setAttribute("User", username); // Saves username string in the session object
                        session.setAttribute("name",  rl.getString("name"));
                        session.setAttribute("viewPermission",  rl.getString("viewPermission"));
                        
                        session.setAttribute("userType", (level == 0 ? "admin" : "user"));
                        response.sendRedirect(request.getContextPath() + "/index.jsp");
                    } else { // Password does not match, i.e., invalid user password
                        session.setAttribute("Login Error", "Invalid password.");
                        response.sendRedirect(request.getContextPath() + "/login.jsp");
                    }
                } else { // No record in the result set, i.e., invalid username
                    session.setAttribute("Login Error", "User not found.");
                    response.sendRedirect(request.getContextPath() + "/login.jsp");
                }
            } else {
                session.setAttribute("Login Error", "Error while accessing database.");
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
            //response.sendRedirect(request.getContextPath() + "/index.jsp");
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
