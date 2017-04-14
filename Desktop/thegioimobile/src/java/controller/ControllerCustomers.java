/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.Customers;
import model.Customers1;
import model.CustomersModel;
import model.Customerss;
import model.Products;

/**
 *
 * @author Nguyen
 */
public class ControllerCustomers extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try{
            String action = request.getParameter("action");
            HttpSession sesson = request.getSession(true);
            if(action.equals("Login")){
                String user = request.getParameter("txtUser");
                String pass = request.getParameter("txtPass");
                CustomersModel cus = new CustomersModel();
                boolean exist = cus.checkLogin(user, pass);
                String url = "error.jsp";
                if(exist){
                    url = "loading_login.jsp";
                    //HttpSession sesson = request.getSession(true);
                    sesson.setAttribute("USER", user);
                }
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if(action.equals("Register")){
                String user = request.getParameter("txtUser");
                String pass = request.getParameter("txtPass");
                String hoten = request.getParameter("txtHoTen");
                String email = request.getParameter("txtEmail");
                Customerss c = new Customerss();
                c.insert(user, pass, hoten,email);
                RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
                rd.forward(request, response);
            }
            else if(action.equals("Logout")){
                sesson.removeAttribute("USER");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
            else if(action.equals("Delete")){
                String user = request.getParameter("txtUser");
                Customers1 c = new Customers1();
                c.delete(user);
                RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
                rd.forward(request, response);
            }
//            else if(action.equals("Delete")){
//                String id = request.getParameter("txtCusID");
//                boolean ok = CustomersDAO.xoaKhachHang(id);
//                if(ok){
//                    String url="ControllerCustomers?txtTen=&action=Search";
//                    RequestDispatcher rd = request.getRequestDispatcher(url);
//                    rd.forward(request, response);
//                }
//            }
//            else if(action.equals("Search")){
//                String tenkh = request.getParameter("txtTen");
//                List<Customers> listKH = CustomersDAO.layDanhSachKH(tenkh);
//                request.setAttribute("listKH", listKH);
//                String url="customer.jsp";
//                RequestDispatcher rd = request.getRequestDispatcher(url);
//                rd.forward(request, response);
//            }
        }
        catch(Exception e){
            e.printStackTrace();
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
