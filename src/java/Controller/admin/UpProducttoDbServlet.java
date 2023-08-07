package Controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import DAO.SQLDataAccess;
import javax.servlet.ServletContext;

import javax.servlet.annotation.WebServlet;

/**
 *
 * @author AD
 */
@WebServlet(urlPatterns = {"/up-prod-to-db"})
public class UpProducttoDbServlet extends HttpServlet {

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
            ServletContext context = request.getServletContext();
            String realpath = context.getRealPath("/assets/img");
            MultipartRequest multi = new MultipartRequest(request, realpath);
            String tenSP = multi.getParameter("fTsp");
            String donGia = multi.getParameter("fDonGia");
            String fileName = multi.getFilesystemName("fimg");
            String moTa = multi.getParameter("fMota");
            int maLoai =Integer.parseInt(multi.getParameter("fLoai"));
            SQLDataAccess con = new SQLDataAccess();
            String SQL = " insert into tbMenu(tenSP,donGia,hinhAnh,moTa,maLoai)"
                    + "values(?,?,?,?,?)";
            Object[] param = {tenSP, donGia, fileName, moTa, maLoai};
            int k = con.ExecuteSQL(SQL, param);
            response.sendRedirect("index");
        } catch (Exception ex) {
        }
    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request* @param response servlet response
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
