/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author Nguyen
 */
public class CartServlet extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            String command = request.getParameter("command");
            String code = request.getParameter("code");
            Cart cart = (Cart)session.getAttribute("cart");
        try{
            Long codeProduct = Long.parseLong(code);
            Product product = productDAO.getProduct(codeProduct);
            switch(command){
                case "plus":
                    if(cart.getCartItems().containsKey(codeProduct)){
                        cart.plusToCart(codeProduct, new Item(product, cart.getCartItems().get(codeProduct).getQuantity()));
                    }
                    else{
                        cart.plusToCart(codeProduct, new Item(product, 1));
                    }
                    break;
            }
        }
        catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("/PS04600_ASM_FINAL/index.jsp");
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("/PS04600_ASM_FINAL/index.jsp");
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
