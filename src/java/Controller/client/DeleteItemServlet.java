/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.client;

import Model.*;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(urlPatterns = {"/deleteItem"})
public class DeleteItemServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int itemId =Integer.parseInt(req.getParameter("itemId")) ;
        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");
        ArrayList<Item> listItem = order.getItems();
        if (order.getItems().size() > 0) {
            for (Item item : order.getItems()) {
               if(item.getId()==itemId) {
                   listItem.remove(item);
                   break;
               }
            }
        }
        
        session.setAttribute("order", order);
        
        resp.sendRedirect("cart");
    }
    
}
