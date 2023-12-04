/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuocbt.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phuocbt.Mobile.MobileDAO;
import phuocbt.Mobile.MobileDTO;
import phuocbt.User.UserDAO;
import phuocbt.User.UserDTO;

/**
 *
 * @author phuoc
 */
public class SearchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SUCCESSSTAFF = "staff.jsp";
    private static final String ERRORSTAFF = "staff.jsp";
    private static final String SUCCESSUSER = "user.jsp";
    private static final String ERRORUSER = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String message = "";
        String url = "";
        try {
            HttpSession sess = request.getSession();
            UserDTO user = (UserDTO) sess.getAttribute("LOGIN_USER");
            String search = request.getParameter("search");
            String searchValue = "You searched: " + search;
            if (user.getRole() == 0) {
                int min = Integer.parseInt(request.getParameter("minPrice"));
                int max = Integer.parseInt(request.getParameter("maxPrice"));
                MobileDAO dao = new MobileDAO();
                List<MobileDTO> listMobile = dao.getListMobile(search, min, max);
                if (listMobile.isEmpty()) {
                    message = "No search result";
                    request.setAttribute("SEARCH_ERROR", message);
                    url = ERRORUSER;
                } else {
                    url = SUCCESSUSER;
                    sess.setAttribute("LIST_MOBILE", listMobile);
                    request.setAttribute("SEARCH_MESSAGE", searchValue);
                }
            }else if(user.getRole() == 1 || user.getRole() == 2){
                MobileDAO dao = new MobileDAO();
                List<MobileDTO> listMobile = dao.getListMobileAD(search);
                String updateFail = (String) request.getAttribute("UPDATE_FAIL");
                if (listMobile.isEmpty()) {
                    message = "No search result";
                    request.setAttribute("SEARCH_ERROR", message);
                    url = ERRORSTAFF;
                } else {
                    url = SUCCESSSTAFF;
                    request.setAttribute("LIST_MOBILE", listMobile);
                    request.setAttribute("search", search);
                    request.setAttribute("SEARCH_MESSAGE", searchValue);
                    request.setAttribute("UPDATE_FAIL", updateFail);
                }
            }
        } catch (Exception e) {
            log("Error at AddToCartController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
