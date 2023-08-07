package Controller.admin;



import DAO.SQLDataAccess;
import java.io.IOException;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/up-order-toDb"})
public class UpOrdertoDbServlet extends HttpServlet {

    public void addOrder(String name, String email, String phone, String date, String time, String guests) {
        SQLDataAccess db = new SQLDataAccess();
        String sql = "INSERT INTO tbOrder (name, email, phone, date, time, guests) VALUES (?, ?, ?, ?, ?, ?)";
        Object[] param = {name, email, phone, date, time, guests};
        db.ExecuteSQL(sql, param);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String guests = request.getParameter("guests");

        UpOrdertoDbServlet bookingServlet = new UpOrdertoDbServlet();
        bookingServlet.addOrder(name, email, phone, date, time, guests);
        
        response.sendRedirect("index");
    }
}


