/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.client;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Service.CoffeeService;
import Model.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpSession;
/**
 *
 * @author ADMIN
 */
@WebServlet(urlPatterns = {"/AddtoCart"})
public class AddtoCartController extends HttpServlet{
    private CoffeeService coffeeService;
    private int i;
    @Override
    public void init() throws ServletException {
        coffeeService = new CoffeeService();
        i=0;
        super.init(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id  =Integer.parseInt(req.getParameter("cfId"));
        Coffee coffee = coffeeService.getCoffeebyId(id);
        int quantity = 1;
        if(coffee!=null)
        {
            HttpSession session = req.getSession();
            if(session.getAttribute("order")==null)
            {
                Order order = new Order();
                ArrayList<Item> listItems = new ArrayList<Item>();
                i++;
                Item item = new Item(i,coffee,quantity);
                listItems.add(item);
                order.setItems(listItems);
                session.setAttribute("order", order);
            }
            else
            {
                Order order = (Order)session.getAttribute("order");
                Boolean check = false;
                for(Item item : order.getItems())
                {
                    if(item.getCoffee().getId()==coffee.getId() && item.getCoffee().getMaLoai()==coffee.getMaLoai())
                    {
                        item.setQuantity(item.getQuantity()+quantity);
                        check = true;
                    }
                }
                if(check == false)
                {
                    i++;
                    Item item = new Item(i, coffee, quantity);
                    order.getItems().add(item);
                }
                session.setAttribute("order", order);
            }
            resp.sendRedirect("cart");
        }
        else 
        {
            resp.sendRedirect("cart");
        }
    }
    
}
