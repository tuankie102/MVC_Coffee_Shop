package Controller.admin;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(urlPatterns = {"/login"})
public class LoginSession extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String username = req.getParameter("fUsername");
       String password = req.getParameter("fPassword");
        
        if(username.equals("tuankie102") && password.equals("123123Bb") )
        {
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("username", username);
            httpSession.setMaxInactiveInterval(10);
            
            resp.sendRedirect("admin");
        }
        else
        {
           resp.sendRedirect("index");       
        }
    }
    
    
    
}