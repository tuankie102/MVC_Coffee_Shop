/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.client;

import Model.*;
import Service.*;
import java.io.IOException;
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
@WebServlet(urlPatterns = {"/UpdateQuantityServlet"})
public class UpdateQuantityServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int itemId =Integer.parseInt(req.getParameter("itemId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        CoffeeService coffeeService = new CoffeeService();
        HttpSession session = req.getSession();
        Order order = (Order)session.getAttribute("order");
        for(Item item : order.getItems())
        {
            if(item.getId()==itemId)
            {
                item.setQuantity(quantity);
                break;
            }
        }
        session.setAttribute("order", order);
    }
    
}
