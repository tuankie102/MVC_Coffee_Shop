package Controller.client;

import DAO.SQLDataAccess;
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/up-cmt-toDb")
public class UpCmttoDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Lấy thông tin comment từ form
		String name = request.getParameter("name");
		String comment = request.getParameter("comment");
                int rating = Integer.parseInt(request.getParameter("rating"));

		// Thêm comment vào cơ sở dữ liệu
		SQLDataAccess db = new SQLDataAccess();
		String sql = "INSERT INTO comments (user_name, comment_text, star_rating) VALUES (?, ?, ?)";
		Object[] params = { name, comment, rating };
		db.ExecuteSQL(sql, params);

		// Lấy tất cả comment từ cơ sở dữ liệu để hiển thị trên trang JSP
		ResultSet rs = db.getResultSet("SELECT * FROM comments");
		request.setAttribute("comments", rs);

		// Chuyển hướng sang trang comment.jsp để hiển thị các comment
		response.sendRedirect("index");
	}

}
